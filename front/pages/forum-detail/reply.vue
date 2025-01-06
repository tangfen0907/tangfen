<template>
	<view>
		<CComment ref="ccRef" :userInfo="userInfo" :tableData="tableData" :tableTotal="tableTotal" likeFun="likeFun" @replyFun="replyFun" @deleteFun="deleteFun" :deleteMode="deleteMode"></CComment>
		<view class="btn" @click="openComment">发一条新评论</view>
	</view>
</template>

<script>
import CComment from "@/components/XJ-comment/index";
export default {
		components: {
			CComment
		},
		data() {
			return {
				ccRef: null,
				userInfo: {
					id: 120,
					user_name: "🍁",
					user_avatar: "https://pic1.zhimg.com/80/v2-a79071a705f55c5d88f6c74e6111fe84_720w.webp",
				},
				tableTotal: 4,
				tableData: [
					{
						id: 120,
						parent_id: null,
						reply_id: null,
						reply_name: null,
						user_name: "🍁",
						user_avatar: "https://pic1.zhimg.com/80/v2-a79071a705f55c5d88f6c74e6111fe84_720w.webp",
						user_content: "我是一名类风湿性关节炎的患者。第一次发病时2019年，27岁。期初我的症状是手指关节和脚趾关节红肿，后来膝盖红肿，手腕关节肿。不到半年，我就出现了晨僵，全身关节疼痛，遇冷疼，劳累疼，刮风下雨疼。",
						is_like: false,
						like_count: 120,
						create_time: "2024-01-01 09:16",
					
					
					},
					{
						id: 130,
						parent_id: 120,
						reply_id: 120,
						reply_name: "🍁",
						user_name: "天道酬勤",
						user_avatar: "https://pic2.zhimg.com/80/v2-06eade66ec837713d765b1557bf20b25_720w.webp",
						user_content: "我也是 我也是！",
						is_like: false,
						like_count: 67,
						create_time: "2024-04-01 17:06"
					},
					
					{
						id: 140,
						parent_id: null,
						reply_id: 130,
						reply_name: "天道酬勤",
						user_name: "守护宗主维护宗门",
						user_avatar: "https://pic3.zhimg.com/80/v2-244696a62fa750b8570cf56bfaa5b26a_720w.webp",
						user_content: "我母亲也有同样的症状",
						is_like: false,
						like_count: 16,
						create_time: "2024-01-02 23:08"
					},
					{
						id: 150,
						parent_id: null,
						reply_id: null,
						reply_name: null,
						user_name: "音乐制作人",
						user_avatar: "https://pic2.zhimg.com/80/v2-88ec6f8c6d3305122664dd18a28730e5_720w.webp",
						user_content: "我现在吃的是艾拉莫得，病症减轻了，现在肌酐指标在上升，我在考虑换药。",
						is_like: true,
						like_count: 8,
						create_time: "2024-01-08 00:45"
					}
				],
				deleteMode: "all",
				
			}
			
		},
	
		methods: {
			openComment() {
				this.$refs.ccRef.newCommentFun();
			},
			likeFun(params, callback) {
				console.log("likeFun", params);
				// Implement your logic for likeFun
				
			},
			replyFun(params, callback) {
				// console.log("replyFun", params);
				// axios.post("http://xxx/reply", { ...params }).then((res) => {
				//   //   if (res.code === 0) {
				//   //     callback(res);
				//   //   }
				//   // });
				  const res = { id: Math.random() }; // 很重要的回参! 必须拿到后端返回评论id! 删除需要!
				  setTimeout(() => callback(res), 500); // 目前为了展示效果, 直接执行callback
			},
			
			deleteFun({ params, mode }, callback) {
			
			  console.log("deleteFun", { params, mode });
			  // 当请求成功, 调用callback执行评论删除;
			  switch (this.deleteMode) {
			    case "bind":
			      // 逻辑: 调用接口进行评论内容修改 update
			      setTimeout(() => callback(), 500); // 目前为了展示效果, 直接执行callback
			      break;
			    case "only":
			      // 逻辑: 调用接口删除一个评论 delete
			      setTimeout(() => callback(), 500); // 目前为了展示效果, 直接执行callback
			      break;
			    default:
			      // all
			      // 逻辑: 调用接口删除多个评论 [delete]
			      // Demo如下:
			      // axios.post("http://xxx/delete", { ids: params }).then((res) => {
			      //   if (res.code === 0) {
			      //     callback(res);
			      //   }
			      // });
			      setTimeout(() => callback(), 500); // 目前为了展示效果, 直接执行callback
			      break;
			  }
			}
		}
	}
</script>

<style lang="scss" scoped>
.btn {
  text-align: center;
  color: #fff;
  padding: 20rpx;
  margin: 20rpx;
  border-radius: 20rpx;
  background-color: #2979ff;
}
</style>