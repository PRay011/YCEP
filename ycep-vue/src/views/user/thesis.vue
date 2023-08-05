<template>
  <!--  顶部导航栏-->
  <Top/>

  <div class="container">
    <div class="main">

    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import Top from "../../components/top.vue";

export default defineComponent({
  name: "thesis",
  data() {
    return {
      data: "",
    };
  },
  components: {Top},
  mounted() {},
  methods: {
    ready() {},
  },
});
</script>

<style lang="scss" scoped>
@import "../../assets/style/css/user/thesis.scss";
</style>
