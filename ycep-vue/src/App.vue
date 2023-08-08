<template>

  <RouterView :key="route.path"/>

  <Bottom/>
</template>

<script lang="ts">
import {RouterLink, RouterView,useRoute} from "vue-router";
import Bottom from "./components/bottom.vue";


export default {
  data() {
    return {
      data: "",
      route:useRoute()
    };
  },
  components: {Bottom},
  mounted() {
  },

  methods: {}
};
</script>

<style scoped>

</style>
