<template>
  <div class="addEdit-block">


    <el-form
        class="detail-form-content"
        ref="ruleForm"
        :model="ruleForm"
        :rules="rules"
        label-width="80px"
        :style="{backgroundColor:addEditForm.addEditBoxColor}"
    >
      <el-row>
        <el-col :span="12">
          <el-form-item class="select" v-if="type!='info'" label="活动地区" prop="huodongdiqu">
            <el-select :disabled="ro.huodongdiqu" v-model="ruleForm.huodongdiqu" placeholder="请选择活动地区">
              <el-option
                  v-for="(item,index) in huodongdiquOptions"
                  v-bind:key="index"
                  :label="item"
                  :value="item">
              </el-option>
            </el-select>
          </el-form-item>
          <div v-else>
            <el-form-item class="input" label="活动地区" prop="huodongdiqu">
              <el-input v-model="ruleForm.huodongdiqu"
                        placeholder="活动地区" readonly></el-input>
            </el-form-item>
          </div>
        </el-col>
        <el-col :span="12">
          <el-form-item class="input" v-if="type!='info'" label="活动名称" prop="huodongmingcheng">
            <el-input v-model="ruleForm.huodongmingcheng"
                      placeholder="活动名称" clearable :readonly="ro.huodongmingcheng"></el-input>
          </el-form-item>
          <div v-else>
            <el-form-item class="input" label="活动名称" prop="huodongmingcheng">
              <el-input v-model="ruleForm.huodongmingcheng"
                        placeholder="活动名称" readonly></el-input>
            </el-form-item>
          </div>
        </el-col>
        <el-col :span="12">
          <el-form-item class="select" v-if="type!='info'" label="活动类型" prop="huodongleixing">
            <el-select :disabled="ro.huodongleixing" v-model="ruleForm.huodongleixing" placeholder="请选择活动类型">
              <el-option
                  v-for="(item,index) in huodongleixingOptions"
                  v-bind:key="index"
                  :label="item"
                  :value="item">
              </el-option>
            </el-select>
          </el-form-item>
          <div v-else>
            <el-form-item class="input" label="活动类型" prop="huodongleixing">
              <el-input v-model="ruleForm.huodongleixing"
                        placeholder="活动类型" readonly></el-input>
            </el-form-item>
          </div>
        </el-col>
        <el-col :span="24">
          <el-form-item class="upload" v-if="type!='info' && !ro.huodongtupian" label="活动图片" prop="huodongtupian">
            <file-upload
                tip="点击上传活动图片"
                action="file/upload"
                :limit="3"
                :multiple="true"
                :fileUrls="ruleForm.huodongtupian?ruleForm.huodongtupian:''"
                @change="huodongtupianUploadChange"
            ></file-upload>
          </el-form-item>
          <div v-else>
            <el-form-item v-if="ruleForm.huodongtupian" label="活动图片" prop="huodongtupian">
              <img style="margin-right:20px;" v-bind:key="index"
                   v-for="(item,index) in ruleForm.huodongtupian.split(',')" :src="$base.url+item" width="100"
                   height="100">
            </el-form-item>
          </div>
        </el-col>
        <el-col :span="12">
          <el-form-item class="input" v-if="type!='info'" label="活动地点" prop="huodongdidian">
            <el-input v-model="ruleForm.huodongdidian"
                      placeholder="活动地点" clearable :readonly="ro.huodongdidian"></el-input>
            <el-button @click="openMapPickPop">选点</el-button>
          </el-form-item>
          <div v-else>
            <el-form-item class="input" label="活动地点" prop="huodongdidian">
              <el-input v-model="ruleForm.huodongdidian"
                        placeholder="活动地点" readonly></el-input>
            </el-form-item>
          </div>
        </el-col>
        <el-col :span="12">
          <el-form-item class="date" v-if="type!='info'" label="活动时间" prop="huodongshijian">
            <el-date-picker
                value-format="yyyy-MM-dd HH:mm:ss"
                v-model="ruleForm.huodongshijian"
                type="datetime"
                :readonly="ro.huodongshijian"
                placeholder="活动时间">
            </el-date-picker>
          </el-form-item>
          <div v-else>
            <el-form-item class="input" v-if="ruleForm.huodongshijian" label="活动时间" prop="huodongshijian">
              <el-input v-model="ruleForm.huodongshijian"
                        placeholder="活动时间" readonly></el-input>
            </el-form-item>
          </div>
        </el-col>

        <el-col :span="12">
          <el-form-item class="input" v-if="type!='info'" label="行程安排" prop="xingchenganpai">
            <el-input v-model="ruleForm.xingchenganpai"
                      placeholder="行程安排" clearable :readonly="ro.xingchenganpai"></el-input>
          </el-form-item>
          <div v-else>
            <el-form-item class="input" label="行程安排" prop="xingchenganpai">
              <el-input v-model="ruleForm.xingchenganpai"
                        placeholder="行程安排" readonly></el-input>
            </el-form-item>
          </div>
        </el-col>
        <el-col :span="12">
          <el-form-item class="input" v-if="type!='info'" label="装备要求" prop="zhuangbeiyaoqiu">
            <el-input v-model="ruleForm.zhuangbeiyaoqiu"
                      placeholder="装备要求" clearable :readonly="ro.zhuangbeiyaoqiu"></el-input>
          </el-form-item>
          <div v-else>
            <el-form-item class="input" label="装备要求" prop="zhuangbeiyaoqiu">
              <el-input v-model="ruleForm.zhuangbeiyaoqiu"
                        placeholder="装备要求" readonly></el-input>
            </el-form-item>
          </div>
        </el-col>
        <el-col :span="12">
          <el-form-item class="date" v-if="type!='info'" label="发布日期" prop="faburiqi">
            <el-date-picker
                format="yyyy 年 MM 月 dd 日"
                value-format="yyyy-MM-dd"
                v-model="ruleForm.faburiqi"
                type="date"
                :readonly="ro.faburiqi"
                placeholder="发布日期">
            </el-date-picker>
          </el-form-item>
          <div v-else>
            <el-form-item class="input" v-if="ruleForm.faburiqi" label="发布日期" prop="faburiqi">
              <el-input v-model="ruleForm.faburiqi"
                        placeholder="发布日期" readonly></el-input>
            </el-form-item>
          </div>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="24">
          <el-form-item class="textarea" v-if="type!='info'" label="攻略信息" prop="gonglvexinxi">
            <el-input
                style="min-width: 200px; max-width: 600px;"
                type="textarea"
                :rows="8"
                placeholder="攻略信息"
                v-model="ruleForm.gonglvexinxi">
            </el-input>
          </el-form-item>
          <div v-else>
            <el-form-item v-if="ruleForm.gonglvexinxi" label="攻略信息" prop="gonglvexinxi">
              <span>{{ ruleForm.gonglvexinxi }}</span>
            </el-form-item>
          </div>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="24">
          <el-form-item v-if="type!='info'" label="活动详情" prop="huodongxiangqing">
            <editor
                style="min-width: 200px; max-width: 600px;"
                v-model="ruleForm.huodongxiangqing"
                class="editor"
                action="file/upload">
            </editor>
          </el-form-item>
          <div v-else>
            <el-form-item v-if="ruleForm.huodongxiangqing" label="活动详情" prop="huodongxiangqing">
              <span v-html="ruleForm.huodongxiangqing"></span>
            </el-form-item>
          </div>
        </el-col>
      </el-row>
      <el-form-item class="btn">
        <el-button v-if="type!='info'" type="primary" class="btn-success" @click="onSubmit">提交</el-button>
        <el-button v-if="type!='info'" class="btn-close" @click="back()">取消</el-button>
        <el-button v-if="type=='info'" class="btn-close" @click="back()">返回</el-button>
      </el-form-item>
    </el-form>

  </div>
</template>
<script>
import MapDialog from '@/components/MapDialog.vue';
// 数字，邮件，手机，url，身份证校验

import {isNumber, isIntNumer, isEmail, isPhone, isMobile, isURL, checkIdCard} from "@/utils/validate";

export default {
  data() {

    var validateIntNumber = (rule, value, callback) => {
      if (!value) {
        callback();
      } else if (!isIntNumer(value)) {
        callback(new Error("请输入整数"));
      } else {
        callback();
      }
    };
    return {
      currentPicked: {
        latlng: {},
      },
      mapApiKey: "NRKBZ-VDZ6I-NA6GM-UQ55F-LCIUS-JPFQZ",
      IFRAME_HTML: `<iframe id="mapPage" width="2000" height="800" frameborder="0"
              src="https://apis.map.qq.com/tools/locpicker?search=1&type=1&key=UU2BZ-B6RKG-QCTQW-IA6XO-5NHSH-Q6BYM&referer=myapp"></iframe>`,
      mapDialogVisible: false,
      lng: '',
      lat: '',
      marker:{
      },
      addEditForm: {
        "btnSaveFontColor": "#fff",
        "selectFontSize": "14px",
        "btnCancelBorderColor": "rgba(167, 164, 164, 1)",
        "inputBorderRadius": "4px",
        "inputFontSize": "14px",
        "textareaBgColor": "#fff",
        "btnSaveFontSize": "14px",
        "textareaBorderRadius": "4px",
        "uploadBgColor": "#fff",
        "textareaBorderStyle": "solid",
        "btnCancelWidth": "88px",
        "textareaHeight": "120px",
        "dateBgColor": "#fff",
        "btnSaveBorderRadius": "4px",
        "uploadLableFontSize": "14px",
        "textareaBorderWidth": "1px",
        "inputLableColor": "#606266",
        "addEditBoxColor": "rgba(238, 238, 238, 0.68)",
        "dateIconFontSize": "14px",
        "btnSaveBgColor": "rgba(105, 106, 106, 1)",
        "uploadIconFontColor": "rgba(146, 143, 126, 0.71)",
        "textareaBorderColor": "#DCDFE6",
        "btnCancelBgColor": "rgba(231, 231, 231, 0.78)",
        "selectLableColor": "#606266",
        "btnSaveBorderStyle": "solid",
        "dateBorderWidth": "1px",
        "dateLableFontSize": "14px",
        "dateBorderRadius": "4px",
        "btnCancelBorderStyle": "solid",
        "selectLableFontSize": "14px",
        "selectBorderStyle": "solid",
        "selectIconFontColor": "#C0C4CC",
        "btnCancelHeight": "44px",
        "inputHeight": "40px",
        "btnCancelFontColor": "#606266",
        "dateBorderColor": "#DCDFE6",
        "dateIconFontColor": "#C0C4CC",
        "uploadBorderStyle": "solid",
        "dateBorderStyle": "solid",
        "dateLableColor": "#606266",
        "dateFontSize": "14px",
        "inputBorderWidth": "1px",
        "uploadIconFontSize": "28px",
        "selectHeight": "40px",
        "inputFontColor": "#606266",
        "uploadHeight": "148px",
        "textareaLableColor": "#606266",
        "textareaLableFontSize": "14px",
        "btnCancelFontSize": "14px",
        "inputBorderStyle": "solid",
        "btnCancelBorderRadius": "4px",
        "inputBgColor": "#fff",
        "inputLableFontSize": "14px",
        "uploadLableColor": "#606266",
        "uploadBorderRadius": "4px",
        "btnSaveHeight": "44px",
        "selectBgColor": "#fff",
        "btnSaveWidth": "88px",
        "selectIconFontSize": "14px",
        "dateHeight": "40px",
        "selectBorderColor": "#DCDFE6",
        "inputBorderColor": "#DCDFE6",
        "uploadBorderColor": "#DCDFE6",
        "textareaFontColor": "#606266",
        "selectBorderWidth": "1px",
        "dateFontColor": "#606266",
        "btnCancelBorderWidth": "1px",
        "uploadBorderWidth": "1px",
        "textareaFontSize": "14px",
        "selectBorderRadius": "4px",
        "selectFontColor": "#606266",
        "btnSaveBorderColor": "rgba(255, 255, 255, 1)",
        "btnSaveBorderWidth": "1px"
      },
      id: '',
      type: '',
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
        clicktime: '',
      },
      huodongdiquOptions: [],
      huodongleixingOptions: [],
      rules: {
        huodongdiqu: [],
        huodongmingcheng: [
          {required: true, message: '活动名称不能为空', trigger: 'blur'},
        ],
        huodongleixing: [
          {required: true, message: '活动类型不能为空', trigger: 'blur'},
        ],
        huodongtupian: [],
        huodongdidian: [],
        huodongshijian: [],
        huodongfeiyong: [
          {validator: validateIntNumber, trigger: 'blur'},
        ],
        feiyongshuoming: [],
        gonglvexinxi: [],
        huodongxiangqing: [],
        xingchenganpai: [],
        zhuangbeiyaoqiu: [],
        faburiqi: [],
        clicktime: [],
      }
    };
  },





  props: ["parent"],
  computed: {},
  components: {
    MapDialog
  },
  created() {
    this.ruleForm.faburiqi = this.getCurDate()
    this.addEditStyleChange()
    this.addEditUploadStyleChange()
  },
  methods: {
    // 下载
    download(file) {
      window.open(`${file}`)
    },
    // 初始化
    init(id, type) {
      if (id) {
        this.id = id;
        this.type = type;
      }
      if (this.type == 'info' || this.type == 'else') {
        this.info(id);
      } else if (this.type == 'logistics') {
        this.logistics = false;
        this.info(id);
      } else if (this.type == 'cross') {
        var obj = this.$storage.getObj('crossObj');
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
      // 获取用户信息
      this.$http({
        url: `${this.$storage.get('sessionTable')}/session`,
        method: "get"
      }).then(({data}) => {
        if (data && data.code === 0) {
          var json = data.data;
        } else {
          this.$message.error(data.msg);
        }
      });
      this.$http({
        url: `option/huodongdiqu/huodongdiqu`,
        method: "get"
      }).then(({data}) => {
        if (data && data.code === 0) {
          this.huodongdiquOptions = data.data;
        } else {
          this.$message.error(data.msg);
        }
      });

      this.$http({
        url: `option/huodongleixing/huodongleixing`,
        method: "get"
      }).then(({data}) => {
        if (data && data.code === 0) {
          this.huodongleixingOptions = data.data;
        } else {
          this.$message.error(data.msg);
        }
      });

    },
    // 多级联动参数
    info(id) {
      this.$http({
        url: `huodongxinxi/info/${id}`,
        method: "get"
      }).then(({data}) => {
        if (data && data.code === 0) {
          this.ruleForm = data.data;
          //解决前台上传图片后台不显示的问题
          let reg = new RegExp('../../../upload', 'g')//g代表全部
          this.ruleForm.huodongxiangqing = this.ruleForm.huodongxiangqing.replace(reg, '../../../tangfen/upload');
        } else {
          this.$message.error(data.msg);
        }
      });
    },
    openMapDialog() {
      this.mapDialogVisible = true;
    },

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

      this.ruleForm.huodongdidian = this.currentPicked.poiaddress;
    },

    // 提交
    onSubmit() {


      if (this.ruleForm.huodongtupian != null) {
        this.ruleForm.huodongtupian = this.ruleForm.huodongtupian.replace(new RegExp(this.$base.url, "g"), "");
      }


      var objcross = this.$storage.getObj('crossObj');

      //更新跨表属性
      var crossuserid;
      var crossrefid;
      var crossoptnum;
      if (this.type == 'cross') {
        var statusColumnName = this.$storage.get('statusColumnName');
        var statusColumnValue = this.$storage.get('statusColumnValue');
        if (statusColumnName != '') {
          var obj = this.$storage.getObj('crossObj');
          if (!statusColumnName.startsWith("[")) {
            for (var o in obj) {
              if (o == statusColumnName) {
                obj[o] = statusColumnValue;
              }
            }
            var table = this.$storage.get('crossTable');
            this.$http({
              url: `${table}/update`,
              method: "post",
              data: obj
            }).then(({data}) => {
            });
          } else {
            crossuserid = this.$storage.get('userid');
            crossrefid = obj['id'];
            crossoptnum = this.$storage.get('statusColumnName');
            crossoptnum = crossoptnum.replace(/\[/, "").replace(/\]/, "");
          }
        }
      }

      this.$refs["ruleForm"].validate(valid => {
        if (valid) {
          if (crossrefid && crossuserid) {
            this.ruleForm.crossuserid = crossuserid;
            this.ruleForm.crossrefid = crossrefid;
            let params = {
              page: 1,
              limit: 10,
              crossuserid: this.ruleForm.crossuserid,
              crossrefid: this.ruleForm.crossrefid,
            }
            this.$http({
              url: "huodongxinxi/page",
              method: "get",
              params: params
            }).then(({
                       data
                     }) => {
              if (data && data.code === 0) {
                if (data.data.total >= crossoptnum) {
                  this.$message.error(this.$storage.get('tips'));
                  return false;
                } else {
                  this.$http({
                    url: `huodongxinxi/${!this.ruleForm.id ? "save" : "update"}`,
                    method: "post",
                    data: this.ruleForm
                  }).then(({data}) => {
                    if (data && data.code === 0) {
                      this.$message({
                        message: "操作成功",
                        type: "success",
                        duration: 1500,
                        onClose: () => {
                          this.parent.showFlag = true;
                          this.parent.addOrUpdateFlag = false;
                          this.parent.huodongxinxiCrossAddOrUpdateFlag = false;
                          this.parent.search();
                          this.parent.contentStyleChange();
                        }
                      });
                    } else {
                      this.$message.error(data.msg);
                    }
                  });

                }
              } else {
              }
            });
          } else {
            this.$http({
              url: `huodongxinxi/${!this.ruleForm.id ? "save" : "update"}`,
              method: "post",
              data: this.ruleForm
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.$message({
                  message: "操作成功",
                  type: "success",
                  duration: 1500,
                  onClose: () => {
                    this.parent.showFlag = true;
                    this.parent.addOrUpdateFlag = false;
                    this.parent.huodongxinxiCrossAddOrUpdateFlag = false;
                    this.parent.search();
                    this.parent.contentStyleChange();
                  }
                });
              } else {
                this.$message.error(data.msg);
              }
            });
          }
        }
      });
      let activity_id;
     if( !this.ruleForm.id){
       let response =  this.$http.save('huodongxinxi', this.ruleForm);
        activity_id = response.id;
     }else {
        activity_id = this.ruleForm.id
     }

      let locationData = {
        page: 1,
        limit: 10,
        latitude: this.currentPicked.latlng.lat,
        longitude:this.currentPicked.latlng.lng,
        title: this.currentPicked.poiaddress,
        /*poiname: this.currentPicked.poiname,*/
        activityId: activity_id,
        addtime: this.ruleForm.clicktime
      };

      this.$http({
        url: `marker/${!this.ruleForm.id ? "save" : "update"}`,
        method: "post",
        data: locationData
      }).then(({ data }) => {
        if (data && data.code === 0) {
          this.$message({
            message: "位置信息提交成功",
            type: "success",
            duration: 1500,
          });
        } else {
          this.$message.error(data.msg);
        }
      });

    },
    // 获取uuid
    getUUID() {
      return new Date().getTime();
    },
    // 返回
    back() {
      this.parent.showFlag = true;
      this.parent.addOrUpdateFlag = false;
      this.parent.huodongxinxiCrossAddOrUpdateFlag = false;
      this.parent.contentStyleChange();
    },
    huodongtupianUploadChange(fileUrls) {
      this.ruleForm.huodongtupian = fileUrls;
      this.addEditUploadStyleChange()
    },
    addEditStyleChange() {
      this.$nextTick(() => {
        // input
        document.querySelectorAll('.addEdit-block .input .el-input__inner').forEach(el => {
          el.style.height = this.addEditForm.inputHeight
          el.style.color = this.addEditForm.inputFontColor
          el.style.fontSize = this.addEditForm.inputFontSize
          el.style.borderWidth = this.addEditForm.inputBorderWidth
          el.style.borderStyle = this.addEditForm.inputBorderStyle
          el.style.borderColor = this.addEditForm.inputBorderColor
          el.style.borderRadius = this.addEditForm.inputBorderRadius
          el.style.backgroundColor = this.addEditForm.inputBgColor
        })
        document.querySelectorAll('.addEdit-block .input .el-form-item__label').forEach(el => {
          el.style.lineHeight = this.addEditForm.inputHeight
          el.style.color = this.addEditForm.inputLableColor
          el.style.fontSize = this.addEditForm.inputLableFontSize
        })
        // select
        document.querySelectorAll('.addEdit-block .select .el-input__inner').forEach(el => {
          el.style.height = this.addEditForm.selectHeight
          el.style.color = this.addEditForm.selectFontColor
          el.style.fontSize = this.addEditForm.selectFontSize
          el.style.borderWidth = this.addEditForm.selectBorderWidth
          el.style.borderStyle = this.addEditForm.selectBorderStyle
          el.style.borderColor = this.addEditForm.selectBorderColor
          el.style.borderRadius = this.addEditForm.selectBorderRadius
          el.style.backgroundColor = this.addEditForm.selectBgColor
        })
        document.querySelectorAll('.addEdit-block .select .el-form-item__label').forEach(el => {
          el.style.lineHeight = this.addEditForm.selectHeight
          el.style.color = this.addEditForm.selectLableColor
          el.style.fontSize = this.addEditForm.selectLableFontSize
        })
        document.querySelectorAll('.addEdit-block .select .el-select__caret').forEach(el => {
          el.style.color = this.addEditForm.selectIconFontColor
          el.style.fontSize = this.addEditForm.selectIconFontSize
        })
        // date
        document.querySelectorAll('.addEdit-block .date .el-input__inner').forEach(el => {
          el.style.height = this.addEditForm.dateHeight
          el.style.color = this.addEditForm.dateFontColor
          el.style.fontSize = this.addEditForm.dateFontSize
          el.style.borderWidth = this.addEditForm.dateBorderWidth
          el.style.borderStyle = this.addEditForm.dateBorderStyle
          el.style.borderColor = this.addEditForm.dateBorderColor
          el.style.borderRadius = this.addEditForm.dateBorderRadius
          el.style.backgroundColor = this.addEditForm.dateBgColor
        })
        document.querySelectorAll('.addEdit-block .date .el-form-item__label').forEach(el => {
          el.style.lineHeight = this.addEditForm.dateHeight
          el.style.color = this.addEditForm.dateLableColor
          el.style.fontSize = this.addEditForm.dateLableFontSize
        })
        document.querySelectorAll('.addEdit-block .date .el-input__icon').forEach(el => {
          el.style.color = this.addEditForm.dateIconFontColor
          el.style.fontSize = this.addEditForm.dateIconFontSize
          el.style.lineHeight = this.addEditForm.dateHeight
        })
        // upload
        let iconLineHeight = parseInt(this.addEditForm.uploadHeight) - parseInt(this.addEditForm.uploadBorderWidth) * 2 + 'px'
        document.querySelectorAll('.addEdit-block .upload .el-upload--picture-card').forEach(el => {
          el.style.width = this.addEditForm.uploadHeight
          el.style.height = this.addEditForm.uploadHeight
          el.style.borderWidth = this.addEditForm.uploadBorderWidth
          el.style.borderStyle = this.addEditForm.uploadBorderStyle
          el.style.borderColor = this.addEditForm.uploadBorderColor
          el.style.borderRadius = this.addEditForm.uploadBorderRadius
          el.style.backgroundColor = this.addEditForm.uploadBgColor
        })
        document.querySelectorAll('.addEdit-block .upload .el-form-item__label').forEach(el => {
          el.style.lineHeight = this.addEditForm.uploadHeight
          el.style.color = this.addEditForm.uploadLableColor
          el.style.fontSize = this.addEditForm.uploadLableFontSize
        })
        document.querySelectorAll('.addEdit-block .upload .el-icon-plus').forEach(el => {
          el.style.color = this.addEditForm.uploadIconFontColor
          el.style.fontSize = this.addEditForm.uploadIconFontSize
          el.style.lineHeight = iconLineHeight
          el.style.display = 'block'
        })
        // 多文本输入框
        document.querySelectorAll('.addEdit-block .textarea .el-textarea__inner').forEach(el => {
          el.style.height = this.addEditForm.textareaHeight
          el.style.color = this.addEditForm.textareaFontColor
          el.style.fontSize = this.addEditForm.textareaFontSize
          el.style.borderWidth = this.addEditForm.textareaBorderWidth
          el.style.borderStyle = this.addEditForm.textareaBorderStyle
          el.style.borderColor = this.addEditForm.textareaBorderColor
          el.style.borderRadius = this.addEditForm.textareaBorderRadius
          el.style.backgroundColor = this.addEditForm.textareaBgColor
        })
        document.querySelectorAll('.addEdit-block .textarea .el-form-item__label').forEach(el => {
          // el.style.lineHeight = this.addEditForm.textareaHeight
          el.style.color = this.addEditForm.textareaLableColor
          el.style.fontSize = this.addEditForm.textareaLableFontSize
        })
        // 保存
        document.querySelectorAll('.addEdit-block .btn .btn-success').forEach(el => {
          el.style.width = this.addEditForm.btnSaveWidth
          el.style.height = this.addEditForm.btnSaveHeight
          el.style.color = this.addEditForm.btnSaveFontColor
          el.style.fontSize = this.addEditForm.btnSaveFontSize
          el.style.borderWidth = this.addEditForm.btnSaveBorderWidth
          el.style.borderStyle = this.addEditForm.btnSaveBorderStyle
          el.style.borderColor = this.addEditForm.btnSaveBorderColor
          el.style.borderRadius = this.addEditForm.btnSaveBorderRadius
          el.style.backgroundColor = this.addEditForm.btnSaveBgColor
        })
        // 返回
        document.querySelectorAll('.addEdit-block .btn .btn-close').forEach(el => {
          el.style.width = this.addEditForm.btnCancelWidth
          el.style.height = this.addEditForm.btnCancelHeight
          el.style.color = this.addEditForm.btnCancelFontColor
          el.style.fontSize = this.addEditForm.btnCancelFontSize
          el.style.borderWidth = this.addEditForm.btnCancelBorderWidth
          el.style.borderStyle = this.addEditForm.btnCancelBorderStyle
          el.style.borderColor = this.addEditForm.btnCancelBorderColor
          el.style.borderRadius = this.addEditForm.btnCancelBorderRadius
          el.style.backgroundColor = this.addEditForm.btnCancelBgColor
        })
      })
    },
    addEditUploadStyleChange() {
      this.$nextTick(() => {
        document.querySelectorAll('.addEdit-block .upload .el-upload-list--picture-card .el-upload-list__item').forEach(el => {
          el.style.width = this.addEditForm.uploadHeight
          el.style.height = this.addEditForm.uploadHeight
          el.style.borderWidth = this.addEditForm.uploadBorderWidth
          el.style.borderStyle = this.addEditForm.uploadBorderStyle
          el.style.borderColor = this.addEditForm.uploadBorderColor
          el.style.borderRadius = this.addEditForm.uploadBorderRadius
          el.style.backgroundColor = this.addEditForm.uploadBgColor
        })
      })
    },
  }
};
</script>
<style lang="scss">
.editor {
  height: 500px;

  & /deep/ .ql-container {
    height: 310px;
  }
}

.amap-wrapper {
  width: 100%;
  height: 500px;
}

.search-box {
  position: absolute;
}

.addEdit-block {
  margin: -10px;
}

.detail-form-content {
  padding: 12px;
  background-color: transparent;
}

.btn .el-button {
  padding: 0;
}
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
