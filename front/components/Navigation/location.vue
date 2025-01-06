<template>
    <view>
        <!-- 页面内容 -->
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
        onLoad(options) {
            // 获取传递过来的经纬度
            const latitude = options.latitude;
            const longitude = options.longitude;
            const key = '3XWBZ-6KC67-ULWXK-HUTAN-W6SJK-JLBTW'; // 使用在腾讯位置服务申请的key
            const referer = 'map'; // 调用插件的app的名称
            const location = JSON.stringify({
                latitude: latitude,
                longitude: longitude
            });
            const category = '自然景区'; // 只推荐自然景区

            uni.navigateTo({
                url: `plugin://chooseLocation/index?key=${key}&referer=${referer}&location=${location}&category=${category}`
            });
        },
        onShow() {
            this.location = chooseLocation.getLocation(); // 如果点击确认选点按钮，则返回选点结果对象，否则返回null
            if (this.location) {
                wx.setStorageSync('chooseLocation', this.location);

                // 选点成功后跳转回活动信息页面，并传递选点的经纬度和名称
                const latitude = this.location.latitude;
                const longitude = this.location.longitude;
                const name = this.location.name;

                uni.navigateTo({
                    url: `add-or-update?latitude=${latitude}&longitude=${longitude}&name=${name}`
                });
            }
        },
        onHide() {},
        onUnload() {
            chooseLocation.setLocation(null);
        },
        methods: {}
    }
</script>

<style>
/* 页面样式 */
</style>
