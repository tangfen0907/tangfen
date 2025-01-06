<template>
	<view>

		<view class="uni-container">


			<view class="uni-table" >
				<view v-if="tableData.length === 0" class="no-data-message">
					<text>没有报名者</text>
				</view>
				<view v-else  style="min-width: 100%;">
					<uni-table ref="table" :loading="loading" border stripe type="selection" emptyText="暂无更多数据"
						@selection-change="selectionChange" style="min-width: 100%;">
						<uni-tr>
							<uni-th align="center">报名者</uni-th>
							<uni-th align="center">活动名称</uni-th>
							<uni-th align="center">状态</uni-th>

						</uni-tr>
						<uni-tr v-for="(item, index) in tableData" :key="index">

							<uni-td align="center">
								{{ item.username }}
							</uni-td>
							<uni-td align="center">{{ item.activityname }}</uni-td>
							<uni-td align="center">{{ item.status }}
							</uni-td>

						</uni-tr>
					</uni-table>
				</view>
			</view>


		</view>
		<uni-fab ref="fab" :pattern="pattern" :content="content" :horizontal="horizontal" :vertical="vertical"
			:direction="direction" @trigger="trigger" />
	</view>
</template>

<script>
	
	export default {
		data() {
			return {
				searchVal: '',
				tableData: [],
				// 每页数据量
				pageSize: 10,
				// 当前页
				pageCurrent: 1,
				// 数据总量
				total: 0,
				loading: false,
				status: ['审核中', '不通过', '通过'],
				horizontal: 'left',
				vertical: 'bottom',
				direction: 'horizontal',
				pattern: {
					color: '#7A7E83',
					backgroundColor: '#fff',
					selectedColor: '#007AFF',
					buttonColor: '#007AFF',
					iconColor: '#fff'
				},
				content: [{
						iconPath: '@/static/biaomingshenghe/通过.png',
						selectedIconPath: '@/static/biaomingshenghe/通过.png',
						text: '审核中',
						active: false
					},
					{

						text: '不通过',
						active: false
					},
					{

						text: '通过',
						active: false
					},
					{

						text: '删除',
						active: false
					}
				]
			}
		},
		onLoad() {
			this.selectedIndexs = []
			this.getData(1)
		},
		onBackPress() {
			if (this.$refs.fab.isShow) {
				this.$refs.fab.close()
				return true
			}
			return false
		},
		methods: {
			trigger(e) {
				if (e.item.text === '审核中') {
					this.approvePending();
				} else if (e.item.text === '不通过') {
					this.approveRejected();
				} else if (e.item.text === '通过') {
					this.approveApproved();
				} else if (e.item.text === '删除') {
					this.delTable();
				}
			},


			batchApprove(status) {
				const selectedItems = this.selectedItems();
				if (selectedItems.length === 0) {
					this.$utils.msg('请选择要审核的项。');
					return;
				}

				// 更新选中项的状态
				selectedItems.forEach(item => {
					item.status = status;
					//console.log(item);
					 this.$api.update('baomingxinxi', item);
				});

				this.$utils.msg('批量审核成功。');
			},

			// 处理“审核中”按钮的点击事件
			approvePending() {
				this.batchApprove('审核中');
			},

			// 处理“不通过”按钮的点击事件
			approveRejected() {
				this.batchApprove('不通过');
			},

			// 处理“通过”按钮的点击事件
			approveApproved() {
				this.batchApprove('通过');
			},
			// 多选处理
			selectedItems() {
				return this.selectedIndexs.map(i => this.tableData[i])
			},
			// 多选
			selectionChange(e) {
				console.log(e.detail.index)
				this.selectedIndexs = e.detail.index
			},
			//批量删除
			delTable() {
				console.log(this.selectedItems())
			},
			// 分页触发
			change(e) {
				this.$refs.table.clearSelection()
				this.selectedIndexs.length = 0
				this.getData(e.current)
			},
			// 搜索
			search() {
				this.getData(1, this.searchVal)
			},
			async getData(pageCurrent, value = '') {
				this.userid = uni.getStorageSync("userid");
				const userid = parseInt(this.userid);

				this.loading = true; // 设置加载状态为 true，表示正在加载数据
				this.pageCurrent = pageCurrent;
				let params = {
					page: pageCurrent,
					limit: this.pageSize,
					sponsor: userid
				};
				try {
					let res = await this.$api.list(`baomingxinxi`, params);
					this.tableData = res.data.list;
					this.total = res.total;
					 console.log('Total:', this.total); // 更新数据的总数
					this.loading = false; // 加载完成，设置加载状态为 false
				} catch (error) {
					console.error('Error while fetching data:', error);
					this.loading = false; // 加载出错，设置加载状态为 false
				}
			},
			onDeleteTap(id) {
				let _this = this;
				uni.showModal({
					title: '提示',
					content: '是否确认删除',
					success: async function(res) {
						if (res.confirm) {
							await _this.$api.del('baomingxinxi', JSON.stringify([id]));
							_this.$utils.msg('删除成功');
							_this.hasNext = true
							// 重新加载数据
							if (_this.mescroll) _this.mescroll.resetUpScroll()
						}
					}
				});
			},
			delTable() {
				const selectedItems = this.selectedItems();
				if (selectedItems.length === 0) {
					this.$utils.msg('请选择要删除的项。');
					return;
				}
				// 获取选中项的ID列表
				const ids = selectedItems.map(item => item.id);

				uni.showModal({
					title: '提示',
					content: '是否确认删除选中项？',
					success: async (res) => {
						if (res.confirm) {
							try {
								await this.$api.del('baomingxinxi', JSON.stringify(ids));
								this.$utils.msg('批量删除成功。');
								// 重新加载数据
								this.getData(this.pageCurrent);
							} catch (error) {
								console.error('批量删除失败:', error);
								this.$utils.msg('批量删除失败，请重试。');
							}
						}
					}
				});
			},
		}
	}
</script>

<style>
	/* #ifndef H5 */
	/* page {
	padding-top: 85px;
} */
	/* #endif */
	.uni-group {
		display: flex;
		align-items: center;
	}

	.popup-content {
		padding: 20rpx;
	}

	.confirm-button {
		width: 100%;
		background-color: #007AFF;
		color: #fff;
		border: none;
		border-radius: 5rpx;
		padding: 10rpx 0;
		margin-top: 20rpx;
		cursor: pointer;
	}

	.no-data-message {
		text-align: center;
		margin-top: 20px;
		font-size: 18px;
		color: #999;
	}
</style>