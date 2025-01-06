<template>
	<mescroll-uni @init="mescrollInit" :up="upOption" :down="downOption" @down="downCallback" @up="upCallback">
		<!--header end-->
		<view class="list">
			<view v-for="(item,index) in list " v-bind:key="index" class="listm flex flex-between">
				 <view ><image
				 	mode="aspectFill" class="listmpic "  :src="baseUrl+item.picture"></image></view>

				<view class="listmr">
					<view v-if="item.tablename=='yonghufabu'">攻略或游记</view>
					<view v-else>登山活动</view>
					<view class="col3 f30 elip mb15">{{item.name}}</view>
					<view v-if="item.addtime" class="colb f24 lh35">发布时间{{item.addtime}}</view>
					<button @tap="onDetailTap(item.refid,item.tablename)" class="cu-btn bg-green shadow">查看</button>
				</view>
			</view>
		</view>
		<!--list end-->
		<!-- <button class="add-btn" @click="onUpdateTap()">新增</button> -->
	</mescroll-uni>
</template>

<script>
	import '@/assets/css/global-restaurant.css'
	import uniIcons from "@/components/uni-ui/lib/uni-icons/uni-icons.vue"
	import uniNoticeBar from "@/components/uni-ui/lib/uni-notice-bar/uni-notice-bar.vue"
	export default {
		components: {
			uniIcons,
			uniNoticeBar
		},
		data() {
			return {
				//轮播
				swiperList: [],
				list: [],
				userid:'',
				mescroll: null, //mescroll实例对象
				downOption: {
					auto: false //是否在初始化后,自动执行下拉回调callback; 默认true
				},
				upOption: {
					page: {
						
					},
					noMoreSize: 3, //如果列表已无数据,可设置列表的总数量要大于半页才显示无更多数据;避免列表数据过少(比如只有一条数据),显示无更多数据会不好看; 默认5
					textNoMore: '~ 没有更多了 ~',
				},
				hasNext: true
			}
		},
		async onShow() {
			this.hasNext = true
			// 重新加载数据
			if (this.mescroll) this.mescroll.resetUpScroll()
		},
		computed: {
			baseUrl() {
				return this.$base.url;
			}
		},
		methods: {
			// mescroll组件初始化的回调,可获取到mescroll对象
			mescrollInit(mescroll) {
				this.mescroll = mescroll;
			},
			/*下拉刷新的回调 */
			downCallback(mescroll) {
				this.hasNext = true
				// 重置分页参数页数为1
				mescroll.resetUpScroll()
			},
			/*上拉加载的回调: mescroll携带page的参数, 其中num:当前页 从1开始, size:每页数据条数,默认10 */
			async upCallback(mescroll) {
			    // 获取当前登录用户的ID
				this.userid = uni.getStorageSync("userid");
			    const userid = parseInt(this.userid);
			
			    // 构造请求参数，包括用户ID、页码和每页数据条数
			    let params = {
			        page: mescroll.num,
			        limit: mescroll.size,
			        userid: userid // 将用户ID添加到请求参数中
			    };
			
			    // 发送请求获取用户发布的攻略信息
			    let res = await this.$api.page('storeup', params);
			
			    // 如果是第一页数据，先清空列表
			    if (mescroll.num == 1) {
			        this.list = [];
			    }
			
			    // 将后端返回的数据拼接到列表中
			    this.list = this.list.concat(res.data.list);
			    
			    // 如果后端返回的数据长度为 0，说明没有更多数据了
			    if (res.data.list.length === 0) {
			        this.hasNext = false;
			    }
			
			    // 告知 Mescroll 组件加载完成，并传递 hasNext 参数
			    mescroll.endSuccess(mescroll.size, this.hasNext);
			},
			// 详情
			onDetailTap(id,tablename) {
				this.$utils.jump(`../${tablename}/detail?id=${id}`)
			},
			
		}
	}
</script>

<style>
	view {
		font-family: '\5FAE\8F6F\96C5\9ED1';
		font-size: 30upx;
	}

	page {
		background: #ededed;
	}

	.header {
		background: #f39800;
		padding: 15upx 20upx 255upx;
		position: relative;
	}

	.ssbox {
		background: rgba(255, 255, 255, 0.35);
		width: 530upx;
		border-radius: 60rpx;
		padding: 10upx 15upx;
		box-sizing: border-box;
	}

	.ss_input {
		border: none;
		width: 450upx;
		font-size: 30upx;
		color: #fff;
		background: none;
		height: 45upx;
		line-break: 45upx;
	}

	.headerb {
		position: absolute;
		left: 0;
		top: 60upx;
		width: 100%;
		box-sizing: border-box;
		padding: 0 20upx;
	}

	.headerb image {
		width: 710upx;
		box-shadow: 0 10upx 10px rgba(0, 0, 0, 0.3);
		border-radius: 40upx;
		position: relative;
		z-index: 10;
	}

	.notice {
		position: relative;
		z-index: 5;
		padding: 0 50upx;
	}

	.noticem {
		background: #fff;
		padding: 55upx 30upx 15upx;
		border-radius: 10upx;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
		margin-top: -45upx;
	}

	.noticer {
		width: 480upx;
		height: 50upx;
	}

	.noticer .swiper-item {
		white-space: nowrap;
		text-overflow: ellipsis;
		overflow: hidden;
		height: 50upx;
		line-height: 50upx;
		font-size: 24upx;
	}

	.list {
		padding: 60upx 20upx 20upx;
	}

	.listm {
		background: #fff;
		border-radius: 15upx;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
		margin-bottom: 20upx;
		padding: 30upx;
	}

	.listmpic {
		border-radius: 10upx;
		width:166upx;
		height:166upx;
	}

	.listmr {
		width: 460upx;
		display: inline-block;
	}

	/* #ifdef MP-WEIXIN */
	.noticer .swiper-item {
		margin-top: 5upx;
	}

	/* #endif */
	/* #ifdef MP-BAIDU */
	.noticer .swiper-item {
		margin-top: 3upx;
	}

	/* #endif */
	/* #ifdef MP-ALIPAY */
	.noticer .swiper-item {
		margin-top: 2upx;
	}

	/* #endif */
	/* #ifdef MP-QQ */
	.noticer .swiper-item {
		margin-top: 4upx;
	}

	/* #endif */
	/* #ifdef MP-TOUTIAO */
	.noticer .swiper-item {
		margin-top: 4upx;
	}

	.add-btn {
		position: fixed;
		left: 30upx;
		right: 30upx;
		bottom: 120upx;
		z-index: 95;
		display: flex;
		align-items: center;
		justify-content: center;
		width: 690upx;
		height: 80upx;
		font-size: 32upx;
		color: #fff;
		background-color: red;
		border-radius: 10upx;
		box-shadow: 1px 2px 5px rgba(219, 63, 96, 0.4);
	}

	/* #endif */
</style>