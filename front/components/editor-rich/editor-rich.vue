<template>
	<view class="container-editor">
		<view class="textarea">
			<view class="page-body">
				<view class='wrapper'>
					<PickerColor v-if="show" @closePicker="closePicker" @onPickColor="onPickColor" color="#FF0000" @onColorChange="onColorChange"/>
					<view class='toolbar' @tap="format">
						<view :class="formats.fontSize === '24px' ? 'ql-active' : ''"
							class="iconfont icon-font-size" data-name="fontSize" data-value="24px"></view>
							<view :class="formats.color? 'ql-active' : ''"
								 class="iconfont icon-fontbgcolor"
								 @tap="showPicker"
								 data-name="color" :data-value="formats.color">
							</view>
						<view :class="formats.backgroundColor === '#00ff00' ? 'ql-active' : ''"
							class="iconfont icon-717bianjiqi_zitibeijingyanse" data-name="backgroundColor"
							data-value="#00ff00"></view>
						<view :class="formats.header === 1 ? 'ql-active' : ''"
							class="iconfont icon-formatheader1" data-name="header" :data-value="1"></view>
						<view :class="formats.header === 2 ? 'ql-active' : ''"
							class="iconfont icon-formatheader2" data-name="header" :data-value="2"></view>
						<view :class="formats.bold ? 'ql-active' : ''" class="iconfont icon-zitijiacu"
							data-name="bold"></view>
						<view :class="formats.italic ? 'ql-active' : ''" class="iconfont icon-zitixieti"
							data-name="italic"></view>
						<view :class="formats.underline ? 'ql-active' : ''" class="iconfont icon-zitixiahuaxian"
							data-name="underline"></view>
						<view :class="formats.strike ? 'ql-active' : ''" class="iconfont icon-shanchuxian"
							data-name="strike"></view>
						<view :class="formats.align === 'left' ? 'ql-active' : ''"
							class="iconfont icon-zuoduiqi" data-name="align" data-value="left"></view>
						<view :class="formats.align === 'center' ? 'ql-active' : ''"
							class="iconfont icon-juzhongduiqi" data-name="align" data-value="center"></view>
						<view :class="formats.align === 'right' ? 'ql-active' : ''"
							class="iconfont icon-youduiqi" data-name="align" data-value="right"></view>
						<view :class="formats.align === 'justify' ? 'ql-active' : ''"
							class="iconfont icon-zuoyouduiqi" data-name="align" data-value="justify"></view>
						<view :class="formats.lineHeight ? 'ql-active' : ''" class="iconfont icon-LineHeight"
							data-name="lineHeight" data-value="2"></view>
						<view :class="formats.letterSpacing ? 'ql-active' : ''"
							class="iconfont icon-Character-Spacing" data-name="letterSpacing" data-value="2em">
						</view>
						<view :class="formats.marginTop ? 'ql-active' : ''" class="iconfont icon-duanqianju"
							data-name="marginTop" data-value="10px"></view>
						<view :class="formats.previewarginBottom ? 'ql-active' : ''"
							class="iconfont icon-duanhouju" data-name="marginBottom" data-value="10px"></view>
						<!-- <view class="iconfont icon-rili4" @tap="insertDate"></view> -->
						<view class="iconfont icon-checklist" data-name="list" data-value="check"></view>
						<view :class="formats.list === 'ordered' ? 'ql-active' : ''"
							class="iconfont icon-youxupailie" data-name="list" data-value="ordered"></view>
						<view :class="formats.list === 'bullet' ? 'ql-active' : ''"
							class="iconfont icon-wuxupailie" data-name="list" data-value="bullet"></view>
						<view class="iconfont icon-outdent" data-name="indent" data-value="-1"></view>
						<view class="iconfont icon-indent" data-name="indent" data-value="+1"></view>
						<view class="iconfont icon-fengexian" @tap="insertDivider"></view>
						<view class="iconfont icon-charutupian" @tap="insertImage"></view>
						<view class="iconfont icon-undo" @tap="undo"></view>
						<view class="iconfont icon-redo" @tap="redo"></view>
						<view class="iconfont icon-format" @tap="clear"></view>
					</view>
					<editor :id="id" class="ql-container" placeholder="开始输入..." showImgSize showImgToolbar
						showImgResize @statuschange="onStatusChange" :read-only="readOnly"
						@ready="onEditorReady" @input="saveContens">
					</editor>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	const api = require('@/utils/api.js');
	const util = require("@/utils/util.js");
	import PickerColor from "../color-picker/color-picker.vue"
	export default {
		components:{
			PickerColor
		},
		props: {
			id: {//当前菜单标题
				type: String,
				default: ''
			},
			values: {
				type: String,
				default: ''
			},
			readOnly: {
				type: Boolean,
				default: false
			},
			maxlength: {
				type: String,
				default: 300
			}
		},
		data() {
			return {
				currentTab: 0,
				curColor:'#000000',
				show:false,
				hdid: "",
				myHtml: "",
				formats: {},
				photoUrl: util.commonUrl() + api.linkloadUrl
			}
		},
		methods: {
			showPicker() {
				this.show = true;
			},
			closePicker(e) {
				this.show = false;
			},
			onPickColor(e) {
				this.formats.color = e.hex;
			},
			onColorChange(e) {
				this.editorCtx.format('color', e)
			},
			saveContens() {
				let that = this;
				let maxlength = parseInt(that.maxlength);
				that.editorCtx.getContents({
					success: function(res) {
						let html_text = util.formatrichtext(res.html);
						let html_length = html_text.length;
						
						if(html_length > maxlength) {
							uni.showModal(
								{
									title:'最多只能输入' + maxlength + '字',
									confirmText:'确定',
									showCancel:false,
									success(res) {
										that.$emit("changes",{html:res.html,length:html_length});
									}
								}
							);
						} else {
							that.$emit("changes",{html:res.html,length:html_length});
						}
					},
				})
			},
			update() {
				//获取一下是否有数据
				let that = this;
				setTimeout(()=> {
					that.editorCtx.setContents({
						"html": that.values
					});
				},1000)
			},
			onEditorReady() {
				let that = this;
				uni.createSelectorQuery().select('#'+that.id).context((res) => {
					that.editorCtx = res.context;
					that.update();
				}).exec();
			},
			undo() {
				this.editorCtx.undo()
			},
			redo() {
				this.editorCtx.redo()
			},
			format(e) {
				let {
					name,
					value
				} = e.target.dataset
				if (!name) return
				this.editorCtx.format(name, value)
			},
			onStatusChange(e) {
				const formats = e.detail
				this.formats = formats
			},
			insertDivider() {
				this.editorCtx.insertDivider();
			},
			clear() {
				this.editorCtx.clear();
			},
			insertDate() {
				const date = new Date()
				const formatDate = `${date.getFullYear()}/${date.getMonth() + 1}/${date.getDate()}`
				this.editorCtx.insertText({
					text: formatDate
				})
			},
			insertImage() {
				let that = this;
				uni.chooseImage({
					count: 1,
					success: (res) => {
						//上传文件的临时路径
						const tempFilePaths = res.tempFilePaths;
						util.uploadFile(api.uploadUrl, tempFilePaths[0]).then(uploadFileRes => {
								const back = uploadFileRes.datas;
								if (uploadFileRes.status == 200) {
									let url = that.photoUrl + back.moduleName + '/' + back.fileNewName;
									that.editorCtx.insertImage({
										src: url,
										alt: '图像',
										success: function() {}
									})
								} else {
									that.showToast(uploadFileRes.message)
								}
						})
					}
				})
			}
		}
	}
</script>

<style>
	.tabs {
		display: flex;
		justify-content: space-around;
		background-color: #FFFFFF;
	}

	.tabs .current {
		border-bottom: 2px solid #0369D6;
	}
	.tabs .tab {
		font-size: 32rpx;
	}

	.main {
		padding: 20rpx;
		background-color: #FFFFFF;
	}

	.main .item {
		display: flex;
		justify-content: space-between;
		line-height: 80rpx;
		border-bottom: 1px solid #F2F2F2;
	}

	.main .item .left {
		min-width: 200rpx;
	}

	.main .title {
		padding-bottom: 20rpx;
		font-weight: bold;
		border-bottom: 1px solid #F2F2F2;
	}

	.main .textarea {
		border: 1px solid #F2F2F2;
	}

	.wrapper {
		padding: 0 10rpx;
	}

	.iconfont {
		display: inline-block;
		padding: 16rpx 22rpx;
		padding-left: 0;
		cursor: pointer;
		font-size: 40rpx !important;
	}
	.icon-rili4 {
		font-size: 48rpx !important;
	}
	.icon-duanqianju, .icon-duanhouju,.icon-zitijiacu,.icon-zitixieti,.icon-zitixiahuaxian,.icon-shanchuxian {
		font-size: 36rpx!important;
	}
	.toolbar {
		box-sizing: border-box;
		border-bottom: 0;
		font-family: 'Helvetica Neue', 'Helvetica', 'Arial', sans-serif;
	}

	.ql-container {
		box-sizing: border-box;
		width: 100%;
		min-height: 300rpx;
		height: auto;
		background: #fff;
		font-size: 32rpx;
		line-height: 1.5;
		padding-bottom: 60rpx;
	}
	/deep/ .ql-editor.ql-blank:before {
		font-size: 28rpx;
		font-style: inherit;
	}
	.ql-active {
		color: #ff0000;
	}
	button {
		width:150rpx;
		font-size: 30rpx;
	}
</style>

