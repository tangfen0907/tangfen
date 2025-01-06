<template>
	<view class="content">
		<view @tap="onPageTap('../user-info/user-info')" class="header" v-bind:class="{'status':isH5Plus}">

			<view v-if="tableName=='yonghu'" class="userinfo">
				<view class="face ">
					<image :src="user.touxiang?baseUrl+user.touxiang:'/static/center/face.jpeg'"></image>
				</view>
				<view class="info">
					<view class="username">
						{{user.yonghuming}}
					</view>
				</view>
			</view>
			<view class="setting">

				<view class=" classOne cuIcon-settings"></view>
			</view>
		</view>
		<view class="list">

			<view @tap="onPageTap('../huodongxinxi/activities-my')" class=" li" hover-class="hover">
				<view v-if="true" class="classOne cuIcon-activity"></view>
				<view class="text">
					我的活动</view>
				<view v-if="true" class="classTwo cuIcon-right">
				</view>
			</view>
			<view @tap="onPageTap('../baoming-my/check')" class=" li" hover-class="hover">
				<view v-if="true" class="classOne cuIcon-discover"></view>
				<view class="text">
					审核报名</view>
				<view v-if="true" class="classTwo cuIcon-right">
				</view>
			</view>
			<view @tap="onPageTap('../baoming-my/baoming-my')" class=" li" hover-class="hover">
				<view v-if="true" class="classOne cuIcon-roundadd"></view>
				<view class="text">
					我的报名</view>
				<view v-if="true" class="classTwo cuIcon-right">
				</view>
			</view>
			<view @tap="onPageTap('../yonghufabu/yonghufabu-my')" class=" li" hover-class="hover">
				<view v-if="true" class="classOne cuIcon-footprint"></view>
				<view class="text">
					我的攻略与游记</view>
				<view v-if="true" class="classTwo cuIcon-right"></view>
			</view>
			<view @tap="onPageTap('../storeup/storeup-my')" class=" li" hover-class="hover">
				<view v-if="true" class="classOne cuIcon-favor"></view>
				<view class="text">
					我的收藏</view>
				<view v-if="true" class="classTwo cuIcon-right"></view>
			</view>
			<view @tap="onPageTap('../forum-my/forum-my')" class=" li" hover-class="hover">
				<view v-if="true" class="classOne cuIcon-discover"></view>
				<view class="text">
					我的圈子</view>
				<view v-if="true" class="classTwo cuIcon-right">
				</view>
			</view>
			<view @tap="onPageTap('../our/our')" class=" li" hover-class="hover">
				<view v-if="true" class="classOne cuIcon-discover"></view>
				<view class="text">
					联系我们</view>
				<view v-if="true" class="classTwo cuIcon-right">
				</view>
			</view>
		</view>
	</view>
</template>
<script>
	import menu from '@/utils/menu'
	export default {
		data() {
			return {
				isH5Plus: true,
				user: {},
				tableName: '',
				role: '',
				menuList: [],
				iconArr: [
					'cuIcon-same',
					'cuIcon-flashlightopen',
					'cuIcon-deliver',
					'cuIcon-evaluate',
					'cuIcon-shop',
					'cuIcon-ticket',
					'cuIcon-cascades',
					'cuIcon-discover',
					'cuIcon-question',
					'cuIcon-pic',
					'cuIcon-filter',
					'cuIcon-footprint',
					'cuIcon-pulldown',
					'cuIcon-pullup',
					'cuIcon-moreandroid',
					'cuIcon-refund',
					'cuIcon-qrcode',
					'cuIcon-remind',
					'cuIcon-profile',
					'cuIcon-home',
					'cuIcon-message',
					'cuIcon-link',
					'cuIcon-lock',
					'cuIcon-unlock',
					'cuIcon-vip',
					'cuIcon-weibo',
					'cuIcon-activity',
					'cuIcon-friendadd',
					'cuIcon-friendfamous',
					'cuIcon-friend',
					'cuIcon-goods',
					'cuIcon-selection',
					'cuIcon-community',
				],
			};
		},
		computed: {
			baseUrl() {
				return this.$base.url;
			}
		},
		async onLoad() {
			this.role = uni.getStorageSync("role");
			let table = uni.getStorageSync("nowTable");
			let res = await this.$api.session(table);
			this.user = res.data;
			this.tableName = table;
			let menus = menu.list();
			this.menuList = menus;
		},
		async onShow() {
			uni.removeStorageSync("useridTag");
			this.role = uni.getStorageSync("role");
			let table = uni.getStorageSync("nowTable");
			let res = await this.$api.session(table);
			this.user = res.data;
			this.tableName = table;
			let menus = menu.list();
			this.menuList = menus;
		},
		methods: {
			onPageTap(url) {
				uni.setStorageSync("useridTag", 1);
				uni.navigateTo({
					url: url,
					fail: function() {
						uni.switchTab({
							url: url
						});
					}
				});
			}
		}
	}
</script>

<style lang="scss">
	page {

		background-color: #ededed;
	}

	.content:after {
		position: fixed;
		top: 0;
		right: 0;
		left: 0;
		bottom: 0;
		content: '';

		background-attachment: fixed;
		background-size: cover;
		background-position: center;
	}

	.header {
		height: 80rpx;

		&.status {
			padding-top: var(--status-bar-height);
		}

		background-color:#ff6364;
		width:100%;
		height:30vw;
		padding:0 4%;
		display:flex;
		align-items:center;

		padding: 0 24rpx;
		box-shadow: 0 0 12rpx rgba(0, 0, 0, 0);
		margin: 0 0 20rpx;
		background-color: #fff;
		border-color: #ccc;
		border-radius: 0;
		border-width: 0;
		width: 100%;
		border-style: solid;

		.userinfo {
			width: 100%;
			display: flex;
			align-items: center;

			.face {
				flex-shrink: 0;
				width: 15vw;
				height: 15vw;
				overflow: hidden;

				image {
					width: 100%;
					height: 100%;
					// border-radius: 100%
				}

				padding: 0;
				box-shadow: 0 0 0px rgba(0, 0, 0, .3);
				margin: 0 20rpx 0 0;
				border-color: rgba(0, 0, 0, 0);
				background-color: rgba(0, 0, 0, 0);
				border-radius: 50rpx;
				border-width: 0;
				width: 100rpx;
				border-style: solid;
				height: 88rpx;
			}

			.info {
				// display: flex;
				flex-flow: wrap;
				// padding-left: 30upx;

				.username {
					width: 100%;
					color: #fff;
					font-size: 40upx;
					// margin-bottom: 10upx;
					// margin-left: 10upx;
					margin: 8upx 0;
					padding: 0;
					box-shadow: 0 0 16rpx rgba(255, 255, 255, 0);
					margin: 0;
					background-color: rgba(0, 0, 0, 0);
					border-color: rgba(255, 255, 255, .3);
					color: rgba(0, 0, 0, 1);
					text-align: left;
					border-radius: 8rpx;
					border-width: 0;
					width: 240rpx;
					line-height: 36rpx;
					font-size: 32rpx;
					border-style: solid;
				}

				.integral {
					display: flex;
					align-items: center;
					padding: 0 8upx;
					// height: 40upx;
					color: #fff;
					background-color: rgba(0, 0, 0, 0.1);
					border-radius: 20upx;
					font-size: 24upx;
					// margin-bottom: 10upx;
					margin: 8upx 0;
				}
			}

			padding: 0 24rpx;
			box-shadow: 0 0 12rpx rgba(0, 0, 0, 0);
			margin: 20rpx 0;
			border-color: rgba(0, 0, 0, 0);
			background-color: rgba(0, 0, 0, 0);
			border-radius: 16rpx;
			border-width: 0;
			width: calc(100% - 112rpx);
			border-style: solid;
			height: 160rpx;
		}

		.setting {
			flex-shrink: 0;
			// width: 6vw;
			// height: 6vw;

			image {
				width: 100%;
				height: 100%
			}
		}

	}

	.hover {
		background-color: #eee
	}

	.orders {
		background-color: #ff6364;
		width: 100%;
		height: 11vw;
		padding: 0 4%;
		margin-bottom: calc(11vw + 40upx);
		display: flex;
		align-items: flex-start;
		border-radius: 0 0 100% 100%;
		margin-top: -1upx;

		.box {
			width: 100%;
			padding: 0 1%;
			height: 22vw;
			background-color: #fefefe;
			border-radius: 24upx;
			box-shadow: 0 0 20upx rgba(0, 0, 0, 0.15);
			margin-bottom: 40upx;
			display: flex;
			align-items: center;
			justify-content: center;

			.label {
				display: flex;
				align-items: center;
				justify-content: center;
				flex-flow: wrap;
				width: 100%;
				height: 16vw;
				color: #666666;
				font-size: 26upx;

				.icon {
					position: relative;
					width: 7vw;
					height: 7vw;
					margin: 0 1vw;

					.badge {
						position: absolute;
						width: 4vw;
						height: 4vw;
						background-color: #ec6d2c;
						top: -1vw;
						right: -1vw;
						border-radius: 100%;
						font-size: 20upx;
						color: #fff;
						display: flex;
						align-items: center;
						justify-content: center;
						z-index: 10;
					}

					image {
						width: 7vw;
						height: 7vw;
						z-index: 9;
					}
				}
			}
		}
	}

	.list {
		width: 100%;
		border-bottom: solid 26upx #f1f1f1;
		display: flex;
		flex-wrap: wrap;

		.li {
			width: 100%;
			height: 100upx;
			padding: 0 4%;
			border-bottom: solid 1upx #e7e7e7;
			display: flex;
			align-items: center;
			background: #FFFFFF;
			font-size: 33upx;
			flex-wrap: wrap;

			&.noborder {
				border-bottom: 0
			}

			.icon {
				flex-shrink: 0;
				width: 50upx;
				height: 50upx;

				image {
					width: 50upx;
					height: 50upx
				}
			}

			.text {
				padding-left: 20upx;
				width: 100%;
				color: #666;
				padding: 0 20rpx;
				box-shadow: 0 0 12rpx rgba(0, 0, 0, 0);
				color: rgba(0, 0, 0, 0.8);
				;
				text-align: left;
				border-radius: 0;
				border-width: 0;
				width: calc(100% - 92rpx);
				line-height: 80rpx;
				font-size: 28rpx;
				border-style: solid;
			}

			.to {
				flex-shrink: 0;
				width: 40upx;
				height: 40upx
			}
		}

		padding: 0;
		box-shadow: 0 0 12rpx rgba(0, 0, 0, 0);
		margin: 24rpx 0;
		border-color: rgba(0, 0, 0, 0);
		background-color: rgba(255, 255, 255, 0);
		border-radius: 0;
		border-width: 0;
		width: 100%;
		border-style: solid;
		height: auto;
	}

	.iconClass {
		margin: 0 80rpx 0 80rpx;
		color: rgb(246, 185, 63);
		border-width: 0;
		width: 40rpx;
		line-height: 40rpx;
		font-size: 40rpx;
		border-style: solid;
	}

	.classOne {
		padding: 0;
		box-shadow: 0 0 12rpx rgba(0, 0, 0, 0);
		margin: 0;
		border-color: rgba(0, 0, 0, 0);
		background-color: rgba(255, 255, 255, 0);
		color: rgba(246, 185, 63, 1);
		border-radius: 0;
		border-width: 0;
		width: 64rpx;
		line-height: 64rpx;
		font-size: 48rpx;
		border-style: solid;
	}

	.classTwo {
		padding: 0;
		box-shadow: 0 0 12rpx rgba(0, 0, 0, 0);
		margin: 0;
		border-color: rgba(0, 0, 0, 0);
		background-color: #fff;
		color: rgba(0, 0, 0, 0.6);
		border-radius: 0;
		border-width: 0;
		width: 28rpx;
		line-height: 28rpx;
		font-size: 28rpx;
		border-style: solid;
	}
</style>