<template>
  <view class="comment_item">
    <view class="top">
      <view class="top_left">
        <img class="user_avatar" :src="data.user_avatar" />
        <uni-tag
          v-if="data.owner"	
          class="tag"
          type="primary"
          :inverted="false"
          text="作者"
          size="mini"
          circle
        />
        <span class="user_name">{{ data.user_name }}</span>
        <span class="user_name">{{ cReplyName }}</span>
      </view>
      <view class="top_right" @tap="likeClick(data)">
        <span :class="[data.is_like ? 'active' : '', 'like_count']">{{
          cLikeCount
        }}</span>
        <uni-icons
          v-show="data.is_like"
          type="hand-up-filled"
          size="24"
          color="#007aff"
        ></uni-icons>
        <uni-icons
          v-show="!data.is_like"
          type="hand-up"
          size="24"
          color="#999"
        ></uni-icons>
      </view>
    </view>
    <view class="content" @tap="replyClick(data)">
      {{ c_content }}
      <span
        class="shrink"
        v-if="isShrink"
        @tap.stop="expandContentFun(data.user_content)"
        >...展开</span
      >
    </view>
    <view class="bottom">
      <span class="create_time">{{ data.create_time }}</span>
      <span
        v-if="data.owner"
        class="delete"
        @tap="deleteClick(data)"
        >删除</span
      >
     <!-- <span v-else class="reply" @tap="replyClick(data)"
        >回复</span> -->
    </view>
  </view>
</template>

<script>
export default {
  props: {
    data: {
      type: Object,
      default: () => ({})
    },
    pData: {
      type: Object,
      default: () => ({})
    }
  },
  data() {
    return {
      isShrink: this.data.user_content.length > 70,
      c_content: this.data.user_content.length > 70 ? this.data.user_content.slice(0, 71) : this.data.user_content
    };
  },
  computed: {
    cReplyName() {
      return this.data.reply_name ? ` ▸ ` + this.data.reply_name : "";
    },
    cLikeCount() {
      return this.data.like_count === 0
        ? ""
        : this.data.like_count > 99
        ? `99+`
        : this.data.like_count;
    }
  },
  mounted() {
  	console.log("回复名字为：" ,this.data);
  },
  methods: {
	  // 展开评论
    expandContentFun() {
      this.isShrink = false;
    },
	// 点赞
    likeClick(item) {
      this.$emit("likeClick", item);
    },
	// 回复
    replyClick(item) {

		 // 自己不能回复自己
      // if (item.owner) return;
      this.$emit("replyClick", item);
    },
	// 删除
    deleteClick(item) {
      this.$emit("deleteClick", item);
    }
  }
};
</script>


<style lang="scss" scoped>
////////////////////////
.center {
  display: flex;
  align-items: center;
}
.ellipsis {
  overflow: hidden; //超出文本隐藏
  white-space: nowrap; //溢出不换行
  text-overflow: ellipsis; //溢出省略号显示
}
////////////////////////
.comment_item {
  font-size: 28rpx;
  .top {
    @extend .center;
    justify-content: space-between;
    .top_left {
      display: flex;
      align-items: center;
      overflow: hidden;
      .user_avatar {
        width: 68rpx;
        height: 68rpx;
        border-radius: 50%;
        margin-right: 12rpx;
      }
      .tag {
        margin-right: 6rpx;
      }
      .user_name {
        @extend .ellipsis;
        max-width: 180rpx;
        color: $uni-text-color-grey;
      }
    }
    .top_right {
      @extend .center;
      .like_count {
        color: $uni-text-color-grey;
        &.active {
          color: $uni-color-primary;
        }
      }
    }
  }
  .content {
    padding: 10rpx;
    margin-left: 70rpx;
    color: $uni-text-color;
    &:active {
      background-color: $uni-bg-color-hover;
    }
    .shrink {
      padding: 20rpx 20rpx 20rpx 0rpx;
      color: $uni-color-primary;
    }
  }
  .bottom {
    padding-left: 80rpx;
    font-size: 24rpx;
    .create_time {
      color: $uni-text-color-grey;
    }
    .delete {
      padding: 20rpx 20rpx 0 20rpx;
      color: $uni-border-color;
    }
    .reply {
      color: $uni-color-primary;
    }
  }
}
</style>
