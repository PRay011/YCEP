<template>
  <!--  顶部导航栏-->
  <Top/>

  <div class="container">
    <div class="main">
      <!--左侧公告list-->
      <div class="descriptionList">
        <div class="desc">
          <div class="pretty-radio-div">
            <label class="div">
              <input type="radio" id="check1" name="desc" checked="checked" @click="checkedItem=1">
              <div class="checkmark"></div>
            </label>
          </div>
          <label for="check1" :class="checkedItem===1?'checked':''" @click="checkedItem=1">系统描述</label>
        </div>
        <div class="desc">
          <div class="pretty-radio-div">
            <label class="div">
              <input type="radio" id="check2" name="desc" @click="checkedItem=2">
              <div class="checkmark"></div>
            </label>
          </div>
          <label for="check2" :class="checkedItem===2?'checked':''" @click="checkedItem=2">编程</label>
        </div>
        <div class="desc">
          <div class="pretty-radio-div">
            <label class="div">
              <input type="radio" id="check3" name="desc">
              <div class="checkmark"></div>
            </label>
          </div>
          <label for="check3" :class="checkedItem===3?'checked':''" @click="checkedItem=3">材料</label>
        </div>
        <div class="desc">
          <div class="pretty-radio-div">
            <label class="div">
              <input type="radio" id="check4" name="desc">
              <div class="checkmark"></div>
            </label>
          </div>
          <label for="check4" :class="checkedItem===4?'checked':''" @click="checkedItem=4">物理</label>
        </div>
        <div class="desc">
          <div class="pretty-radio-div">
            <label class="div">
              <input type="radio" id="check5" name="desc">
              <div class="checkmark"></div>
            </label>
          </div>
          <label for="check5" :class="checkedItem===5?'checked':''" @click="checkedItem=5">化学</label>
        </div>
      </div>

      <div class="details">
        <div class="check1" v-if="checkedItem===1">
          <h2>系统描述</h2>
          <!--          <div class="card">-->
          <!--            <h2>CARD</h2>-->
          <!--          </div>-->
        </div>

        <div class="check2" v-if="checkedItem===2">
          <h2>编程</h2>
        </div>

        <div class="check3" v-if="checkedItem===3">
          <h2>材料</h2>
        </div>

        <div class="check4" v-if="checkedItem===4">
          <h2>物理</h2>
        </div>

        <div class="check5" v-if="checkedItem===5">
          <h2>化学</h2>
        </div>


      </div>

      <div class="pretty-button-div">
        <router-link to="/knowledge/index">
          <button>进入首页</button>
        </router-link>
        <router-link to="/user/login">
          <button>登录/注册</button>
        </router-link>
        <router-link to="/game/main ">
          <button>游戏界面</button>
        </router-link>
      </div>


    </div>
  </div>
</template>

<script lang="ts">

import Top from "../components/top.vue";

export default {
  name: "HomeView",
  components: {Top},
  data() {
    return {
      checkedItem: 1,

    }
  }
}
</script>

<style scoped lang="scss">
@import "../assets/style/css/homeview.scss";
</style>
