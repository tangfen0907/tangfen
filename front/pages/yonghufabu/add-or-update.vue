<template>
	<view class="content">
		<form class="app-update-pv">

			<view class=" cu-form-group">
				<view class="title ">标题</view>
				<input class="inputClass" :disabled="ro.biaoti" v-model="ruleForm.biaoti" placeholder="标题"></input>
			</view>
			<view class="cu-form-group select">
				<view class="title">类型</view>
				<picker @change="leixingChange" :value="leixingIndex" :range="leixingOptions">
					<view class="uni-input">{{ruleForm.leixing?ruleForm.leixing:"请选择类型"}}</view>
				</picker>
			</view>
			<view class="cu-form-group" @tap="tupianTap">
				<view class="title">图片</view>
				<view class="right-input" style="padding:0">
					<image class="avator" v-if="ruleForm.tupian" :src="baseUrl+ruleForm.tupian" mode="aspectFill">
					</image>
					<image class="avator" v-else src="../../static/gen/upload.png" mode="aspectFill"></image>
				</view>
			</view>
			<view class="cu-form-group select">
				<view class="title">日期</view>
				<picker mode="date" :value="ruleForm.riqi" @change="riqiChange">
					<view class="uni-input">{{ruleForm.riqi?ruleForm.riqi:"请选择日期"}}</view>
				</picker>
			</view>
			<view class=" cu-form-group">
				<view class="title">用户名</view>
				<input class="inputClass" :disabled="ro.yonghuming" v-model="ruleForm.yonghuming"
					placeholder="用户名"></input>
			</view>


			<view style="height: auto;" class="cu-form-group">
				<view class="richtext">
					<!-- <mp-html :content="ruleForm.neirong" /> -->
					<piaoyiEditor :values="ruleForm.neirong" :maxlength="3000" @changes="saveContens"
						:readOnly="readOnly" :photoUrl="photoUrl" :api="api" :name="name" />
				</view>
				
			</view>

			<view class="btn">
				<button @tap="onSubmitTap" class="buttonClass">提交</button>
			</view>
		</form>


	</view>
</template>

<script>
	import wPicker from "@/components/w-picker/w-picker.vue";
	import piaoyiEditor from '@/uni_modules/piaoyi-editor/components/piaoyi-editor/piaoyi-editor.vue';

	export default {
		data() {
			return {
				readOnly: false, //是否只读
				photoUrl: 'http://localhost:8088/tangfen/', //服务器图片域名或者ip
				api: 'file/upload', //上传图片接口地址
				txt: '',
				name: 'file/upload',
				//
				cross: '',
				ruleForm: {
					biaoti: '',
					leixing: '',
					tupian: '',
					neirong: '',
					riqi: '',
					yonghuming: '',
				},
				leixingOptions: [],
				leixingIndex: 0,
				// 登陆用户信息
				user: {},
				ro: {
					biaoti: false,
					leixing: false,
					tupian: false,
					neirong: false,
					riqi: false,
					yonghuming: false,
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
			this.ruleForm.riqi = this.$utils.getCurDate();
			let table = uni.getStorageSync("nowTable");
			// 获取用户信息
			let res = await this.$api.session(table);
			this.user = res.data;

			// ss读取
			this.ruleForm.yonghuming = this.user.yonghuming
			this.ro.yonghuming = true;


			// 自定义下拉框值
			this.leixingOptions = "游记,攻略,其它".split(',')

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
				// 获取信息
				res = await this.$api.info(`yonghufabu`, this.ruleForm.id);
				this.ruleForm = res.data;
			}
			// 跨表
			this.cross = options.cross;
			if (options.cross) {
				var obj = uni.getStorageSync('crossObj');
				for (var o in obj) {
					if (o == 'biaoti') {
						this.ruleForm.biaoti = obj[o];
						this.ro.biaoti = true;
						continue;
					}
					if (o == 'leixing') {
						this.ruleForm.leixing = obj[o];
						this.ro.leixing = true;
						continue;
					}
					if (o == 'tupian') {
						this.ruleForm.tupian = obj[o];
						this.ro.tupian = true;
						continue;
					}
					if (o == 'neirong') {
						this.ruleForm.neirong = obj[o];
						this.ro.neirong = true;
						continue;
					}
					if (o == 'riqi') {
						this.ruleForm.riqi = obj[o];
						this.ro.riqi = true;
						continue;
					}
					if (o == 'yonghuming') {
						this.ruleForm.yonghuming = obj[o];
						this.ro.yonghuming = true;
						continue;
					}
				}
			}
			this.styleChange()
		},
		methods: {
			saveContens(e) {

				this.ruleForm.neirong = e.html

			},
			styleChange() {
				this.$nextTick(() => {
					// document.querySelectorAll('.app-update-pv .cu-form-group .uni-input-input').forEach(el=>{
					//   el.style.backgroundColor = this.addUpdateForm.input.content.backgroundColor
					// })
				})
			},

			// 多级联动参数

			riqiChange(e) {
				this.ruleForm.riqi = e.target.value;
				this.$forceUpdate();
			},


			// 下拉变化
			leixingChange(e) {
				this.leixingIndex = e.target.value
				this.ruleForm.leixing = this.leixingOptions[this.leixingIndex]
			},

			tupianTap() {
				let _this = this;
				this.$api.upload(function(res) {
					_this.ruleForm.tupian = 'upload/' + res.file;
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
				/* console.log(this.ruleForm,'11112222') */
				//跨表计算判断
				var obj;
				if ((!this.ruleForm.biaoti)) {
					this.$utils.msg(`标题不能为空`);
					return
				}
				if ((!this.ruleForm.leixing)) {
					this.$utils.msg(`类型不能为空`);
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
					let res = await this.$api.list(`yonghufabu`, params);
					if (res.data.total >= crossoptnum) {
						this.$utils.msg(uni.getStorageSync('tips'));
						return false;
					} else {
						//跨表计算
						if (this.ruleForm.id) {
							await this.$api.update(`yonghufabu`, this.ruleForm);
						} else {
							await this.$api.add(`yonghufabu`, this.ruleForm);
						}
						this.$utils.msgBack('提交成功');
					}
				} else {
					//跨表计算
					if (this.ruleForm.id) {
						await this.$api.update(`yonghufabu`, this.ruleForm);
					} else {
						await this.$api.add(`yonghufabu`, this.ruleForm);
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
</style>