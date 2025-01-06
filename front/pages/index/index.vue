<template>
	<view class="uni-padding-wrap">
		<view class="cu-bar bg-white search" :style="[{top:CustomBar + 'px'}]">
			<picker v-if="queryList.length>1" mode="selector" :range="queryList" range-key="queryName"
				:value="queryIndex" @change="queryChange" style="padding-left: 20upx;">
				<view>
					<image style="width: 20upx;height: 33upx;" src="../../static/center/to.png"></image>
				</view>
			</picker>
			<view v-if="queryIndex==0" class="search-form round">
				<text class="cuIcon-search"></text>
				<input v-model="searchForm.huodongxinxihuodongmingcheng" type="text" placeholder="活动名称"></input>
			</view>
			<view v-if="queryIndex==0" class="action">
				<button @tap="onPageTap('huodongxinxi')" :style='{
					    "width": "auto",
					    "borderRadius": "48rpx",
					    "height": "60rpx",
					    "fontSize": "28rpx",
					    "color": "#fff",
					    "backgroundColor": "rgb(66, 165, 245)"
					}' class="cu-btn shadow-blur round">搜索</button>
			</view>
		</view>
		<view class="header">
			<view class="headerb">
				<swiper
					:style='{"padding":"0","boxShadow":"0 2rpx 12rpx rgba(0,0,0,0)","margin":"0","borderColor":"rgba(0,0,0,0)","backgroundColor":"rgba(255,255,255,1)","borderRadius":"20rpx","borderWidth":"0","width":"100%","borderStyle":"solid","height":"300rpx"}'
					class="swiper" :indicator-dots='".swiper-pagination"==null?false:true' :autoplay='autoplaySwiper'
					:circular='true' indicator-active-color='rgba(194, 228, 106, 1)' indicator-color='rgba(0, 0, 0, .3)'
					:duration='1000' :interval='intervalSwiper' :vertical='"horizontal"=="horizontal"?false:true'>
					<swiper-item
						:style='{"padding":"0","boxShadow":"0 2rpx 12rpx rgba(0,0,0,0)","margin":"0","borderColor":"rgba(0,0,0,0)","backgroundColor":"rgba(255,255,255,1)","borderRadius":"0","borderWidth":"0","width":"100%","borderStyle":"solid","height":"300rpx"}'
						v-for="(swiper,index) in swiperList" :key="index" @tap="onSwiperTap(swiper)">
						<image
							:style='{"padding":"0","boxShadow":"0 2rpx 12rpx rgba(0,0,0,0)","margin":"0","borderColor":"rgba(0,0,0,0)","backgroundColor":"rgba(255,255,255,1)","borderRadius":"0","borderWidth":"0","width":"100%","borderStyle":"solid","height":"300rpx"}'
							mode="aspectFill" :src="baseUrl+swiper.img"></image>
						<view v-if="false"
							:style='{"padding":"0 8rpx","boxShadow":"0 2rpx 12rpx rgba(0,0,0,0)","margin":"0","borderColor":"rgba(0,0,0,0)","backgroundColor":"rgba(255,255,255,1)","color":"#333","textAlign":"center","isshow":false,"borderRadius":"0","borderWidth":"0","width":"100%","lineHeight":"60rpx","fontSize":"28rpx","borderStyle":"solid"}'>
							{{ swiper.title }}
						</view>
					</swiper-item>
				</swiper>
			</view>
		</view>




		<!-- 活动信息推荐 -->
		<view class="listBox recommend list" style="margin: 20rpx 0;">

			<view style="display: flex; flex-direction: row; justify-content: space-between;
			align-items: center; padding-bottom: 10rpx;">
				<view style="font-size: 40rpx; font-weight:bold;padding: 10upx 0; ">
					活动信息推荐</view>
			</view>

			<!-- 样式2 -->
			<view v-if="2 == 2" class="list-box style1">
				<view @tap="onDetailTap('huodongxinxi',product.id)" v-for="(product,index) in huodongxinxilist"
					:key="index" class="list-item listm">
					<view class="uni-product-title">{{product.huodongmingcheng}}</view>
					<image class="uni-product-image" mode="aspectFill"
						:src="product.huodongtupian?baseUrl+product.huodongtupian.split(',')[0]:''"></image>
				</view>
			</view>

		</view>

		<!-- 攻略列表 -->
		<view class="listBox list">

			<view style="display: flex; flex-direction: row; justify-content: space-between; 
			align-items: center; padding-bottom: 20upx; ">
				<view style="font-size: 40rpx; font-weight:bold; ">
					精选攻略与游记</view>
				<view> <text @tap="onPageTap('yonghufabu')">查看更多</text></view>

			</view>

			<view v-if="1 == 1" class=" style1">

				<view @tap="onDetailTap('yonghufabu',product.id)" v-for="(product,index) in homeyonghufabulist"
					:key="index" class="list-item listm">
					<view class="uni-product-title">{{product.biaoti}}</view>
					<image class="uni-product-image" mode="aspectFill"
						:src="product.tupian?baseUrl+product.tupian.split(',')[0]:''"></image>
				</view>
			</view>

		</view>
		<!-- 新闻资讯 -->
		<view class="listBox news " style="margin-top: 20upx;    padding: 10rpx 20rpx 10rpx ;">

			<view style="display: flex; flex-direction: row; justify-content: space-between;
			align-items: center;">
				<view style="font-size: 40rpx; font-weight:bold;padding: 10upx 0; ">
					公告与资讯</view>
				<view style="padding: 10upx 0;"> <text @tap="onPageTap('news')">查看更多</text></view>

			</view>
			<view class="news-box2">
				<block v-for="(item,index) in news" :key="index">
					<view @tap="onNewsDetailTap(item.id)" v-if="index==0" class="list-item" style="position: relative;">
						<image mode="aspectFill" class="uni-product-image listmpic" :src="baseUrl+item.picture"></image>
						<view style="position: absolute;bottom: 0;left: 0;"
							:style='{"padding":"0 20rpx","boxShadow":"0 0 12rpx rgba(255,0,0,0)","margin":"0","borderColor":"red","color":"#fff","textAlign":"center","borderRadius":"0 0 20rpx 20rpx","borderWidth":"0","width":"100%","lineHeight":"80rpx","fontSize":"28rpx","borderStyle":"solid"}'
							class="title hide1">{{item.title}}</view>
					</view>
					<view @tap="onNewsDetailTap(item.id)" v-if="index>0" class="list-item"
						:style='{"padding":"0 20rpx","margin":"30rpx auto","box-shadow":" rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px 6px","borderColor":"#ccc","backgroundColor":"rgba(255,255,255,1)","borderRadius":"20rpx","borderWidth":"0","width":"100%","borderStyle":"solid","height":"auto"}'>

						<view
							:style='{"padding":"0","boxShadow":"0 0 12rpx rgba(255,0,0,0)","margin":"0","borderColor":"#ccc","backgroundColor":"rgba(255,0,0,0)","color":"rgba(0, 0, 0, 1)","textAlign":"left","borderRadius":"0","borderWidth":"0","width":"100%","lineHeight":"80rpx","fontSize":"28rpx","borderStyle":"solid"}'
							class="title hide1">{{item.title}}</view>
					</view>
				</block>
			</view>

		</view>
		<!-- 新闻资讯 -->




	</view>
</template>

<script>
	import menu from '@/utils/menu'
	import '@/assets/css/global-restaurant.css'
	import uniIcons from "@/components/uni-ui/lib/uni-icons/uni-icons.vue"
	export default {
		components: {
			uniIcons
		},
		data() {
			return {
				rows: 2,
				column: 5,
				iconArr: [
					'cuIcon-same',
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
					'cuIcon-selection'
				],
				role: '',
				menuList: [],
				swiperMenuList: [],
				user: {},
				tableName: '',
				btnColor: ['#409eff', '#67c23a', '#909399', '#e6a23c', '#f56c6c', '#356c6c', '#351c6c', '#f093a9',
					'#a7c23a', '#104eff', '#10441f', '#a21233', '#503319'
				],
				queryList: [{
					queryName: "活动地区",
				}, ],
				queryIndex: 0,
				searchForm: {
					huodongxinxihuodongdiqu: '',
				},
				CustomBar: '0',

				autoplaySwiper: {
					"delay": 5000,
					"disableOnInteraction": false
				} ? true : false,
				intervalSwiper: {
					"delay": 5000,
					"disableOnInteraction": false
				} ? 5000 : 5000,
				//轮播
				swiperList: [],
				huodongxinxilist: [],
				homeyonghufabulist: [],
				news: [],
			}
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
			this.menuList.forEach((item, key) => {
				if (this.role == item.roleName) {
					item.frontMenu.forEach((item2, key2) => {
						if (item2.child[0].buttons.indexOf("查看") > -1) {
							this.swiperMenuList.push(item2);
						}
					})
				}
			})
		},
		async onShow() {
			this.btnColor = this.btnColor.sort(() => {
				return (0.5 - Math.random());
			});
			// 轮播图
			let swiperList = []
			let res = await this.$api.page('config', {
				page: 1,
				limit: 5
			});
			for (let item of res.data.list) {
				if (item.name.indexOf('picture') >= 0 && item.value && item.value != "" && item.value != null) {
					swiperList.push({
						img: item.value,
						title: item.name
					});
				}
			}
			if (swiperList) {
				this.swiperList = swiperList;
			}
			// 公告资讯
			res = await this.$api.list('news', {
				page: 1,
				limit: 6
			});
			this.news = res.data.list

			// 推荐信息
			if (uni.getStorageSync("userid") !== null) {
				res = await this.$api.recommend2('huodongxinxi', {
					page: 1,
					limit: 6
				});
			} else {
				res = await this.$api.recommend('huodongxinxi', {
					page: 1,
					limit: 6
				});
			}
			this.huodongxinxilist = res.data.list

			res = await this.$api.list('yonghufabu', {
				page: 1,

				limit: 4
			});
			this.homeyonghufabulist = res.data.list
		},

		methods: {

			//查询条件切换
			queryChange(e) {
				this.queryIndex = e.detail.value;
				this.searchForm.huodongxinxihuodongdiqu = "";
			},
			//轮播图跳转
			onSwiperTap(e) {

			},
			// 新闻详情
			onNewsDetailTap(id) {
				this.$utils.jump(`../news-detail/news-detail?id=${id}`)
			},
			// 推荐列表点击详情
			onDetailTap(tableName, id) {
				this.$utils.jump(`../${tableName}/detail?id=${id}`)
			},
			onPageTap(tableName) {
				if (this.queryIndex == 0) {
					uni.setStorageSync('indexQueryCondition', this.searchForm.huodongxinxihuodongdiqu);
					this.searchForm.huodongxinxihuodongdiqu = '';
				}

				uni.navigateTo({
					url: `../${tableName}/list`,
					fail: function() {
						uni.switchTab({
							url: `../${tableName}/list`
						});
					}
				});
				// this.$utils.jump(`../${tableName}/list`)
			},
			onPageTap2(url) {
				uni.setStorageSync("useridTag", 0);
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

<style>
	page {
		background: #F8F8F8;
	}

	.uni-padding-wrap:after {
		position: fixed;
		top: 0;
		right: 0;
		left: 0;
		bottom: 0;
		content: '';
		background-attachment: fixed;
		background-size: cover;
		background-position: center;
		background-color: rgb(228, 228, 228);
	}

	view {
		// font-family: '\5FAE\8F6F\96C5\9ED1';
		font-size: 30upx;
	}

	.header {
		background: #EEEEEE;
		padding: 0 0 300upx 0;
		margin-bottom: 20upx;
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
		width: 100%;
		box-sizing: border-box;
	}

	.headerb image {
		width: 100%;
		position: relative;
		z-index: 10;
	}

	.headerb .swiper {
		height: 300upx;
	}

	.swiper /deep/ .uni-swiper-dot {
		width: 16rpx;
		height: 16rpx;
		broder-radius: 50%;
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
		padding: 20upx 20upx 20upx;
	}

	.listm {
		background: #fff;
		/* box-shadow: rgba(0, 0, 0, 0.24) 0upx 3upx 8upx; */
		box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px 6px;
		margin-bottom: 20upx;
		padding: 10upx 20upx 20upx;
		width: 100%;
		border-radius: 10upx;
	}

	.listmpic {
		border-radius: 10upx;
		width: 166upx;
		margin-right: 20upx;
	}

	.listmr {
		// width: 460upx;
		display: inline-block;
		flex: 1;
		display: flex;
		justify-content: space-between;
		flex-direction: column;
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

	/* #endif */

	.uni-product-list {
		display: flex;
		width: 100%;
		flex-wrap: wrap;
		flex-direction: row;
		margin-top: 0;
		padding: 0 14upx;
		box-sizing: border-box;
	}

	.uni-product-list.active {
		padding: 0 12upx;
	}

	.uni-product {
		padding: 10upx;
		margin: 10upx;
		width: 341upx;
		box-sizing: border-box;
		display: flex;
		flex-direction: column;
		background: #FFFFFF;
	}

	.uni-product-list.active .uni-product {
		width: 222upx;
	}

	.image-view {
		height: 321upx;
		width: 321upx;
		// margin: 12upx 0;
		display: flex;
		align-items: center;
		overflow: hidden;
	}

	.uni-product-image {
		border-radius: 10upx;
		width: 100%;
		height: 200upx;
	}

	.uni-product-list.active .image-view {
		height: 202upx;
		width: 202upx;
		overflow: hidden;
	}



	.uni-product-title {
		width: 100%;
		word-break: break-all;
		display: -webkit-box;
		overflow: hidden;
		/* line-height: 1.5; */
		text-overflow: ellipsis;
		-webkit-box-orient: vertical;
		-webkit-line-clamp: 2;
		margin: 10rpx;
		font-family: '\5FAE\8F6F\96C5\9ED1';
		font-size: 30upx;
	}

	.uni-product-price {
		width: 100%;
		margin-top: 10upx;
		font-size: 28upx;
		line-height: 1.5;
		position: relative;
	}

	.uni-product-price-original {
		color: #e80080;
	}

	.uni-product-price-favour {
		color: #888888;
		text-decoration: line-through;
		margin-left: 10upx;
	}

	.uni-product-tip {
		position: absolute;
		right: 10upx;
		background-color: #ff3333;
		color: #ffffff;
		padding: 0 10upx;
		border-radius: 5upx;
	}

	.header-title {
		display: flex;
		align-items: center;
		text-align: center;
		justify-content: space-between;
		padding: 0 40upx;
	}

	.listBox>.title {
		display: flex;
		flex-wrap: wrap;
	}

	.listBox .list-box .box {
		position: relative;
	}

	.listBox .list-box .box .title {
		position: absolute;
		left: 0;
		bottom: 0;
		z-index: 1;
	}

	.listBox .style1 {
		display: flex;
		justify-content: space-between;
		flex-wrap: wrap;

	}

	.listBox .style2 {
		display: flex;
		justify-content: space-between;
		flex-wrap: wrap;
	}

	.listBox .style3 .list-item {
		display: flex;
	}

	.listBox .style4 .list-item {
		display: flex;
		flex-wrap: wrap;
	}

	.listBox .style6 .list-item {
		display: flex;
		flex-wrap: wrap;
	}

	.listBox .style6 .list-item .list-item-body {
		display: flex;
		flex-wrap: wrap;
	}

	.listBox .style7 .list-item {
		display: flex;
		flex-wrap: wrap;
	}

	.listBox .style8 .list-item {
		display: flex;
		flex-wrap: wrap;
	}

	.listBox .style9 .list-item {
		display: flex;
		flex-wrap: wrap;
	}

	.listBox .idea {
		display: flex;
		flex-wrap: wrap;
	}

	.listBox .idea .box {
		display: flex;
		justify-content: center;
		align-items: center;
		background-repeat: no-repeat;
		background-size: 100% 100%;
	}

	.listBox .recommendIdea .box1 {
		margin: 0 2%;
		padding: 0;
		width: 0;
		height: 160rpx;
		font-size: 28rpx;
		color: #FFF;
		border-radius: 0;
		border-width: 0;
		border-style: solid;
		border-color: #ccc;
		background-color: rgba(0, 0, 0, .3);
		box-shadow: 0 0 12rpx rgba(0, 0, 0, 0);
	}

	.listBox .recommendIdea .box2 {
		margin: 0 2%;
		padding: 0;
		width: 0;
		height: 160rpx;
		font-size: 28rpx;
		color: #FFF;
		border-radius: 0;
		border-width: 0;
		border-style: solid;
		border-color: #ccc;
		background-color: rgba(0, 0, 0, .3);
		box-shadow: 0 0 12rpx rgba(0, 0, 0, 0);
	}

	.listBox .recommendIdea .box3 {
		margin: 0 2%;
		padding: 0;
		width: 0;
		height: 160rpx;
		font-size: 28rpx;
		color: #FFF;
		border-radius: 0;
		border-width: 0;
		border-style: solid;
		border-color: #ccc;
		background-color: rgba(0, 0, 0, .3);
		box-shadow: 0 0 12rpx rgba(0, 0, 0, 0);
	}

	.listBox .recommendIdea .box4 {
		margin: 0 2%;
		padding: 0;
		width: 0;
		height: 160rpx;
		font-size: 28rpx;
		color: #FFF;
		border-radius: 0;
		border-width: 0;
		border-style: solid;
		border-color: #ccc;
		background-color: rgba(0, 0, 0, .3);
		box-shadow: 0 0 12rpx rgba(0, 0, 0, 0);
	}

	.listBox .listIdea .box4 {
		margin: 0 2%;
		padding: 0;
		width: 0;
		height: 160rpx;
		font-size: 28rpx;
		color: #FFF;
		border-radius: 0;
		border-width: 0;
		border-style: solid;
		border-color: #ccc;
		background-color: rgba(0, 0, 0, .3);
		box-shadow: 0 0 12rpx rgba(0, 0, 0, 0);
	}

	.listBox .listIdea .box1 {
		margin: 0 2%;
		padding: 0;
		width: 0;
		height: 200rpx;
		font-size: 28rpx;
		color: #FFF;
		border-radius: 0;
		border-width: 0;
		border-style: solid;
		border-color: #ccc;
		background-color: rgba(0, 0, 0, .3);
		box-shadow: 0 0 12rpx rgba(0, 0, 0, 0);
	}

	.listBox .listIdea .box2 {
		margin: 0 2%;
		padding: 0;
		width: 0;
		height: 160rpx;
		font-size: 28rpx;
		color: #FFF;
		border-radius: 0;
		border-width: 0;
		border-style: solid;
		border-color: #ccc;
		background-color: rgba(0, 0, 0, .3);
		box-shadow: 0 0 12rpx rgba(0, 0, 0, 0);
	}

	.listBox .listIdea .box3 {
		margin: 0 2%;
		padding: 0;
		width: 0;
		height: 160rpx;
		font-size: 28rpx;
		color: #FFF;
		border-radius: 0;
		border-width: 0;
		border-style: solid;
		border-color: #ccc;
		background-color: rgba(0, 0, 0, .3);
		box-shadow: 0 0 12rpx rgba(0, 0, 0, 0);
	}

	.listBox .newsIdea .box1 {
		margin: 0 2%;
		padding: 0;
		width: 0;
		height: 160rpx;
		font-size: 28rpx;
		color: #FFF;
		border-radius: 0;
		border-width: 0;
		border-style: solid;
		border-color: #ccc;
		background-color: rgba(0, 0, 0, .3);
		box-shadow: 0 0 12rpx rgba(0, 0, 0, 0);
	}

	.listBox .newsIdea .box2 {
		margin: 0 2%;
		padding: 0;
		width: 0;
		height: 160rpx;
		font-size: 28rpx;
		color: #FFF;
		border-radius: 0;
		border-width: 0;
		border-style: solid;
		border-color: #ccc;
		background-color: rgba(0, 0, 0, .3);
		box-shadow: 0 0 12rpx rgba(0, 0, 0, 0);
	}

	.listBox .newsIdea .box3 {
		margin: 0 2%;
		padding: 0;
		width: 0;
		height: 160rpx;
		font-size: 28rpx;
		color: #FFF;
		border-radius: 0;
		border-width: 0;
		border-style: solid;
		border-color: #ccc;
		background-color: rgba(0, 0, 0, .3);
		box-shadow: 0 0 12rpx rgba(0, 0, 0, 0);
	}

	.listBox .newsIdea .box4 {
		margin: 0 2%;
		padding: 0;
		width: 0;
		height: 160rpx;
		font-size: 28rpx;
		color: #FFF;
		border-radius: 0;
		border-width: 0;
		border-style: solid;
		border-color: #ccc;
		background-color: rgba(0, 0, 0, .3);
		box-shadow: 0 0 12rpx rgba(0, 0, 0, 0);
	}

	.iconarr {
		text-align: center;
		line-height: 84rpx;
	}

	.news-box6 .dian::before {
		content: "";
		display: block;
		width: 8upx;
		height: 8upx;
		background-color: red;
		position: absolute;
		top: -4upx;
		left: 50%;
		transform: translateX(-50%);
		border-radius: 100%;
		z-index: 1;
	}

	.hide1 {
		overflow: hidden;
		text-overflow: ellipsis;
		display: -webkit-box;
		-webkit-line-clamp: 1;
		line-clamp: 1;
		-webkit-box-orient: vertical;
	}

	.hide2 {
		overflow: hidden;
		text-overflow: ellipsis;
		display: -webkit-box;
		-webkit-line-clamp: 2;
		line-clamp: 2;
		-webkit-box-orient: vertical;
	}

	.hide4 {
		overflow: hidden;
		text-overflow: ellipsis;
		display: -webkit-box;
		-webkit-line-clamp: 4;
		line-clamp: 4;
		-webkit-box-orient: vertical;
	}

	.listBox {
		background-color: #fff;
	}
</style>