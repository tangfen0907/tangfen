<template>
	<view class="content">
		<form class="app-update-pv">

			<view class="cu-form-group select">
				<view class="title">活动地区</view>
				<picker @change="huodongdiquChange" :value="huodongdiquIndex" :range="huodongdiquOptions">
					<view class="uni-input">{{ruleForm.huodongdiqu?ruleForm.huodongdiqu:"请选择活动地区"}}</view>
				</picker>
			</view>
			<view class="cu-form-group">
				<view class="title">活动名称</view>
				<input class="inputClass" :disabled="ro.huodongmingcheng" v-model="ruleForm.huodongmingcheng"
					placeholder="活动名称"></input>
			</view>
			<view class="cu-form-group select">
				<view class="title">活动类型</view>
				<picker @change="huodongleixingChange" :value="huodongleixingIndex" :range="huodongleixingOptions">
					<view class="uni-input">{{ruleForm.huodongleixing?ruleForm.huodongleixing:"请选择活动类型"}}</view>
				</picker>
			</view>
			<view class="cu-form-group" @tap="huodongtupianTap">
				<view class="title">活动图片</view>
				<view class="right-input" style="padding:0">
					<image class="avator" v-if="ruleForm.huodongtupian" :src="baseUrl+ruleForm.huodongtupian"
						mode="aspectFill"></image>
					<image class="avator" v-else src="../../static/gen/upload.png" mode="aspectFill"></image>
				</view>
			</view>
			<view class="cu-form-group">
				<view class="title">活动地点</view>
				<input class="inputClass" :disabled="ro.huodongdidian" v-model="ruleForm.huodongdidian"
					placeholder="活动地点"></input> <button class="cu-btn bg-green shadow button1Class "
					@click="goto()">选点</button>

			</view>
			<view class="cu-form-group">
				<view class="title">活动时间</view>
				<input class="inputClass" v-model="ruleForm.huodongshijian" placeholder="活动时间"
					@tap="toggleTab('huodongshijian')"></input>
			</view>
			<!-- <view class="cu-form-group">
				<view class="title">活动费用</view>
				<input class="inputClass" :disabled="ro.huodongfeiyong" v-model="ruleForm.huodongfeiyong"
					placeholder="活动费用"></input>
			</view>
			<view class="cu-form-group">
				<view class="title">费用说明</view>
				<input class="inputClass" :disabled="ro.feiyongshuoming" v-model="ruleForm.feiyongshuoming"
					placeholder="费用说明"></input>
			</view> -->
			<view class="cu-form-group">
				<view class="title">行程安排</view>
				<input class="inputClass" :disabled="ro.xingchenganpai" v-model="ruleForm.xingchenganpai"
					placeholder="行程安排"></input>
			</view>
			<view class="cu-form-group">
				<view class="title">装备要求</view>
				<input class="inputClass" :disabled="ro.zhuangbeiyaoqiu" v-model="ruleForm.zhuangbeiyaoqiu"
					placeholder="装备要求"></input>
			</view>
			<view class="cu-form-group select">
				<view class="title">发布日期</view>
				<picker mode="date" :value="ruleForm.faburiqi" @change="faburiqiChange">
					<view class="uni-input">{{ruleForm.faburiqi?ruleForm.faburiqi:"请选择发布日期"}}</view>
				</picker>
			</view>

			<!-- 否 -->

			<view class="cu-form-group">
				<view class="title">攻略信息</view>
				<textarea v-model="ruleForm.gonglvexinxi" placeholder="攻略信息"></textarea>
			</view>

			<view style="height: auto;" class="cu-form-group">
				<view class="richtext">
					<!-- <mp-html :content="ruleForm.neirong" /> -->
					<piaoyiEditor :values="ruleForm.huodongxiangqing" :maxlength="3000" @changes="saveContens"
						:readOnly="readOnly" :photoUrl="photoUrl" :api="api" :name="name" />
				</view>
			</view>

			<view class="btn">
				<button @tap="onSubmitTap" class="buttonClass">提交</button>
			</view>
		</form>

		<w-picker mode="dateTime" step="1" :current="false" :hasSecond="false" @confirm="huodongshijianConfirm"
			ref="huodongshijian" themeColor="#333333"></w-picker>
		<w-picker mode="dateTime" step="1" :current="false" :hasSecond="false" @confirm="clicktimeConfirm"
			ref="clicktime" themeColor="#333333"></w-picker>

	</view>
</template>

<script>
	import wPicker from "@/components/w-picker/w-picker.vue";
	import piaoyiEditor from '@/uni_modules/piaoyi-editor/components/piaoyi-editor/piaoyi-editor.vue';
	const chooseLocation = requirePlugin('chooseLocation');

	export default {
		data() {
			return {
				// 经度
				latitude: '',
				// 纬度
				longitude: '',
				readOnly: false, //是否只读
				photoUrl: 'http://localhost:8088/tangfen/', //服务器图片域名或者ip
				api: 'file/upload', //上传图片接口地址
				txt: '',
				name: 'file/upload',
				//
				cross: '',
				marker: {
					// 经度
					latitude: '',
					// 纬度
					longitude: '',
					imageUrl: '',
					title: '',
					addtime: '',
					activity_id: '',
				},
				ruleForm: {
					huodongdiqu: '',
					huodongmingcheng: '',
					huodongleixing: '',
					huodongtupian: '',
					huodongdidian: '',
					huodongshijian: '',
					huodongfeiyong: '',
					feiyongshuoming: '',
					gonglvexinxi: '',
					huodongxiangqing: '',
					xingchenganpai: '',
					zhuangbeiyaoqiu: '',
					faburiqi: '',
				},
				huodongdiquOptions: [],
				huodongdiquIndex: 0,
				huodongleixingOptions: [],
				huodongleixingIndex: 0,
				// 登陆用户信息
				user: {},
				ro: {
					huodongdiqu: false,
					huodongmingcheng: false,
					huodongleixing: false,
					huodongtupian: false,
					huodongdidian: false,
					huodongshijian: false,
					huodongfeiyong: false,
					feiyongshuoming: false,
					gonglvexinxi: false,
					huodongxiangqing: false,
					xingchenganpai: false,
					zhuangbeiyaoqiu: false,
					faburiqi: false,
					clicktime: false,
				},
			}
		},
		components: {
			wPicker,
			piaoyiEditor
		},
		computed: {
			baseUrl() {
				return this.$base.url;
			},



		},
		async onLoad(options) {
			this.ruleForm.faburiqi = this.$utils.getCurDate();
			let table = uni.getStorageSync("nowTable");
			// 获取用户信息
			let res = await this.$api.session(table);
			this.user = res.data;

			// ss读取


			// 下拉框
			res = await this.$api.option(`huodongdiqu`, `huodongdiqu`, {});
			this.huodongdiquOptions = res.data;
			// 下拉框
			res = await this.$api.option(`huodongleixing`, `huodongleixing`, {});
			this.huodongleixingOptions = res.data;

			// 如果有登陆，获取登陆后保存的userid
			this.ruleForm.userid = uni.getStorageSync("userid")
			if (options.refid) {
				// 如果上一级页面传递了refid，获取改refid数据信息
				this.ruleForm.refid = options.refid;
				this.ruleForm.nickname = uni.getStorageSync("nickname");
			}
			// 如果是更新操作
			if (options.id) {
				this.ruleForm.id = options.id;

				res = await this.$api.info(`huodongxinxi`, this.ruleForm.id);
				this.ruleForm = res.data;
				let res1 = await this.$api.markerinfo(this.ruleForm.id);
				this.marker = res1.data;
				console.log('11111111');
				console.log('marker5', this.marker);
				
				console.log('我是空的',this.marker.latitude,this.marker.longitude);
				console.log('11111111');
			}
			// 跨表
			this.cross = options.cross;
			if (options.cross) {
				var obj = uni.getStorageSync('crossObj');
				for (var o in obj) {
					if (o == 'huodongdiqu') {
						this.ruleForm.huodongdiqu = obj[o];
						this.ro.huodongdiqu = true;
						continue;
					}
					if (o == 'huodongmingcheng') {
						this.ruleForm.huodongmingcheng = obj[o];
						this.ro.huodongmingcheng = true;
						continue;
					}
					if (o == 'huodongleixing') {
						this.ruleForm.huodongleixing = obj[o];
						this.ro.huodongleixing = true;
						continue;
					}
					if (o == 'huodongtupian') {
						this.ruleForm.huodongtupian = obj[o];
						this.ro.huodongtupian = true;
						continue;
					}
					if (o == 'huodongdidian') {
						this.ruleForm.huodongdidian = obj[o];
						this.ro.huodongdidian = true;
						continue;
					}
					if (o == 'huodongshijian') {
						this.ruleForm.huodongshijian = obj[o];
						this.ro.huodongshijian = true;
						continue;
					}
					if (o == 'huodongfeiyong') {
						this.ruleForm.huodongfeiyong = obj[o];
						this.ro.huodongfeiyong = true;
						continue;
					}
					if (o == 'feiyongshuoming') {
						this.ruleForm.feiyongshuoming = obj[o];
						this.ro.feiyongshuoming = true;
						continue;
					}
					if (o == 'gonglvexinxi') {
						this.ruleForm.gonglvexinxi = obj[o];
						this.ro.gonglvexinxi = true;
						continue;
					}
					if (o == 'huodongxiangqing') {
						this.ruleForm.huodongxiangqing = obj[o];
						this.ro.huodongxiangqing = true;
						continue;
					}
					if (o == 'xingchenganpai') {
						this.ruleForm.xingchenganpai = obj[o];
						this.ro.xingchenganpai = true;
						continue;
					}
					if (o == 'zhuangbeiyaoqiu') {
						this.ruleForm.zhuangbeiyaoqiu = obj[o];
						this.ro.zhuangbeiyaoqiu = true;
						continue;
					}
					if (o == 'faburiqi') {
						this.ruleForm.faburiqi = obj[o];
						this.ro.faburiqi = true;
						continue;
					}
					if (o == 'clicktime') {
						this.ruleForm.clicktime = obj[o];
						this.ro.clicktime = true;
						continue;
					}
				}
			}
			this.styleChange()
		},
		created() {
			// 获取当前的位置信息
			uni.getLocation({
				type: 'wgs84',
				success: (res) => {
					console.log(res)
					this.latitude = res.latitude
					this.longitude = res.longitude
				}
			})
		},
		onShow() {
			const location = chooseLocation.getLocation();
			if (location) {
				console.log('选中的位置：', location);
				/* this.setData({
					selectedLocation: location
				}); */
				this.marker.title = location.name;
				this.ruleForm.huodongdidian = location.name;
				this.marker.latitude = location.latitude;
				this.marker.longitude = location.longitude;

				console.log('选中的位置名称：', location.name);
				console.log('选中的位置纬度：', location.latitude);
				console.log('选中的位置经度：', location.longitude);
				console.log(this.marker);
			}
		},
		methods: {

			goto() {
				let centerlat;
				let centerlog;
				const key = '3XWBZ-6KC67-ULWXK-HUTAN-W6SJK-JLBTW'; // 使用在腾讯位置服务申请的key
				const referer = 'map'; // 调用插件的app的名称

				if (this.marker.latitude && this.marker.longitude) {
					centerlat = this.marker.latitude,
					centerlog = this.marker.longitude
				} else {
					centerlat = this.latitude,
					centerlog = this.longitude
				}
				
				/* console.log(centerlat,centerlog);
				console.log('我是',this.marker.latitude,this.marker.longitude); */
				const location = JSON.stringify({
					
					latitude: centerlat,
					longitude: centerlog

				});
				const category = '旅游景点';

				wx.navigateTo({
					url: 'plugin://chooseLocation/index?key=' + key + '&referer=' + referer + '&location=' +
						location + '&category=' + category
				});
			},

			saveContens(e) {

				this.ruleForm.huodongxiangqing = e.html

			},
			styleChange() {
				this.$nextTick(() => {
					// document.querySelectorAll('.app-update-pv .cu-form-group .uni-input-input').forEach(el=>{
					//   el.style.backgroundColor = this.addUpdateForm.input.content.backgroundColor
					// })
				})
			},

			// 多级联动参数

			faburiqiChange(e) {
				this.ruleForm.faburiqi = e.target.value;
				this.$forceUpdate();
			},

			// 日长控件选择日期时间
			huodongshijianConfirm(val) {
				console.log(val)
				this.ruleForm.huodongshijian = val.result;
				this.$forceUpdate();
			},
			// 日长控件选择日期时间
			clicktimeConfirm(val) {
				console.log(val)
				this.ruleForm.clicktime = val.result;
				this.addtime = this.ruleForm.clicktime;
				this.$forceUpdate();
			},

			// 下拉变化
			huodongdiquChange(e) {
				this.huodongdiquIndex = e.target.value
				this.ruleForm.huodongdiqu = this.huodongdiquOptions[this.huodongdiquIndex]
			},
			// 下拉变化
			huodongleixingChange(e) {
				this.huodongleixingIndex = e.target.value
				this.ruleForm.huodongleixing = this.huodongleixingOptions[this.huodongleixingIndex]
			},

			huodongtupianTap() {
				let _this = this;
				this.$api.upload(function(res) {
					_this.ruleForm.huodongtupian = 'upload/' + res.file;

					_this.$forceUpdate();
					_this.$nextTick(() => {
						_this.styleChange()
					})
				});
			},

			getUUID() {
				return new Date().getTime();
			},
			async onSubmitTap() {

				//跨表计算判断
				var obj;
				if ((!this.ruleForm.huodongmingcheng)) {
					this.$utils.msg(`活动名称不能为空`);
					return
				}
				if ((!this.ruleForm.huodongleixing)) {
					this.$utils.msg(`活动类型不能为空`);
					return
				}

				//更新跨表属性
				var crossuserid;
				var crossrefid;
				var crossoptnum;
				if (this.cross) {
					var statusColumnName = uni.getStorageSync('statusColumnName');
					var statusColumnValue = uni.getStorageSync('statusColumnValue');
					if (statusColumnName != '') {
						if (!obj) {
							obj = uni.getStorageSync('crossObj');
						}
						if (!statusColumnName.startsWith("[")) {
							for (var o in obj) {
								if (o == statusColumnName) {
									obj[o] = statusColumnValue;
								}

							}
							var table = uni.getStorageSync('crossTable');
							await this.$api.update(`${table}`, obj);
						} else {
							crossuserid = Number(uni.getStorageSync('userid'));
							crossrefid = obj['id'];
							crossoptnum = uni.getStorageSync('statusColumnName');
							crossoptnum = crossoptnum.replace(/\[/, "").replace(/\]/, "");
						}
					}
				}
				if (crossrefid && crossuserid) {
					this.ruleForm.crossuserid = crossuserid;
					this.ruleForm.crossrefid = crossrefid;
					let params = {
						page: 1,
						limit: 10,
						crossuserid: crossuserid,
						crossrefid: crossrefid,
					}
					let res = await this.$api.list(`huodongxinxi`, params);
					if (res.data.total >= crossoptnum) {
						this.$utils.msg(uni.getStorageSync('tips'));
						return false;
					} else {
						//跨表计算
						if (this.ruleForm.id) {
							await this.$api.update(`huodongxinxi`, this.ruleForm);
							this.marker.activity_id = this.ruleForm.id;
							// 将多张图片地址分割成数组
							const images = this.ruleForm.huodongtupian.split(',');
							// 取第一张图片作为 this.marker.imageUrl
							this.marker.imageUrl = images[0];

							this.marker.addtime = this.ruleForm.clicktime;
							this.marker.title = this.ruleForm.huodongdidian;
							await this.$api.update(`marker`, this.marker);

							console.log("marker1", this.marker);
							/* 	console.log(this.ruleForm.id); */
						} else {
							let response = await this.$api.add('huodongxinxi', this.ruleForm);
							this.marker.activity_id = response.id;
							// 将多张图片地址分割成数组
							const images = this.ruleForm.huodongtupian.split(',');
							// 取第一张图片作为 this.marker.imageUrl
							this.marker.imageUrl = images[0];
							this.marker.addtime = this.ruleForm.clicktime;
							this.marker.title = this.ruleForm.huodongdidian;
							await this.$api.add(`marker`, this.marker);
							console.log("marker2", this.marker);
						}
						this.$utils.msgBack('提交成功');
					}
				} else {
					//跨表计算
					if (this.ruleForm.id) {
						await this.$api.update(`huodongxinxi`, this.ruleForm);
						this.marker.activity_id = this.ruleForm.id;
						// 将多张图片地址分割成数组
						const images = this.ruleForm.huodongtupian.split(',');
						// 取第一张图片作为 this.marker.imageUrl
						this.marker.imageUrl = images[0];
						this.marker.addtime = this.ruleForm.clicktime;
						this.marker.title = this.ruleForm.huodongdidian;
						await this.$api.update(`marker`, this.marker);

						console.log("marker3", this.marker);

						//console.log( "marker",this.marker);
						//console.log(this.ruleForm.id);

					} else {
						let response = await this.$api.add('huodongxinxi', this.ruleForm);
						//console.log('response',response);
						this.marker.activity_id = response.id;
						// 将多张图片地址分割成数组
						const images = this.ruleForm.huodongtupian.split(',');
						// 取第一张图片作为 this.marker.imageUrl
						this.marker.imageUrl = images[0];
						this.marker.addtime = this.ruleForm.clicktime;
						this.marker.title = this.ruleForm.huodongdidian;
						await this.$api.add(`marker`, this.marker);
						console.log("marker4", this.marker);

					}
					this.$utils.msgBack('提交成功');
				}
			},
			optionsChange(e) {
				this.index = e.target.value
			},
			bindDateChange(e) {
				this.date = e.target.value
			},
			getDate(type) {
				const date = new Date();
				let year = date.getFullYear();
				let month = date.getMonth() + 1;
				let day = date.getDate();
				if (type === 'start') {
					year = year - 60;
				} else if (type === 'end') {
					year = year + 2;
				}
				month = month > 9 ? month : '0' + month;;
				day = day > 9 ? day : '0' + day;
				return `${year}-${month}-${day}`;
			},
			toggleTab(str) {
				this.$refs[str].show();
			}
		}
	}
</script>

<style lang="scss" scoped>
	@import url("../../assets/css/add-or-update.scss");

	.button1Class {
		height: 70rpx !important;
		width: 130rpx !important;
		margin-inline-start: 20px;
	}

	.input1Class {
		padding: 0 30rpx;
		box-shadow: 0 0 0px rgba(0, 0, 0, .6) inset;
		margin: 0;
		border-color: rgba(194, 228, 106, 1);
		background-color: rgba(255, 255, 255, 0);
		color: rgba(0, 0, 0, 1);
		text-align: left;
		border-radius: 16rpx;
		border-width: 2rpx;
		width: 250px;
		font-size: 28rpx;
		border-style: dashed;
		height: 60rpx;
	}
</style>