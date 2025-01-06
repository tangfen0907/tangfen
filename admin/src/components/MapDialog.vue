<template>
  <div>
    <!-- 按钮打开对话框 -->
    <el-button type="primary" @click="openDialog">选择地点</el-button>

    <!-- 包含百度地图和搜索输入框的对话框 -->
    <el-dialog :visible.sync="dialogVisible" title="选择地点" width="80%">
      <div class="search-container">
        <el-input v-model="searchQuery" placeholder="搜索地点" @keyup.enter="searchLocation"></el-input>
        <el-button type="primary" @click="searchLocation">搜索</el-button>
      </div>
      <baidu-map class="map-container" :center="center" :zoom="zoom" @click="handleMapClick">
        <bm-marker :position="markerPosition"></bm-marker>
      </baidu-map>
      <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">取消</el-button>
        <el-button type="primary" @click="confirmSelection">确定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
export default {
  data() {
    return {
      dialogVisible: false, // 对话框的可见性
      center: { lng: 116.404, lat: 39.915 }, // 地图中心点
      zoom: 15, // 地图缩放级别
      markerPosition: { lng: 116.404, lat: 39.915 }, // 标记位置
      selectedPlace: null, // 选定地点名称
      searchQuery: '', // 搜索查询
    };
  },
  methods: {
    // 打开对话框
    openDialog() {
      this.dialogVisible = true;
    },
    // 地图点击事件处理，设置标记位置并获取地点名称
    handleMapClick(e) {
      this.markerPosition = {
        lng: e.point.lng,
        lat: e.point.lat
      };
      this.getPlaceName(e.point); // 获取点击位置的名称
    },
    // 使用百度地理编码服务获取地点名称
    getPlaceName(point) {
      const geoc = new BMap.Geocoder();
      geoc.getLocation(point, (result) => {
        if (result) {
          this.selectedPlace = result.address; // 设置选定地点名称
        }
      });
    },
    // 搜索地点
    searchLocation() {
      const local = new BMap.LocalSearch(this.$refs.map, {
        onSearchComplete: (results) => {
          if (local.getStatus() === BMAP_STATUS_SUCCESS) {
            const firstResult = results.getPoi(0);
            if (firstResult) {
              this.center = firstResult.point;
              this.markerPosition = firstResult.point;
              this.getPlaceName(firstResult.point);
            }
          }
        }
      });
      local.search(this.searchQuery);
    },
// 确认选择，将数据传递给父组件
    confirmSelection() {
      const selectedData = {
        name: this.selectedPlace,
        lng: this.markerPosition.lng,
        lat: this.markerPosition.lat
      };
      this.$emit('selectLocation', selectedData); // 通过事件将数据传递给父组件
      this.dialogVisible = false; // 关闭对话框
    }
  }
};
</script>

<style>
/* 地图容器样式 */
.map-container {
  width: 100%;
  height: 400px;
}

/* 搜索容器样式 */
.search-container {
  display: flex;
  margin-bottom: 10px;
}

.search-container .el-input {
  flex: 1;
}
</style>
