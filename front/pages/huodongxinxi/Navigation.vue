<template>
	<view>
		<view class="map-container">
			<map style="width: 100%; height: 100vh;" :show-location='true' ref="map" id="map" :latitude="centerlat"
				:longitude="centerlog" :markers="marker" :scale="scale" @callouttap='callouttap'>
				<cover-view class="cover-view" :style=''>
					<cover-view @click="refresh">
						<cover-image class="cover-image" src="/static/刷新.png"></cover-image>
						<cover-view>刷新</cover-view>
					</cover-view>
					<cover-view style="margin-top: 20rpx;" @click="onControltap">
						<cover-image class="cover-image" src="/static/定位.png"></cover-image>
						<cover-view>定位</cover-view>
					</cover-view>

				</cover-view>
			</map>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				latitude: '', //我的位置纬度
				longitude: '', //我的位置经度
				activity_id: '',
				centerlat: '',
				centerlog: '',
				scale: 12, //缩放级别
				marker: [],
				cover: []

			}
		},
		onReady() {

		},
		computed: {},
		async onLoad(options) {

			if (options.latitude && options.longitude && options.activity_id) {
				this.centerlat = parseFloat(options.latitude);
				this.centerlog = parseFloat(options.longitude);
				this.activity_id = parseFloat(options.activity_id);

				/* console.log('centlat',this.centerlat);
				console.log('centlog',this.centerlog);
				console.log('activity',this.activity_id); */
			}
			this.getMarker();
		},
		onShow() {
			this.getLocation();
			this.getMarker();
		},
		methods: {
			async getMarker() {
				/* console.log('centlat',this.centerlat);
				console.log('centlog',this.centerlog);
				console.log('activity',this.activity_id); */
				let params = {
					page: 1,
					limit: 10
				};

				try {
					let res = await this.$api.list('marker', params);
					console.log('marker', res.data.list);

					if (res && res.data && Array.isArray(res.data.list)) {
						this.marker = [];
						this.cover = []; // 重置 cover 数组

						let latOffset = 0.0001; // 经度微调偏移量
						let lngOffset = 0.0001; // 纬度微调偏移量

						let markerMap = new Map(); // 用于存储经纬度及其出现次数的 Map

						// 遍历列表中的每一个 markerItem 对象
						res.data.list.forEach(markerItem => {
							 console.log('markerItem:', markerItem);
							let key = `${markerItem.latitude},${markerItem.longitude}`;
							let count = markerMap.get(key) || 0;
							markerMap.set(key, count + 1);

							let latitude = markerItem.latitude;
							let longitude = markerItem.longitude;

							// 如果有相同经纬度的标注点，则进行微调
							if (count > 0) {
								latitude += count * latOffset;
								longitude += count * lngOffset;
							}
							// 同时将详细信息保存到 cover 数组
							this.cover.push({
								id: markerItem.id,
								longitude: longitude,
								latitude: latitude,
								title: markerItem.title,
							
								activity_id: markerItem.activityId // 确保包含 activity_id 字段
							});
							this.marker.push({
								id: markerItem.id,
								longitude: longitude,
								latitude: latitude,
								iconPath: 'http://localhost:8088/tangfen/upload/location.png',
								width: 20,
								height: 20,
								callout: {
									content: markerItem.title,
									color: '#ffffff',
									fontSize: 15,
									borderRadius: 15,
									padding: '10',
									bgColor: '#406390',
									display: 'ALWAYS'
								}
							});


							console.log('cover', this.cover);
						});
					} else {
						console.error('获取的地点数据无效:', res);
					}
				} catch (error) {
					console.error('获取地点数据时发生错误:', error);
				}
			},
			getLocation() {
			    let that = this;
			    // 获取用户是否开启授权获取当前的地理位置、速度的权限。
			    uni.getSetting({
			        success(res) {
			            // 如果没有授权
			            if (!res.authSetting['scope.userLocation']) {
			                // 则拉起授权窗口
			                uni.authorize({
			                    scope: 'scope.userLocation',
			                    success() {
			                        //点击允许后--就一直会进入成功授权的回调 就可以使用获取的方法了
			                        that.fetchLocation();
			                    },
			                    fail(error) {
			                        //点击了拒绝授权后--就一直会进入失败回调函数--此时就可以在这里重新拉起授权窗口
			                        console.log('拒绝授权', error);
			
			                        uni.showModal({
			                            title: '提示',
			                            content: '若点击不授权，将无法使用位置功能',
			                            cancelText: '不授权',
			                            cancelColor: '#999',
			                            confirmText: '授权',
			                            confirmColor: '#f94218',
			                            success(res) {
			                                if (res.confirm) {
			                                    // 选择弹框内授权
			                                    uni.openSetting({
			                                        success(res) {
			                                            if (res.authSetting['scope.userLocation']) {
			                                                // 用户已经同意授权
			                                                that.fetchLocation();
			                                            }
			                                        }
			                                    });
			                                } else if (res.cancel) {
			                                    // 选择弹框内 不授权
			                                    console.log('用户点击不授权');
			                                }
			                            }
			                        });
			                    }
			                });
			            } else {
			                // 有权限则直接获取
			                that.fetchLocation();
			            }
			        }
			    });
			},
			
			fetchLocation() {
			    let that = this;
			    uni.getLocation({
			        type: 'wgs84',
			        success(res) {
			            that.longitude = res.longitude;
			            that.latitude = res.latitude;
			            console.log('当前位置的经度：' + res.longitude);
			            console.log('当前位置的纬度：' + res.latitude);
			        },
			        fail(error) {
			            uni.showToast({
			                title: '请勿频繁调用！',
			                icon: 'none',
			            });
			            console.log('失败', error);
			        }
			    });
			},


			refresh() {
				this.getLocation()
				console.log('刷新');
				//后期这里可加入调用请求接口的方法，用来实现刷新
			},
			//定位
			onControltap() {
				this.getLocation()
				uni.createMapContext("map", this).moveToLocation({ //moveToLocation将地图中心移动到当前定位点，需要配合map组件的show-location使用
					latitude: this.latitude,
					longitude: this.longitude,
				});
				console.log('定位');
			},

			//地图点击事件
			callouttap(e) {
				var clickmarkerId = e.detail.markerId;
				let markerData = null;

				for (var i = 0; i < this.cover.length; i++) {
					if (this.cover[i].id == clickmarkerId) {
						markerData = this.cover[i];
						break;
					}
				}
				console.log('你点击了气泡标签', e)
				if (markerData) {
					console.log('markerdate', markerData);
					uni.showActionSheet({
						itemList: ['导航', '详情'],
						success: (res) => {
							if (res.tapIndex === 0) {
								// 用户点击导航按钮，执行导航操作
								this.navigateToDestination(markerData, '导航');
							} else if (res.tapIndex === 1) {
								// 用户点击详情按钮，执行详情操作
								this.navigateToDestination(markerData, '详情');
							}
						},
						fail: (res) => {
							console.log('用户取消了操作', res.errMsg);
						}
					});
				} else {
					console.error('未找到对应的 markerData');
				}
			},
			navigateToDestination(marker, action) {
				// 根据标记点或气泡标签的ID执行相应操作，这里仅作为示例
				console.log(`${action}到标记点或气泡标签:`, marker);
				if (action === '导航') {
					// 使用 goto 方法执行导航
					this.goto(marker.latitude, marker.longitude, marker.title);
				} else if (action === '详情') {
					this.$utils.jump(`../huodongxinxi/detail?id=${marker.activity_id}`)
				}
			},
			goto(latitude, longitude, title) {
				// 调用你的 goto 方法，并传递目的地经纬度
				let plugin = requirePlugin('routePlan');
				let key = '3XWBZ-6KC67-ULWXK-HUTAN-W6SJK-JLBTW'; // 使用在腾讯位置服务申请的key
				let referer = 'map'; // 调用插件的app的名称
				let startPoint = JSON.stringify({ // 起点
					'name': '我的位置',
					latitude: this.latitude,
					longitude: this.longitude
				});
				let endPoint = JSON.stringify({ // 终点
					name: title,
					latitude: latitude,
					longitude: longitude
				});
				uni.navigateTo({
					url: 'plugin://routePlan/index?key=' + key + '&referer=' + referer + '&endPoint=' + endPoint +
						'&startPoint=' + startPoint + '&navigation=1',
					success(res) {
						console.log("res==1111=", res)
					},
					fail(res) {
						console.log("res==2222=", res)
					},
				});
			}

		}
	}
</script>

<style scoped lang="scss">
	.map-container {
		/* margin-top: -40rpx; */
		position: relative;
		overflow: hidden;


		.cover-view {
			display: flex;
			flex-direction: column;
			align-items: center;
			justify-content: center;
			/* width: 80rpx;
			height: 160rpx; */
			padding: 42rpx 22rpx;
			color: #4F575F;
			font-weight: 400;
			background-color: #fff;
			background-size: 120rpx 120rpx;
			background-position: center center;
			position: absolute;
			top: 150rpx;
			right: 32rpx;
			border-radius: 15rpx;


		}

		.cover-image {
			display: inline-block;
			width: 50rpx;
			height: 50rpx;

		}
	}
</style>