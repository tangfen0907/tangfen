<template>
	<view>
		<map @markertap="goto" class="map" :markers="cover" :longitude="log" :latitude="lat"></map>
		<!-- <button class="btn-long" @click="doNavi()">导航</button> -->
	</view>
</template>

<script>
	import QQMapWx from '@/utils/qqmap-wx-jssdk.js'
	export default {
		name: 'Navigation',
		props: {
			initialLatitude: {
				type: String,
				default: '23.10647'
			},
			initialLongitude: {
				type: String,
				default: '113.32446'
			}
		},
		data() {
			return {
				lat: this.initialLatitude,
				log: this.initialLongitude,
				qqmapsdk: '',
				cover: [{
					id: 1,
					iconPath: "/static/location.png",
					longitude: '113.32446',
					latitude: '23.10647',
					width: 30,
					height: 25
				}]
			}
		},
		onLoad: function() {
			this.qqmapsdk = new QQMapWx({
				key: '3XWBZ-6KC67-ULWXK-HUTAN-W6SJK-JLBTW'
			});

		},
		onShow: function() {
			//调用接口
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
		},
		methods: {
			goto() {
				let plugin = requirePlugin('routePlan');
				let key = '3XWBZ-6KC67-ULWXK-HUTAN-W6SJK-JLBTW'; //使用在腾讯位置服务申请的key
				let referer = 'map'; //调用插件的app的名称
				let startPoint = JSON.stringify({ //终点
					'name': '我的位置',
					latitude: this.lat,
					longitude: this.log
				});
				let endPoint = JSON.stringify({ //终点
					'name': '青岛大学',
					latitude: 36.60061184894021,
					longitude: 117.45523630249923
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

<style lang="scss" scoped>
	.map {
		width: 100vw;
		height: 100vh;
	}
</style>