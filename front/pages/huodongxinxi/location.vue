<template>
	<view>

	</view>
</template>

<script>
	const chooseLocation = requirePlugin('chooseLocation');

	export default {
		data() {
			return {
				location: {}
			}
		},
		
		onLoad() {
			// 1. 插件页面调用
			let latLng = wx.getStorageSync('location');
			const key = '3XWBZ-6KC67-ULWXK-HUTAN-W6SJK-JLBTW'; // 使用在腾讯位置服务申请的key
			const referer = 'map'; // 调用插件的app的名称
			const location = JSON.stringify({
				latitude: latLng.latitude,
				longitude: latLng.longitude
			});
			const category = '酒店宾馆,旅游景点';

			uni.navigateTo({
				url: `plugin://chooseLocation/index?key=${key}&referer=${referer}&location=${location}&category=${category}`
			})
		},
		onShow() {
			this.location = chooseLocation.getLocation(); // 如果点击确认选点按钮，则返回选点结果对象，否则返回null
			if (this.location == null) return
			wx.setStorageSync('chooseLocation', this.location)

		},
		onHide() {},
		onUnload() {
			chooseLocation.setLocation(null);
		},
		methods: {}
	}
</script>

<style>

</style>