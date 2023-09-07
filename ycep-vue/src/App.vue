<template>
  <RouterView :key="route.path" />

  <Bottom v-if="showBottom" />
</template>

<script lang="ts">
import { RouterLink, RouterView, useRoute } from "vue-router";
import Bottom from "./components/bottom.vue";

export default {
  data() {
    return {
      data: "",
      showBottom: true,
      route: useRoute(),
    };
  },
  components: { Bottom },
  // 对路由监听，获取当前页面地址
  watch: {
    $route: function () {
      //若为登录、注册页面则不显示侧边导航栏
      if (
        this.$route.path === "/user/register" ||
        this.$route.path === "/user/login"
      ) {
        this.showBottom = false;
      } else {
        this.showBottom = true;
      }
    },
  },
  mounted() {
    if(this._isMobile()){
        //手机端
        this.$router.replace("/mobile")
    }
  },

  methods: {
    _isMobile() {
      let flag = navigator.userAgent.match(
        /(phone|pad|iPhone|iPod|ios|iPad|Android|Mobile|BlackBerry|IEMobile|MQQBrowser|JUC|Fennec|wOSBrowser|BrowserNG|WebOS|Symbian|Windows phone)/i
      );
      return flag;
    },
  },
};
</script>

<style scoped></style>
