<template>
	<view class="content my-publish-pv">
		<form>
			<view class="cu-form-group ">
				<input class="inputClass" v-model="forum.title" placeholder="标题"></input>
			</view>
			<view class="cu-form-group ">
				
				<picker @change="setIsDoneTap" :value="index" :range="options">
					<view class="uni-input">{{options[index]}}</view>
				</picker>
			</view>
			<view style="height: auto;" class="cu-form-group ">
				<view class="richtext">
					
					<piaoyiEditor :values="forum.content" :maxlength="3000" @changes="saveContens"
						:readOnly="readOnly" :photoUrl="photoUrl" :api="api" :name="name" />
				</view>
			
			</view>
			<view >
				<button @tap="onSubmitTap" class="buttonClass  margin-tb-sm">确认提交</button>
			</view>
		</form>
	</view>
</template>

<script>
	import piaoyiEditor from '@/uni_modules/piaoyi-editor/components/piaoyi-editor/piaoyi-editor.vue';
	
	export default {
		data() {
			return {
				readOnly: false, //是否只读
				photoUrl: 'http://localhost:8088/tangfen/', //服务器图片域名或者ip
				api: 'file/upload', //上传图片接口地址
				txt: '',
				name: 'file/upload',
				forum: {
					content: '',
					id: '',
					title: '',
					isdone: '开放',
					parentid: 0
				},
				index: 0,
				options: ['开放', '关闭'],
				username: '',
				user: {}
			}
		},
		async onLoad(options) {
			let table = uni.getStorageSync("nowTable");
			// 获取用户信息
			let res = await this.$api.session(table);
			this.user = res.data;
			if (table == `yonghu`) {
				this.username = this.user.yonghuming
			}
			if (options.id) {
				this.id = options.id;
				let res = await this.$api.info('forum', this.id);
				this.forum = res.data
			}
			this.styleChange()
		},
		components: {
			piaoyiEditor
		},
		computed: {
			baseUrl() {
				return this.$base.url;
			},
		
		},
		methods: {
			saveContens(e) {
			
				this.forum.content = e.html
			
			},
			styleChange() {
				this.$nextTick(() => {
					// document.querySelectorAll('.my-publish-pv .uni-input-input').forEach(el=>{
					//   el.style.backgroundColor = this.myPublishForm.content.input.backgroundColor
					// })
				})
			},
			async onSubmitTap() {
				this.forum.username = this.username;
				if (this.id) {
					await this.$api.update('forum', this.forum);
				} else {
					await this.$api.save('forum', this.forum);
				}
				this.$utils.msgBack('操作成功');
			},
			setIsDoneTap(e) {
				// this.forum.isdone = e;
				this.index = e.target.value
				this.forum.isdone = this.options[this.index]
			},
		}
	}
</script>


<style lang="scss" scoped>
	@import url("../../assets/css/add-or-update.scss");
</style>