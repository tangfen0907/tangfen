<template>
	<view>
  <view class="c_total">评论 {{ tableTotal }}</view>
  <template v-if="dataList && dataList.length">
    <view class="c_comment" v-for="(item1, index1) in dataList" :key="item1.id">
      <!-- 一级评论 -->
      <CommonComp
        :data="item1"
        @likeClick="() => likeClick({ item1, index1 })"
        @replyClick="() => replyClick({ item1, index1 })"
        @deleteClick="() => deleteClick({ item1, index1 })"
      />
      <view
        class="children_item"
        v-if="item1.children && item1.children.length"
      >
        <!-- 二级评论 -->
        <CommonComp
          v-for="(item2, index2) in item1.childrenShow"
          :key="item2.id"
          :data="item2"
          :pData="item1"
          @likeClick="() => likeClick({ item1, index1, item2, index2 })"
          @replyClick="() => replyClick({ item1, index1, item2, index2 })"
          @deleteClick="() => deleteClick({ item1, index1, item2, index2 })"
        />
        <!-- 展开折叠的二级评论 -->
        <view
          class="expand_reply"
          v-if="expandTxtShow({ item1, index1 })"
          @tap="() => expandReplyFun({ item1, index1 })"
        >
          <span class="txt">
            展开{{ item1.children.length - item1.childrenShow.length }}条回复
          </span>
          <uni-icons type="down" size="24" color="#007aff"></uni-icons>
        </view>
      </view>
    </view>
  </template>
  <!-- 空盒子 -->
  <view class="empty_box" v-else>
    <uni-icons type="chatboxes" size="36" color="#c0c0c0"></uni-icons>
    <view>
      <span class="txt"> 这里是一片荒草地, </span>
      <span class="txt click" @click="() => newCommentFun()">说点什么...</span>
    </view>
  </view>
  <!-- 评论弹窗 -->
  <uni-popup ref="cPopupRef" type="bottom" @change="popChange">
    <view class="c_popup_box">
      <view class="reply_text">
        <template v-if="Object.keys(replyTemp).length">
          <span class="text_aid">回复给</span>
          <span class="text_main">{{
            replyTemp.item1.item2
              ? replyTemp.item1.item2.user_name
              : replyTemp.item1.item1.user_name
          }}</span>
        </template>
        <span v-else class="text_main">发表新评论</span>
      </view>
      <view class="content">
        <view class="text_area">
          <uni-easyinput
            class="text_area"
            type="textarea"
            v-model="commentValue"
            :placeholder="commentPlaceholder"
            :focus="focus"
            trim
            autoHeight
            maxlength="300"
          ></uni-easyinput>
        </view>
        <view class="send_btn" @tap="() => sendClick()">发送</view>
      </view>
    </view>
  </uni-popup>
  <!-- 删除弹窗 -->
  <uni-popup ref="delPopupRef" type="dialog">
    <uni-popup-dialog
      mode="base"
      title=""
      content="确定删除这条评论吗?"
      :before-close="true"
      @close="delCloseFun"
      @confirm="delConfirmFun"
    ></uni-popup-dialog>
  </uni-popup>
  </view>
</template>

<script>
import CommonComp from "./componets/common";

export default {
  components: {
    CommonComp
  },
  props: {
    userInfo: {
      type: Object,
      default: () => ({})
    },
    tableData: {
      type: Array,
      default: () => []
    },
    tableTotal: {
      type: Number,
      default: 0
    },
    deleteMode: {
      type: String,
      default: "all"
    }
  },
  data() {
    return {
      dataList: [],
      replyTemp: {},
      isNewComment: false,
      focus: false,
      commentValue: "",
      commentPlaceholder: "说点什么...",
      delTemp: {},
	  index:0,
    };
  },
  watch: {
    tableData: {
      handler(newVal) {
        if (newVal.length !== this.dataList.length) {
          this.dataList = this.treeTransForm(newVal);
		  console.log("this.dataList:",this.dataList);
        }
      },
      deep: true,
      immediate: true
    }
  },
  methods: {
    treeTransForm(data) {
      let newData = JSON.parse(JSON.stringify(data));
      let result = [];
      let map = {};
      newData.forEach((item, i) => {
        item.owner = item.id === this.userInfo.id;
        map[item.id] = item;
      });
      newData.forEach((item) => {
        let parent = map[item.parent_id];
        if (parent) {
          (parent.children || (parent.children = [])).push(item);
          if (parent.children.length === 1) {
            (parent.childrenShow = []).push(item);
          }
        } else {
          result.push(item);
        }
      });
      return result;
    },
	setLike(item) {
      item.is_like = !item.is_like;
      item.like_count = item.is_like ? item.like_count + 1 : item.like_count - 1;
    },
    likeClick({ item1, index1, item2, index2 }) {
      let item = item2 || item1;
      this.setLike(item);
      this.$emit("likeFun", { params: item }, (res) => {
        this.setLike(item);
      });
    },
    replyClick(item1, index1, item2, index2) {
      this.replyTemp = JSON.parse(JSON.stringify({ item1, index1, item2, index2 }));
	  console.log(this.replyTemp,"===========");
      this.$refs.cPopupRef.open();
    },
    newCommentFun() {
      this.isNewComment = true;
      this.$refs.cPopupRef.open();
    },
    popChange(e) {
      if (!e.show) {
        this.commentValue = "";
        this.replyTemp = {};
        this.isNewComment = false;
      }
      this.focus = e.show;
    },
    sendClick() {
      let { item1, index1, item2, index2 } = this.replyTemp;
      let item = item2 || item1;
	  console.log(item);
      let params = {};
      if (this.isNewComment) {
        params.id = Math.random();
        params.parent_id = null;
        params.reply_id = null;
        params.reply_name = null;
      } else {
		params.id= Math.random(),
		params.parent_id = item.item1?.parent_id ?? item.item1.id,
		params.reply_id = item.item1.id,
		params.reply_name = item.item2 ? item.item2.user_name : item.item1.user_name
        
      }
      params = {
        ...params,
        user_name: this.userInfo.user_name,
        user_avatar: this.userInfo.user_avatar,
        user_content: this.commentValue,
        is_like: false,
        like_count: 0,
        create_time: "刚刚",
        owner: true
      };
	  
	  console.log("params: ",params);

      uni.showLoading({
        title: "正在发送",
        mask: true
      });
      this.$emit("replyFun", { params }, (res) => {
        uni.hideLoading();
        params = { ...params, id: res.id };
        if (this.isNewComment) {
          this.dataList.push(params);
        } else {
			console.log(this.dataList);
          let c_data = this.dataList[item.index1];
          (c_data.children || (c_data.children = [])).push(params);
          if (
            c_data.children.length === (c_data.childrenShow || (c_data.childrenShow = [])).length + 1
          ) {
            c_data.childrenShow.push(params);
          }
        }
        this.$emit("update:tableTotal", this.tableTotal + 1);
        this.$refs.cPopupRef.close();
      });
    },
    deleteClick(item1, index1, item2, index2) {
      this.delTemp = JSON.parse(JSON.stringify({ item1, index1, item2, index2 }));
      this.$refs.delPopupRef.open();
    },
    delCloseFun() {
      this.delTemp = {};
      this.$refs.delPopupRef.close();
    },
    delConfirmFun({ item1, index1, item2, index2 } = this.delTemp) {
      let c_data = this.dataList[index1];
      uni.showLoading({
        title: "正在删除",
        mask: true
      });
      if (index2 >= 0) {
        this.$emit("deleteFun", { params: [c_data.children[index2].id] }, (res) => {
          uni.hideLoading();
          this.$emit("update:tableTotal", this.tableTotal - 1);
          c_data.children.splice(index2, 1);
          c_data.childrenShow.splice(index2, 1);
        });
      } else {
        if (c_data.children && c_data.children.length) {
          switch (this.deleteMode) {
            case "bind":
              c_data.user_content = "当前评论内容已被移除";
              break;
            case "only":
              this.$emit("deleteFun", {
                mode: this.deleteMode,
                params: [c_data.id]
              }, (res) => {
                uni.hideLoading();
                this.$emit("update:tableTotal", this.tableTotal - c_data.children.length + 1);
                this.dataList.splice(index1, 1);
              });
              break;
            default:
              let delIdArr = [c_data.id];
              c_data.children.forEach((_, i) => {
                delIdArr.push(_.id);
              });
              this.$emit("deleteFun", { params: delIdArr, mode: this.deleteMode }, (res) => {
                uni.hideLoading();
                this.$emit("update:tableTotal", this.tableTotal - c_data.children.length + 1);
                this.dataList.splice(index1, 1);
              });
              break;
          }
        } else {
          this.$emit("deleteFun", { params: [c_data.id] }, (res) => {
            uni.hideLoading();
            this.$emit("update:tableTotal", this.tableTotal - 1);
            this.dataList.splice(index1, 1);
          });
        }
      }
      this.delCloseFun();
    },
    expandTxtShow(item1, index1) {
      return (
        item1.childrenShow &&
        item1.childrenShow.length &&
        item1.children.length - item1.childrenShow.length
      );
    },
    expandReplyFun(item1, index1) {
      let csLen = this.dataList[index1].childrenShow.length;
      this.dataList[index1].childrenShow.push(
        ...this.dataList[index1].children.slice(csLen, csLen + 6)
      );
    }
  }
};
</script>
</script>

<style lang="scss" scoped>
////////////////////////
.center {
  display: flex;
  align-items: center;
}
////////////////////////
.c_total {
  padding: 20rpx 30rpx 0 30rpx;
  font-size: 28rpx;
}
.empty_box {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  padding: 150rpx 10rpx;
  font-size: 28rpx;
  .txt {
    color: $uni-text-color-disable;
  }
  .click {
    color: $uni-color-primary;
  }
}
.c_comment {
  padding: 20rpx 30rpx;
  font-size: 28rpx;

  .children_item {
    padding: 20rpx 30rpx;
    margin-top: 10rpx;
    margin-left: 80rpx;
    // background-color: $uni-bg-color-grey;
    .expand_reply {
      margin-top: 10rpx;
      margin-left: 80rpx;
      .txt {
        font-weight: 600;
        color: $uni-color-primary;
      }
    }
  }
}
.c_popup_box {
  background-color: #fff;
  .reply_text {
    @extend .center;
    padding: 20rpx 20rpx 0 20rpx;
    font-size: 26rpx;
    .text_aid {
      color: $uni-text-color-grey;
      margin-right: 5rpx;
    }
    .text_main {
    }
  }
  .content {
    @extend .center;
    .text_area {
      flex: 1;
      padding: 20rpx;
    }
    .send_btn {
      @extend .center;
      justify-content: center;
      width: 120rpx;
      height: 60rpx;
      border-radius: 20rpx;
      font-size: 28rpx;
      color: #fff;
      background-color: $uni-color-primary;
      margin-right: 20rpx;
    }
  }
}
</style>

