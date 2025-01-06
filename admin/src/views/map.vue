<template>
  <div id="app">
    <el-button @click="openMapPickPop">选点</el-button>
    <div>
      <b>经度：</b>
      <b>{{ currentPicked.latlng.lat }}</b>
    </div>
    <div>
      <b>纬度：</b>
      <b>{{ currentPicked.latlng.lng }}</b>
    </div>
    <div>
      <b>位置信息：</b>
      <b>{{ currentPicked.poiaddress }}{{ currentPicked.poiname }}</b>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      currentPicked: {
        latlng: {},
      },
      mapApiKey: "NRKBZ-VDZ6I-NA6GM-UQ55F-LCIUS-JPFQZ",
      IFRAME_HTML: `<iframe id="mapPage" width="800" height="600" frameborder="0"
              src="https://apis.map.qq.com/tools/locpicker?search=1&type=1&key=UU2BZ-B6RKG-QCTQW-IA6XO-5NHSH-Q6BYM&referer=myapp"></iframe>`,
    };
  },
  methods: {
    openMapPickPop(event) {
      if (event.relatedTarget) return;
      this.$msgbox({
        title: "选择地址",
        message: this.IFRAME_HTML,
        customClass: "location-picker-box",
        dangerouslyUseHTMLString: true,
        closeOnPressEscape: false,
        showClose: true,
        closeOnClickModal: false,
      })
          .then(() => {
            window.removeEventListener("message", this.handleMapPickedMessage, false);
            console.log("选择了地图", this.currentPicked);
          })
          .catch((e) => {
            if (e != "cancel") throw e;
            window.removeEventListener("message", this.handleMapPickedMessage, false);
          });

      window.addEventListener("message", this.handleMapPickedMessage, false);
    },
    handleMapPickedMessage(event) {
      /**
       * 接收位置信息，用户选择确认位置点后选点组件会触发该事件，回传用户的位置信息
       */
      let loc = event.data;
      // 防止其他应用也会向该页面post信息，需判断module是否为'locationPicker'
      if (loc && loc.module != "locationPicker") return;
      this.$set(this.currentPicked, 'latlng', loc.latlng || {});
      this.$set(this.currentPicked, 'poiaddress', loc.poiaddress || '');
      this.$set(this.currentPicked, 'poiname', loc.poiname || '');
    },
  },
};
</script>

<style>
html .location-picker-box {
  width: 820px;
  max-width: none;
  padding: 0;
}
.el-message-box__wrapper .el-message-box {
  padding: 0;
  width: 820px;
  max-width: none;
}
.el-message-box__content {
  padding: 0;
}
</style>


