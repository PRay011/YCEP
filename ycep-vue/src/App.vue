<template>
  <!--  顶部导航栏-->
  <Top/>

  <RouterView/>


</template>

<script lang="ts">
import {RouterLink, RouterView} from "vue-router";
import Top from "./components/top.vue";


export default {
  data() {
    return {
      data: "",
    };
  },
  components: {Top},
};
</script>

<style scoped>

</style>
