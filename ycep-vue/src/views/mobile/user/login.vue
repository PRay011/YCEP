<template>
  <div class="container">
    <div class="content">
      <div class="title">ycep</div>
      <div class="content__form">
        <div class="content__inputs">
          <label>
            <input required="" type="text" v-model="user.username" />
            <span>账号</span>
          </label>
          <label>
            <input required="" type="password" v-model="user.password" />
            <span>密码</span>
          </label>
          <div class="input-group">
            <div class="check-code">
              <input
              class="check-input"
                type="text"
                v-model="user.code"
                placeholder=""
              />
              <a class="check-btn"
                ><img
                  :src="codeUrl"
                  alt="验证码"
                  id="verificationCode"
                  @click="newVertification()"
              /></a>
            </div>
          </div>
        </div>
        <button @click="login">Log In</button>
      </div>
      <div class="content__or-text">
        <span></span>
        <span>OR</span>
        <span></span>
      </div>
      <div class="content__forgot-buttons">
        <button>忘记密码?</button>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import Top from "../../../components/top.vue";
import { login, vertify } from "../../../api/user/login";

export default defineComponent({
  name: "login",
  data() {
    return {
      codeUrl: "",
      user: {
        username: "",
        password: "",
        code: "",
        codeID: "",
        isSelectedInterest: 0,
      },
    };
  },
  components: { Top },
  mounted() {
    this.ready();
  },
  methods: {
    ready() {
      this.newVertification();
    },
    newVertification() {
      let that = this;
      vertify()
        .then((res: any) => {
          console.log("vertification");
          that.user.codeID = res.codeID;
          that.user.code = "";
          that.codeUrl = "data:image/gif;base64," + res.image;
        })
        .catch((err: any) => {
          console.log(err);
        });
    },
    login() {
      let that = this;
      console.log('user')
      console.log(this.user)
      login(that.user)
        .then((res: any) => {
          sessionStorage.setItem(
            "isSelectedInterest",
            String(res.data.isSelectedInterest)
          );
          sessionStorage.setItem("phone", 'true');
          sessionStorage.setItem("username", this.user.username);
          sessionStorage.setItem("token", res.data.token);
          this.$router.push("/mobile/index");
        })
        .catch((err: any) => {
          that.user.password = "";
          that.newVertification();
        });
    },
  },
});
</script>

<style lang="scss" scoped>
@import "../../../assets/style/css/mobile/login.scss";
</style>
