<template>
  <div  class="container" style=" height: 100vh; display: flex; align-items: center; justify-content: center;">
    <div style="display: flex ; background-color: white; width: 50%; border-radius: 5px; overflow: hidden">
      <div style="flex: 1">
        <img src="../assets/img/login.png" alt="" style="width: 100%">
      </div>
      <div style="flex: 1; display: flex; align-items: center; justify-content: center;">
           <el-form style="width: 80%" >
             <div style="font-size: 20px; font-weight: bold ;text-align: center; margin-bottom: 20px">欢迎登录后台管理系统</div>
             <el-form-item >
            <el-input placeholder="请输入用户名" name="username" type="text" v-model="rulesForm.username"/>
          </el-form-item>
          <el-form-item >
            <el-input placeholder="请输入密码" name="password" type="password" v-model="rulesForm.password"/>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="login()" style="width: 100%">{{ '1' == '1' ? '登录' : 'login' }}</el-button>
          </el-form-item>

        </el-form>
      </div>

    </div>
  </div>
</template>
<script>

import menu from "@/utils/menu";
import canvasBg from "@/assets/js/canvas-bg-2.js";
import "@/assets/css/canvas-bg-2.css"

export default {
  data() {
    return {
      rulesForm: {
        username: "",
        password: "",

      },
      menus: [],
      roles: [],
      tableName: "",

    };
  },
  mounted() {
    let menus = menu.list();
    this.menus = menus;
    for (let i = 0; i < this.menus.length; i++) {
      if (this.menus[i].hasBackLogin == '是') {
        this.roles.push(this.menus[i])
      }
    }
    this.$nextTick(() => {
      canvasBg()
    })
  },
  created() {

  },
  methods: {

    // 登陆
    login() {
      if (!this.rulesForm.username) {
        this.$message.error("请输入用户名");
        return;
      }
      if (!this.rulesForm.password) {
        this.$message.error("请输入密码");
        return;
      }console.log(this.tableName);
      if (this.roles.length > 1) {
        if (!this.rulesForm.role) {
          this.$message.error("请选择角色");
          return;
        }
        let menus = this.menus;
        for (let i = 0; i < menus.length; i++) {
          if (menus[i].roleName == this.rulesForm.role) {
            this.tableName = menus[i].tableName;
          }
        }
      } else {
        this.tableName = this.roles[0].tableName;
        this.rulesForm.role = this.roles[0].roleName;
      }

      this.$http({
        url: `${this.tableName}/login?username=${this.rulesForm.username}&password=${this.rulesForm.password}`,
        method: "post"
      }).then(({data}) => {
        if (data && data.code === 0) {
          this.$storage.set("Token", data.token);
          this.$storage.set("role", this.rulesForm.role);
          this.$storage.set("sessionTable", this.tableName);
          this.$storage.set("adminName", this.rulesForm.username);
          this.$router.replace({path: "/index/"});
        } else {
          this.$message.error(data.msg);
        }
      });
    },

  }
};
</script>
<style lang="scss" scoped>
.container {
  height: 100vh;
  overflow: hidden;
  background-image: url("../assets/img/logincover.jpg");
  background-size: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #666;
}
.loginIn {
  min-height: 100vh;
  position: relative;
  background-repeat: no-repeat;
  background-position: center center;
  background-size: cover;


  .loginInBt {
    width: 150px;
    height: 150px;
    line-height: 150px;
    margin: -75px -150px;
    padding: 0;
    color: rgba(0, 0, 0, 1);
    font-size: 16px;
    border-radius: 50%;
    border-width: 2px;
    border-style: solid;
    border-color: rgba(109, 109, 111, 1);
    background-color: rgba(255, 255, 255, 1);
    box-shadow: 0 0 6px rgba(255, 0, 0, .1);
  }

  .register {
    width: auto;
    height: 24px;
    line-height: 24px;
    margin: 0 0 0 30px;
    padding: 0;
    color: rgba(231, 231, 231, 1);
    font-size: 12px;
    border-radius: 0;
    border-width: 0;
    border-style: solid;
    border-color: rgba(64, 158, 255, 1);
    background-color: rgba(255, 255, 255, 0);
    box-shadow: 0 0 6px rgba(255, 0, 0, 0);
    cursor: pointer;
  }

  .reset {
    width: auto;
    height: 24px;
    line-height: 24px;
    margin: 0 30px 0 0;
    padding: 0;
    color: rgba(230, 230, 230, 1);
    font-size: 12px;
    border-radius: 0;
    border-width: 0;
    border-style: solid;
    border-color: rgba(64, 158, 255, 1);
    background-color: rgba(255, 255, 255, 0);
    box-shadow: 0 0 6px rgba(255, 0, 0, 0);
  }


  .left {
    position: absolute;
    left: 0;
    top: 0;
    box-sizing: border-box;
    width: 400px;
    height: 400px;
    margin: 20% 6%;
    padding: 0 50px;
    border-radius: 50%;
    border-width: 5px;
    border-style: solid;
    border-color: rgba(78, 75, 75, 0.98);
    background-color: rgba(52, 67, 81, 0.63);
    box-shadow: 0 0 0px rgba(30, 144, 255, .8);

    .login-form {
      background-color: transparent;
      width: 100%;
      right: inherit;
      padding: 0;
      box-sizing: border-box;
      display: flex;
      position: initial;
      justify-content: center;
      flex-direction: column;
    }

    .title-container {
      text-align: center;
      font-size: 24px;

      .title {
        width: 80%;
        line-height: 30px;
        margin: 30px 20px 40px 20px;
        padding: 0;
        color: rgba(255, 255, 255, 1);
        font-size: 20px;
        border-radius: 0;
        border-width: 0;
        border-style: solid;
        border-color: rgba(0, 0, 0, .3);
        background-color: rgba(0, 0, 0, 0);
        box-shadow: 0 0 6px rgba(0, 0, 0, 0);
      }
    }

    .el-form-item {
      position: relative;

      & /deep/ .el-form-item__content {
        line-height: initial;
      }

      & /deep/ .el-radio__label {
        width: auto;
        height: 14px;
        line-height: 14px;
        margin: 0;
        padding: 0 0 0 10px;
        color: #fff;
        font-size: 14px;
        border-radius: 0;
        border-width: 0;
        border-style: solid;
        border-color: rgba(255, 255, 255, 0);
        background-color: rgba(255, 255, 255, 0);
        box-shadow: 0 0 6px rgba(255, 0, 0, 0);
        text-align: left;
      }

      & /deep/ .el-radio.is-checked .el-radio__label {
        width: auto;
        height: 14px;
        line-height: 14px;
        margin: 0;
        padding: 0 0 0 10px;
        color: rgba(250, 212, 0, 1);
        font-size: 14px;
        border-radius: 0;
        border-width: 0;
        border-style: solid;
        border-color: rgba(255, 255, 255, 0);
        background-color: rgba(255, 255, 255, 0);
        box-shadow: 0 0 6px rgba(255, 0, 0, 0);
        text-align: left;
      }

      & /deep/ .el-radio__inner {
        width: 14px;
        height: 14px;
        margin: 0;
        padding: 0;
        border-radius: 100%;
        border-width: 1px;
        border-style: solid;
        border-color: #dcdfe6;
        background-color: rgba(255, 255, 255, 1);
        box-shadow: 0 0 6px rgba(255, 0, 0, 0);
      }

      & /deep/ .el-radio.is-checked .el-radio__inner {
        width: 14px;
        height: 14px;
        margin: 0;
        padding: 0;
        border-radius: 100%;
        border-width: 1px;
        border-style: solid;
        border-color: rgba(250, 212, 0, 1);
        background-color: rgba(250, 212, 0, 1);
        box-shadow: 0 0 6px rgba(255, 0, 0, 0);
      }

      .svg-container {
        padding: 6px 5px 6px 15px;
        color: #889aa4;
        vertical-align: middle;
        display: inline-block;
        position: absolute;
        left: 0;
        top: 0;
        z-index: 1;
        padding: 0;
        line-height: 40px;
        width: 30px;
        text-align: center;
      }

      .el-input {
        display: inline-block;
        // height: 40px;
        width: 100%;

        & /deep/ input {
          background: transparent;
          border: 0px;
          -webkit-appearance: none;
          padding: 0 15px 0 30px;
          color: #fff;
          height: 40px;

          width: 100%;
          height: 30px;
          line-height: 30px;
          margin: 0;
          padding: 0 30px;
          color: rgba(254, 254, 254, 1);
          font-size: 16px;
          border-radius: 3px;
          border-width: 1.5px;
          border-style: solid;
          border-color: rgba(255, 255, 255, 1);
          background-color: rgba(0, 0, 0, 0);
          box-shadow: 0 0 6px rgba(255, 0, 0, 0);
        }
      }

    }


  }

  .center {
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate3d(-50%, -50%, 0);
  }

  .right {
    position: absolute;
    left: inherit;
    right: 0;
    top: 0;
  }

  .code {
    .el-form-item__content {
      position: relative;

      .getCodeBt {
        position: absolute;
        right: 0;
        top: 50%;
        transform: translate3d(0, -50%, 0);
        line-height: 40px;
        width: 100px;
        background-color: rgba(51, 51, 51, 0.4);
        color: #fff;
        text-align: center;
        border-radius: 0 4px 4px 0;
        height: 40px;
        overflow: hidden;
        padding: 0;
        margin: 0;
        width: 100px;
        height: 30px;
        line-height: 30px;
        border-radius: 0;
        border-width: 0;
        border-style: solid;
        border-color: rgba(64, 158, 255, 1);
        background-color: rgba(51, 51, 51, 0.4);
        box-shadow: 0 0 6px rgba(255, 0, 0, 0);

        span {
          padding: 0 5px;
          display: inline-block;
          font-size: 16px;
          font-weight: 600;
        }
      }

      .el-input {
        & /deep/ input {
          padding: 0 130px 0 30px;
        }
      }
    }
  }

  .setting {
    & /deep/ .el-form-item__content {
      // padding: 0 15px;
      box-sizing: border-box;
      line-height: 32px;
      height: 32px;
      font-size: 14px;
      color: #999;
      margin: 0 !important;
      display: flex;

      .register {
        // float: left;
        // width: 50%;
        text-align: center;
      }

      .reset {
        float: right;
        width: 50%;
        text-align: right;
      }
    }
  }

  .style2 {
    padding-left: 30px;

    .svg-container {
      left: -30px !important;
    }

    .el-input {
      & /deep/ input {
        padding: 0 15px !important;
      }
    }
  }

  .code.style2, .code.style3 {
    .el-input {
      & /deep/ input {
        padding: 0 115px 0 15px;
      }
    }
  }

  .style3 {
    & /deep/ .el-form-item__label {
      padding-right: 6px;
      height: 30px;
      line-height: 30px;
    }

    .el-input {
      & /deep/ input {
        padding: 0 15px !important;
      }
    }
  }

  & /deep/ .el-form-item__label {
    width: 30px;
    height: 30px;
    line-height: 30px;
    margin: 0;
    padding: 0;
    color: rgba(255, 255, 255, 1);
    font-size: 14px;
    border-radius: 0;
    border-width: 0;
    border-style: solid;
    border-color: rgba(0, 0, 0, 0);
    background-color: rgba(0, 0, 0, 0);
    box-shadow: 0 0 6px rgba(0, 0, 0, 0);
  }

  .role {
    & /deep/ .el-form-item__label {
      width: 56px !important;
      height: 38px;
      line-height: 38px;
      margin: 0;
      padding: 0;
      color: rgba(242, 242, 242, 1);
      font-size: 14px;
      border-radius: 0;
      border-width: 0;
      border-style: solid;
      border-color: rgba(64, 158, 255, 1);
      background-color: rgba(255, 255, 255, 0);
      box-shadow: 0 0 6px rgba(255, 0, 0, 0);
      text-align: left;
    }

    & /deep/ .el-radio {
      margin-right: 12px;
    }
  }
}
</style>
