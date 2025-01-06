<template>
	<mescroll-uni @init="mescrollInit" :up="upOption" :down="downOption" @down="downCallback" @up="upCallback"
		:bottom="100">
		
		<view class="container">
			
			<swiper
				:style='{"padding":"0","boxShadow":"0 2rpx 12rpx rgba(0,0,0,0)","margin":"0","borderColor":"rgba(0,0,0,0)","backgroundColor":"rgba(255,255,255,1)","borderRadius":"20rpx","borderWidth":"0","width":"100%","borderStyle":"solid","height":"300rpx"}'
				class="swiper" :indicator-dots='".swiper-pagination"==null?false:true' :autoplay='autoplaySwiper'
				:circular='true' indicator-active-color='rgba(194, 228, 106, 1)' indicator-color='rgba(0, 0, 0, .3)'
				:duration='1000' :interval='intervalSwiper' :vertical='"horizontal"=="horizontal"?false:true'>
				<swiper-item
					:style='{"padding":"0","boxShadow":"0 2rpx 12rpx rgba(0,0,0,0)","margin":"0","borderColor":"rgba(0,0,0,0)","backgroundColor":"rgba(255,255,255,1)","borderRadius":"0","borderWidth":"0","width":"100%","borderStyle":"solid","height":"300rpx"}'
					v-for="(swiper,index) in swiperList" :key="index">
					<image
						:style='{"padding":"0","boxShadow":"0 2rpx 12rpx rgba(0,0,0,0)","margin":"0","borderColor":"rgba(0,0,0,0)","backgroundColor":"rgba(255,255,255,1)","borderRadius":"0","borderWidth":"0","width":"100%","borderStyle":"solid","height":"300rpx"}'
						mode="aspectFill" :src="baseUrl+swiper"></image>
				</swiper-item>
			</swiper>
			<view class="detail-content">

				<view class="price detail-list-item"
					:style='{"padding":"8rpx 24rpx","boxShadow":"0 0 0px rgba(0,0,0,.3)","margin":"0 0 20rpx 0","borderColor":"#fff","backgroundColor":"#fff","borderRadius":"0","borderWidth":"0","width":"100%","borderStyle":"solid","height":"auto"}'>
					<view class="text icon"
						:style='{"padding":"0","boxShadow":"0 0 12rpx rgba(0,0,0,0)","margin":"0","borderColor":"rgba(0,0,0,0)","backgroundColor":"rgba(0,0,0,0)","color":"rgba(194, 228, 106, 1)","textAlign":"center","borderRadius":"0","borderWidth":"0","width":"30%","lineHeight":"72rpx","fontSize":"64rpx","borderStyle":"solid"}'>
						<view style="line-height: 1;" v-if="storeupFlag==1" class="cuIcon-favorfill" @click="shoucang">
						</view>
						<view style="line-height: 1;" v-if="storeupFlag==0" class="cuIcon-favor" @click="shoucang">
						</view>
					</view>
				</view>
				<view style="font-size: 45rpx; font-weight: bold; padding: 15rpx 0; text-align: center;color: rgba(0,0,0,0.8);
				 display: -webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp: 2; overflow: hidden;">
					{{detail.huodongmingcheng}}
				</view>

				<view class="detail-list-item"
					:style='{"padding":"8rpx 24rpx","boxShadow":"0 0 0px rgba(0,0,0,.3)","margin":"0 0 20rpx 0","borderColor":"#fff","backgroundColor":"#fff","borderRadius":"0","borderWidth":"0","width":"100%","borderStyle":"solid","height":"auto"}'>
					<view class="lable"
						:style='{"padding":"0","boxShadow":"0 0 12rpx rgba(0,0,0,0)","margin":"0","borderColor":"rgba(0,0,0,0)","backgroundColor":"rgba(0,0,0,0)","color":"#333","textAlign":"left","borderRadius":"0","borderWidth":"0","width":"160rpx","lineHeight":"80rpx","fontSize":"28rpx","borderStyle":"solid"}'>
						活动地区：</view>
					<view class="text"
						:style='{"padding":"0","boxShadow":"0 0 12rpx rgba(0,0,0,0)","margin":"0","borderColor":"rgba(0,0,0,0)","backgroundColor":"rgba(0,0,0,0)","color":"#333","textAlign":"left","borderRadius":"0","borderWidth":"0","width":"calc(100% - 160rpx)","lineHeight":"80rpx","fontSize":"28rpx","borderStyle":"solid"}'>
						{{detail.huodongdiqu}}
					</view>
				</view>
				<view class="detail-list-item"
					:style='{"padding":"8rpx 24rpx","boxShadow":"0 0 0px rgba(0,0,0,.3)","margin":"0 0 20rpx 0","borderColor":"#fff","backgroundColor":"#fff","borderRadius":"0","borderWidth":"0","width":"100%","borderStyle":"solid","height":"auto"}'>
					<view class="lable"
						:style='{"padding":"0","boxShadow":"0 0 12rpx rgba(0,0,0,0)","margin":"0","borderColor":"rgba(0,0,0,0)","backgroundColor":"rgba(0,0,0,0)","color":"#333","textAlign":"left","borderRadius":"0","borderWidth":"0","width":"160rpx","lineHeight":"80rpx","fontSize":"28rpx","borderStyle":"solid"}'>
						活动类型：</view>
					<view class="text"
						:style='{"padding":"0","boxShadow":"0 0 12rpx rgba(0,0,0,0)","margin":"0","borderColor":"rgba(0,0,0,0)","backgroundColor":"rgba(0,0,0,0)","color":"#333","textAlign":"left","borderRadius":"0","borderWidth":"0","width":"calc(100% - 160rpx)","lineHeight":"80rpx","fontSize":"28rpx","borderStyle":"solid"}'>
						{{detail.huodongleixing}}
					</view>
				</view>
				<view class="detail-list-item"
					:style='{"padding":"8rpx 24rpx","boxShadow":"0 0 0px rgba(0,0,0,.3)","margin":"0 0 20rpx 0","borderColor":"#fff","backgroundColor":"#fff","borderRadius":"0","borderWidth":"0","width":"100%","borderStyle":"solid","height":"auto"}'>
					<view class="lable"
						:style='{"padding":"0","boxShadow":"0 0 12rpx rgba(0,0,0,0)","margin":"0","borderColor":"rgba(0,0,0,0)","backgroundColor":"rgba(0,0,0,0)","color":"#333","textAlign":"left","borderRadius":"0","borderWidth":"0","width":"160rpx","lineHeight":"80rpx","fontSize":"28rpx","borderStyle":"solid"}'>
						活动地点：</view>
					<view class="text"
						:style='{"padding":"0","boxShadow":"0 0 12rpx rgba(0,0,0,0)","margin":"0","borderColor":"rgba(0,0,0,0)","backgroundColor":"rgba(0,0,0,0)","color":"#333","textAlign":"left","borderRadius":"0","borderWidth":"0","width":"calc(100% - 160rpx)","lineHeight":"80rpx","fontSize":"28rpx","borderStyle":"solid"}'>
						{{detail.huodongdidian}}  
					</view>
					   <button class="bg-gradual-green" style=" 
    font-size: 14px;width: 120rpx; height: 64rpx;" @click="navigateToNavigation">查看</button>
				</view>
				<view class="detail-list-item"
					:style='{"padding":"8rpx 24rpx","boxShadow":"0 0 0px rgba(0,0,0,.3)","margin":"0 0 20rpx 0","borderColor":"#fff","backgroundColor":"#fff","borderRadius":"0","borderWidth":"0","width":"100%","borderStyle":"solid","height":"auto"}'>
					<view class="lable"
						:style='{"padding":"0","boxShadow":"0 0 12rpx rgba(0,0,0,0)","margin":"0","borderColor":"rgba(0,0,0,0)","backgroundColor":"rgba(0,0,0,0)","color":"#333","textAlign":"left","borderRadius":"0","borderWidth":"0","width":"160rpx","lineHeight":"80rpx","fontSize":"28rpx","borderStyle":"solid"}'>
						活动时间：</view>
					<view class="text"
						:style='{"padding":"0","boxShadow":"0 0 12rpx rgba(0,0,0,0)","margin":"0","borderColor":"rgba(0,0,0,0)","backgroundColor":"rgba(0,0,0,0)","color":"#333","textAlign":"left","borderRadius":"0","borderWidth":"0","width":"calc(100% - 160rpx)","lineHeight":"80rpx","fontSize":"28rpx","borderStyle":"solid"}'>
						{{detail.huodongshijian}}
					</view>
				</view>
				<view class="detail-list-item"
					:style='{"padding":"8rpx 24rpx","boxShadow":"0 0 0px rgba(0,0,0,.3)","margin":"0 0 20rpx 0","borderColor":"#fff","backgroundColor":"#fff","borderRadius":"0","borderWidth":"0","width":"100%","borderStyle":"solid","height":"auto"}'>
					<view class="lable"
						:style='{"padding":"0","boxShadow":"0 0 12rpx rgba(0,0,0,0)","margin":"0","borderColor":"rgba(0,0,0,0)","backgroundColor":"rgba(0,0,0,0)","color":"#333","textAlign":"left","borderRadius":"0","borderWidth":"0","width":"160rpx","lineHeight":"80rpx","fontSize":"28rpx","borderStyle":"solid"}'>
						行程安排：</view>
					<view class="text"
						:style='{"padding":"0","boxShadow":"0 0 12rpx rgba(0,0,0,0)","margin":"0","borderColor":"rgba(0,0,0,0)","backgroundColor":"rgba(0,0,0,0)","color":"#333","textAlign":"left","borderRadius":"0","borderWidth":"0","width":"calc(100% - 160rpx)","lineHeight":"80rpx","fontSize":"28rpx","borderStyle":"solid"}'>
						{{detail.xingchenganpai}}
					</view>
				</view>
				<view class="detail-list-item"
					:style='{"padding":"8rpx 24rpx","boxShadow":"0 0 0px rgba(0,0,0,.3)","margin":"0 0 20rpx 0","borderColor":"#fff","backgroundColor":"#fff","borderRadius":"0","borderWidth":"0","width":"100%","borderStyle":"solid","height":"auto"}'>
					<view class="lable"
						:style='{"padding":"0","boxShadow":"0 0 12rpx rgba(0,0,0,0)","margin":"0","borderColor":"rgba(0,0,0,0)","backgroundColor":"rgba(0,0,0,0)","color":"#333","textAlign":"left","borderRadius":"0","borderWidth":"0","width":"160rpx","lineHeight":"80rpx","fontSize":"28rpx","borderStyle":"solid"}'>
						装备要求：</view>
					<view class="text"
						:style='{"padding":"0","boxShadow":"0 0 12rpx rgba(0,0,0,0)","margin":"0","borderColor":"rgba(0,0,0,0)","backgroundColor":"rgba(0,0,0,0)","color":"#333","textAlign":"left","borderRadius":"0","borderWidth":"0","width":"calc(100% - 160rpx)","lineHeight":"80rpx","fontSize":"28rpx","borderStyle":"solid"}'>
						{{detail.zhuangbeiyaoqiu}}
					</view>
				</view>
				<view class="detail-list-item"
					:style='{"padding":"8rpx 24rpx","boxShadow":"0 0 0px rgba(0,0,0,.3)","margin":"0 0 20rpx 0","borderColor":"#fff","backgroundColor":"#fff","borderRadius":"0","borderWidth":"0","width":"100%","borderStyle":"solid","height":"auto"}'>
					<view class="lable"
						:style='{"padding":"0","boxShadow":"0 0 12rpx rgba(0,0,0,0)","margin":"0","borderColor":"rgba(0,0,0,0)","backgroundColor":"rgba(0,0,0,0)","color":"#333","textAlign":"left","borderRadius":"0","borderWidth":"0","width":"160rpx","lineHeight":"80rpx","fontSize":"28rpx","borderStyle":"solid"}'>
						发布日期：</view>
					<view class="text"
						:style='{"padding":"0","boxShadow":"0 0 12rpx rgba(0,0,0,0)","margin":"0","borderColor":"rgba(0,0,0,0)","backgroundColor":"rgba(0,0,0,0)","color":"#333","textAlign":"left","borderRadius":"0","borderWidth":"0","width":"calc(100% - 160rpx)","lineHeight":"80rpx","fontSize":"28rpx","borderStyle":"solid"}'>
						{{detail.faburiqi}}
					</view>
				</view>

			</view>

			<view class="time-content"
				:style='{"padding":"12rpx 24rpx","boxShadow":"0 0 0px rgba(0,0,0,.3)","margin":"0 0 20rpx 0","borderColor":"#fff","backgroundColor":"#fff","borderRadius":"0","borderWidth":"0","width":"100%","borderStyle":"solid","height":"auto"}'
				style="height:auto !important;">
				<view class="header"
					:style='{"padding":"0","boxShadow":"0 0 12rpx rgba(0,0,0,0)","margin":"0","borderColor":"rgba(0,0,0,0)","backgroundColor":"#fff","borderRadius":"0","color":"#333","borderWidth":"0","width":"100%","lineHeight":"80rpx","fontSize":"28rpx","borderStyle":"solid"}'>
					攻略信息
				</view>
				<view class="content"
					:style='{"padding":"24rpx","boxShadow":"0 0 12rpx rgba(0,0,0,0)","margin":"0","borderColor":"#ccc","backgroundColor":"#fff","borderRadius":"8rpx","color":"#333","borderWidth":"2rpx","width":"100%","fontSize":"28rpx","borderStyle":"solid","height":"auto"}'>
					{{detail.gonglvexinxi}}
				</view>
			</view>

			<view class="time-content"
				:style='{"padding":"12rpx 24rpx","boxShadow":"0 0 0px rgba(0,0,0,.3)","margin":"0 0 20rpx 0","borderColor":"#fff","backgroundColor":"#fff","borderRadius":"0","borderWidth":"0","width":"100%","borderStyle":"solid","height":"auto"}'
				style="height:auto !important;">
				<view class="header"
					:style='{"padding":"0","boxShadow":"0 0 12rpx rgba(0,0,0,0)","margin":"0","borderColor":"rgba(0,0,0,0)","backgroundColor":"#fff","borderRadius":"0","color":"#333","borderWidth":"0","width":"100%","lineHeight":"80rpx","fontSize":"28rpx","borderStyle":"solid"}'>
					活动详情
				</view>
				<view class="content"
					:style='{"padding":"24rpx","boxShadow":"0 0 12rpx rgba(0,0,0,0)","margin":"0","borderColor":"#ccc","backgroundColor":"#fff","borderRadius":"8rpx","color":"#333","borderWidth":"2rpx","width":"100%","fontSize":"28rpx","borderStyle":"solid","height":"auto"}'>
					<rich-text style="font-size: 33upx;line-height: 50upx;letter-spacing: 5upx;"
						:nodes="detail.huodongxiangqing"></rich-text>
				</view>
			</view>

			

		</view>

     <liu-drag-button @clickBtn="clickBtn" style="position: relative;">报名</liu-drag-button>
	</mescroll-uni>
	
</template>

<script>
	
	export default {
		data() {
			return {
				lat:'',
				log:'',
				activity_id:'',
				autoplaySwiper: {
					"delay": 5000,
					"disableOnInteraction": false
				} ? true : false,
				intervalSwiper: {
					"delay": 5000,
					"disableOnInteraction": false
				} ? 5000 : 5000,
				btnColor: ['#409eff', '#67c23a', '#909399', '#e6a23c', '#f56c6c', '#356c6c', '#351c6c', '#f093a9',
					'#a7c23a', '#104eff', '#10441f', '#a21233', '#503319'
				],
				id: '',
				userid: '',
				detail: {},
				swiperList: [],
				commentList: [],
				mescroll: null, //mescroll实例对象
				downOption: {
					auto: false //是否在初始化后,自动执行下拉回调callback; 默认true
				},
				upOption: {
					noMoreSize: 3, //如果列表已无数据,可设置列表的总数量要大于半页才显示无更多数据;避免列表数据过少(比如只有一条数据),显示无更多数据会不好看; 默认5
					textNoMore: '~ 没有更多了 ~',
				},
				hasNext: true,
				user: {},
				sfshIndex: -1,
				sfshOptions: ['通过', '不通过'],
				storeupFlag: 0,
				count: 0,
				timer: null,
				
			}
		},
		computed: {
			baseUrl() {
				return this.$base.url;
			},
			
		},
		async onLoad(options) {
			this.id = options.id;
			if (options.userid) {
				this.userid = options.userid;
			}
			if(options.id){
				let res1 = await this.$api.markerinfo(options.id);
				console.log(res1);
				
				 
					this.lat = res1.data.latitude;
					this.log = res1.data.longitude;
						console.log(this.log);
					this.activity_id = options.id;
					
			}
			
				/* console.log('marker5', this.marker); */
		},
		async onShow(options) {
			// 渲染数据
			this.init();
			let table = uni.getStorageSync("nowTable");
			// 获取用户信息
			let res = await this.$api.session(table);
			this.user = res.data;
			this.btnColor = this.btnColor.sort(() => {
				return (0.5 - Math.random());
			});
			this.getStoreup();
		},
		destroyed: function() {
			//window.clearInterval(this.inter);
		},
		methods: {
			 navigateToNavigation() {
				 console.log(this.lat);
			      const initialLatitude = this.lat;
			      const initialLongitude = this.log;
				  console.log(this.log);
				  const activity_id = this.activity_id
			      uni.navigateTo({
			        url: `/pages/huodongxinxi/Navigation?latitude=${initialLatitude}&longitude=${initialLongitude}&activity_id=${activity_id}`,
					success(res) {
					  console.log("跳转成功", res);
					},
					fail(res) {
					  console.log("跳转失败", res);
					}
			      });
			    },
	     clickBtn(){
	                console.log('按钮被点击了')
					console.log(this.user)
					const currentTime = this.$utils.getCurDateTime();

					 const signUpInfo = {
					    activityname: this.detail.huodongmingcheng, 
					    activityid: this.detail.id,
					    userid: this.user.id, 
					    username: this.user.yonghuming, 
						addtime:currentTime,
						sponsor:this.detail.userid,
					    // 其他报名相关信息，根据实际情况添加
					  };
					console.log(signUpInfo)
					  // 调用后端接口，传递报名信息
					  this.$api.add(`baomingxinxi`, signUpInfo)
					    .then(() => {
					      // 报名成功提示
					      this.$utils.msgBack('报名成功');
					     // 触发事件
					     /* this.$emit('clickBtn'); */
					    })
					    .catch((error) => {
					      // 报名失败提示
					      console.error('报名失败：', error);
					      this.$utils.msgBack('报名失败，请稍后重试');
					    });
	            },

			// 收藏
			async getStoreup() {
				let params = {
					page: 1,
					limit: 1,
					refid: this.id,
					tablename: 'huodongxinxi',
					userid: this.user.id,
					type: 1,
				}
				let res = await this.$api.list(`storeup`, params);
				this.storeupFlag = res.data.list.length;
			},
			async shoucang() {
				let _this = this;
				let params = {
					page: 1,
					limit: 1,
					refid: _this.detail.id,
					tablename: 'huodongxinxi',
					userid: _this.user.id,
					type: 1,
				}
				let res = await _this.$api.list(`storeup`, params);
				if (res.data.list.length == 1) {
					let storeupId = res.data.list[0].id;
					uni.showModal({
						title: '提示',
						content: '是否取消',
						success: async function(res) {
							if (res.confirm) {
								await _this.$api.del('storeup', JSON.stringify([storeupId]));
								_this.$utils.msg('取消成功');
								_this.getStoreup();
							}
						}
					});
					return;
				}
				uni.showModal({
					title: '提示',
					content: '是否收藏',
					success: async function(res) {
						if (res.confirm) {
							await _this.$api.add('storeup', {
								userid: _this.user.id,
								name: _this.detail.huodongmingcheng,
								inteltype: _this.detail.huodongleixing,
								picture: _this.swiperList[0],
								refid: _this.detail.id,
								tablename: 'huodongxinxi',
								type: 1
							});
							_this.$utils.msg('收藏成功');
							_this.getStoreup();
						}
					}
				});
			},
			// 跨表
			onAcrossTap(tableName, crossOptAudit, statusColumnName, tips, statusColumnValue) {
				uni.setStorageSync('crossTable', 'huodongxinxi');
				uni.setStorageSync(`crossObj`, this.detail);
				uni.setStorageSync(`statusColumnName`, statusColumnName);
				uni.setStorageSync(`statusColumnValue`, statusColumnValue);
				uni.setStorageSync(`tips`, tips);
				if (statusColumnName != '' && !statusColumnName.startsWith("[")) {
					var obj = uni.getStorageSync('crossObj');
					for (var o in obj) {
						if (o == statusColumnName && obj[o] == statusColumnValue) {
							this.$utils.msg(tips);
							return
						}
					}
				}
				this.$utils.jump(`../${tableName}/add-or-update?cross=true`);
			},
			// 获取详情
			async init() {
				let res = await this.$api.info('huodongxinxi', this.id);
				this.detail = res.data;
				// 轮播图片
				this.swiperList = this.detail.huodongtupian ? this.detail.huodongtupian.split(",") : [];
				//修改富文本的图片样式
				this.detail.huodongxiangqing = this.detail.huodongxiangqing.replace(/img src/gi,
					"img style=\"width:100%;\" src");
					
				let res1 = await this.$api.markerinfo(this.id);
				this.lat = res1.data.latitude;
				this.log= res1.data.longitude;
				
				console.log('marker5', this.marker);
			},

			// mescroll组件初始化的回调,可获取到mescroll对象
			mescrollInit(mescroll) {
				this.mescroll = mescroll;
			},

			/*下拉刷新的回调 */
			downCallback(mescroll) {
				this.hasNext = true
				mescroll.resetUpScroll()
			},

			/*上拉加载的回调: mescroll携带page的参数, 其中num:当前页 从1开始, size:每页数据条数,默认10 */
			async upCallback(mescroll) {
				mescroll.endSuccess(mescroll.size, this.hasNext);

			},



			onChatTap() {
				this.$utils.jump('../chat/chat')
			},
			// 下载
			download(url) {
				let _this = this;
				url = _this.$base.url + url;
				uni.downloadFile({
					url: url,
					success: (res) => {
						if (res.statusCode === 200) {
							_this.$utils.msg('下载成功');
							window.open(url);
						}
					}
				});
			},
			//
		
			
			sfshChange(e) {
				console.log(this.detail)
				this.sfshIndex = e.target.value
				this.detail.sfsh = this.sfshOptions[this.sfshIndex]
			}
		}
	}
</script>

<style lang="scss">
	.container {
		// padding-bottom: 80upx;
	}

	.container:after {
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

	.swiper {
		width: 100%;
		height: 450upx;

		image {
			width: 100%;
		}
	}

	.detail-content {
		font-size: 28upx;
		color: #888888;
		// padding: 10upx 20upx;
		background: #FFFFFF;
		line-height: 45upx;

		.name {
			font-size: 38rpx;
			font-weight: blod;
			// margin-bottom: 20upx;
			padding-top: 20upx;
		}

		.price {
			font-size: 33rpx;
			color: red;
			// margin-top: 20upx;
		}
	}

	.time-content {
		background: #FFFFFF;
		padding: 30upx;
		font-size: 30upx;
		border-radius: 20upx;
		margin-top: 20upx;

		.header {
			font-size: 33upx;
			margin-bottom: 20upx;
		}
	}


	.bottom-content {
		position: fixed;
		bottom: 0;
		left: 0;
		width: 100%;

		button {
			margin: 0 0 0 20rpx !important;
			padding: 0 32rpx;
			box-shadow: 0 0 12rpx rgba(0, 0, 0, 0);
		}
	}

	.comoment-header {
		display: flex;
		justify-content: space-between;
		align-items: center;
		padding-bottom: 12upx;

		.btn-comment-content {
			color: #DD514C;
			font-weight: bold;
			padding: 0 12upx;
		}
	}

	.comment-item {
		margin-bottom: 10upx;
		border-bottom: 1px solid #EEEEEE;
		padding-bottom: 20upx;

		.content {
			margin-left: 20upx;
			margin-top: 20upx;
		}
	}

	.icon {
		width: 50upx;
		height: 50upx;
	}

	.popup-content {
		.popup-form {
			background: #FFFFFF;
			margin-top: 20upx;
		}

		.btn-content {
			text-align: right;
			background: #FFFFFF;

			button {
				margin-left: 20upx;
				margin-right: 20upx;
				margin-bottom: 20upx;
			}
		}
	}

	.detail-list-item {
		padding: 0 24upx;
		box-sizing: border-box;
		display: flex;
		align-items: center;
		height: 68upx;
		border-bottom: 2upx solid #efefef;
		background-color: #fff;

		.lable {
			font-size: 28upx;
			color: #000;
		}

		.text {
			flex: 1;
			font-size: 24upx;
			color: #FF00FF;
			text-align: left;
		}

		&.favor {
			.el-icon-star-on {
				color: inherit;
				font-size: inherit;
			}
		}
	}

	.detail-content .shop-title {
		padding: 20upx 24upx;
		box-sizing: border-box;
		line-height: 1.4;
	}

	.priceFavor {
		// height: 96upx !important;
	}

	.priceFavor .text {
		// font-size: 64upx !important;
		// color: red !important;
	}

	.priceFavor .icon {
		// font-size: 56upx !important;
		// text-align: right !important;
		// color: red !important;
	}
</style>