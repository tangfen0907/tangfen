<template>
	<view>
		<map @markertap="goto" @callouttap="callouttap" class="map" :markers="cover" :longitude="centerlog" :latitude="centerlat"></map>
		<!-- <cover-view v-for="(item, index) in covers" :key="index" :marker-id="item.id" class="customCallout">
			<cover-view class="content">
				<cover-image :src="item.imageUrl" class="callout-image"></cover-image>
				<text>{{ item.name }}</text>
				<button @click="goto(item)">导航</button>
			</cover-view>
		</cover-view> -->
		<!-- <cover-view slot="callout">
			<cover-view marker-id="1">
				<cover-view >
					<cover-view class="button" bindtap="testEvent1">按钮1</cover-view>
					<cover-view class="button" bindtap="testEvent2">按钮2</cover-view>
				</cover-view>
			</cover-view>
		</cover-view> -->
	</view>
</template>

<script>
	import QQMapWx from '@/utils/qqmap-wx-jssdk.js'
	export default {

		data() {
			return {
				//中心维度
				centerlat: this.initialLatitude,
				centerlog: this.initialLongitude,
				//路径规划开始维度
				startlat: '112.90737',
				startlog: '27.85632',
				//路径规划结束维度
				endlat: '',
				endlog: '',
				name: '',
				qqmapsdk: '',
				//标注点
				cover: [],
				marker: []
			}
		},
		onLoad(options) {
			// 获取传递过来的参数
			this.centerlat = options.latitude || '23.10647';
			this.centerlog = options.longitude || '113.32446';
			console.log('lat',this.centerlat);
			console.log('log',this.centerlog);
			this.qqmapsdk = new QQMapWx({
				key: '3XWBZ-6KC67-ULWXK-HUTAN-W6SJK-JLBTW'
			});
			
		},
		onShow() {
			this.qqmapsdk.search({
				keyword: '酒店',
				success: function(res) {
					console.log(res);
				},
				fail: function(res) {
					console.log(res);
				},
				complete: function(res) {
					console.log(res);
				}
			});
			this.getCover();
			/* this.getLocation(); */
		},
		methods: {
			goto() {
				let plugin = requirePlugin('routePlan');
				let key = '3XWBZ-6KC67-ULWXK-HUTAN-W6SJK-JLBTW'; //使用在腾讯位置服务申请的key
				let referer = 'map'; //调用插件的app的名称
				let startPoint = JSON.stringify({ //终点
					'name': '我的位置',
					latitude: this.startlat,
					longitude: this.startlog
				});
				let endPoint = JSON.stringify({ //终点
					name: this.name,
					latitude: this.endlat,
					longitude: this.endlog
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
			},
			/* goto() {
				let plugin = requirePlugin('routePlan');
				let key = '3XWBZ-6KC67-ULWXK-HUTAN-W6SJK-JLBTW';
				let referer = 'map';
				let startPoint = JSON.stringify({
					name: '我的位置',
					latitude: this.startlat,
					longitude: this.startlog
				});
				let endPoint = JSON.stringify({
					name: item.name,
					latitude: item.latitude,
					longitude: item.longitude
				});

				uni.navigateTo({
					url: `plugin://routePlan/index?key=${key}&referer=${referer}&endPoint=${endPoint}&startPoint=${startPoint}&navigation=1`,
					success(res) {
						console.log("导航成功", res);
					},
					fail(res) {
						console.log("导航失败", res);
					}
				});
			}, */
			async getCover() {
				let params = {
					page: 1,
					limit: 10
				};

				try {
					let res = await this.$api.list('marker', params);
					console.log('marker', res.data.list);

					if (res && res.data && Array.isArray(res.data.list)) {
						// 清空 cover 数组，以防之前的数据残留
						this.cover = [];

						// 循环遍历获取的地点数据
						res.data.list.forEach(marker => {
							// 添加地点的经纬度信息到 cover 数组中
							this.cover.push({
								id: marker.id,
								longitude: marker.longitude,
								latitude: marker.latitude,
								name: marker.title,
								/* activtiy_id: marker.activtiy_id, */
								iconURL: '../static/location.png',
								/* imageUrl: marker.imageUrl, */
								width: '100prx',
								height: '100rpx',
								customCallout: {
									display: 'ALWAYS'
								}
								// 如果有其他需要添加的字段，也可以在这里添加
							});
						});

						console.log('cover', this.cover);
					} else {
						console.error('获取的地点数据无效:', res);
					}
				} catch (error) {
					console.error('获取地点数据时发生错误:', error);
				}
			},


			markertap(e) {
				console.log(e)
				var clickmarkerId = e.mp.detail.markerId
				//根据e.mp.detail.markerId跟撒点的id进行判断，如果相等就进行赋值
				for (var i = 0; i < this.cover.length; i++) {
					if (this.cover[i].id == clickmarkerId) {
						this.endlog = this.cover[i].longitude
						this.endlat = this.cover[i].latitude
						this.name = this.cover[i].title
						/* this.sendaddress = this.marker[i].address */
					}
				}
			},

			getLocation() {
				let that = this
				// 获取用户是否开启 授权获取当前的地理位置、速度的权限。
				uni.getSetting({
					success(res) {
						
						// 如果没有授权
						if (!res.authSetting['scope.userLocation']) {
							// 则拉起授权窗口
							uni.authorize({
								scope: 'scope.userLocation',
								success() {
									//点击允许后--就一直会进入成功授权的回调 就可以使用获取的方法了
									uni.getLocation({
										type: 'wgs84',
										success: function(res) {
											that.startlog = res.longitude
											that.startlat = res.latitude
											console.log(res)
											console.log('当前位置的经度：' + res.longitude)
											console.log('当前位置的纬度：' + res.latitude)
											uni.showToast({
												title: '当前位置的经纬度：' + res.longitude +
													',' + res.latitude,
												icon: 'success',
												mask: true
											})
										},
										fail(error) {
											console.log('失败', error)
										}
									})
								},
								fail(error) {
									//点击了拒绝授权后--就一直会进入失败回调函数--此时就可以在这里重新拉起授权窗口
									console.log('拒绝授权', error)

									uni.showModal({
										title: '提示',
										content: '若点击不授权，将无法使用位置功能',
										cancelText: '不授权',
										cancelColor: '#999',
										confirmText: '授权',
										confirmColor: '#f94218',
										success(res) {
											console.log(res)
											if (res.confirm) {
												// 选择弹框内授权
												uni.openSetting({
													success(res) {
														console.log(res.authSetting)
													}
												})
											} else if (res.cancel) {
												// 选择弹框内 不授权
												console.log('用户点击不授权')
											}
										}
									})
								}
							})
						} else {
							// 有权限则直接获取
							uni.getLocation({
								type: 'wgs84',
								success: function(res) {
									that.startlog = res.longitude
									that.startlat = res.latitude
									console.log(res)
									console.log('当前位置的经度：' + res.longitude)
									console.log('当前位置的纬度：' + res.latitude)
									uni.showToast({
										title: '当前位置的经纬度：' + res.longitude + ',' + res
											.latitude,
										icon: 'success',
										mask: true
									})
								},
								fail(error) {
									uni.showToast({
										title: '请勿频繁调用！',
										icon: 'none',
									})
									console.log('失败', error)
								}
							})
						}
					}
				})

			}

		}
	}
</script>

<style lang="scss" scoped>
	.map {
		width: 100vw;
		height: 100vh;
	}
</style>