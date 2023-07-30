<template>

  <RouterView/>

  <Bottom/>
</template>

<script lang="ts">
import {RouterLink, RouterView} from "vue-router";
import Bottom from "./components/bottom.vue";


export default {
  data() {
    return {
      data: "",
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
