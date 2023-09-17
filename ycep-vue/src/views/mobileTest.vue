<template>
 <div>移动端</div>
</template>

<script lang="ts">
import Bottom from "../components/bottom.vue";

export default {
  data() {
    return {
      data: "",
      showBottom: true
    };
  },
  components: { Bottom },
  // 对路由监听，获取当前页面地址
  watch: {},
  mounted() {},

  methods: {},
};
</script>

<style scoped></style>
