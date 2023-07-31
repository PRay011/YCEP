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
@media (min-width: 1024px) {
  .container {
    min-height: 100vh;
    display: flex;
    align-items: center;
  }
}

$font_color: #e1e1e1;
$font_color_selected: limegreen;
@mixin pretty-card-div {
  .card {
    width: 190px;
    height: 254px;
    background: #07182E;
    position: relative;
    display: flex;
    place-content: center;
    place-items: center;
    overflow: hidden;
    border-radius: 20px;
  }

  .card h2 {
    z-index: 1;
    color: white;
    font-size: 2em;
  }

  .card::before {
    content: '';
    position: absolute;
    width: 100px;
    background-image: linear-gradient(180deg, rgb(0, 183, 255), rgb(255, 48, 255));
    height: 130%;
    animation: rotBGimg 3s linear infinite;
    transition: all 0.2s linear;
  }

  @keyframes rotBGimg {
    from {
      transform: rotate(0deg);
    }

    to {
      transform: rotate(360deg);
    }
  }

  .card::after {
    content: '';
    position: absolute;
    background: #07182E;;
    inset: 5px;
    border-radius: 15px;
  }
  /* .card:hover:before {
    background-image: linear-gradient(180deg, rgb(81, 255, 0), purple);
    animation: rotBGimg 3.5s linear infinite;
  } */


}

.main {
  display: flex;
  width: 100%;
  height: 100vh;
  background-image: url(https://files.zuhaohao.com/demon/bg-259831f5be454b73a1af099b4a83f5b0.png);
  background-size: 100% 100%;
  background-position: 0 0;
  position: relative;
  overflow: hidden;

  .descriptionList {
    width: 20%;
    height: 80%;
    margin-top: 250px;
    margin-left: 250px;
    //background-color: #a1a1a1;
    display: flex;
    flex-direction: column;

    .desc {
      display: flex;
      text-align: left;
      margin: 30px;
      cursor: pointer;

      .pretty-radio-div {
        @include pretty-radio-div;
        margin-right: 80px;
      }

      label {
        color: $font_color;
        font-family: "Microsoft YaHei", sans-serif;
        font-size: 22px;
        line-height: 46px;

        &.checked, &:hover {
          font-size: 30px;
          color: $font_color_selected;
        }
      }
    }
  }

  .details {
    //@include pretty-card-div;
    width: 40%;
    height: 60%;
    margin-top: 250px;
    background-color: #a1a1a1;
  }

  .pretty-button-div {
    position: relative;
    top: 400px;
    left: 100px;
    display: flex;
    flex-direction: column;
    @include pretty-button-div;

    button {
      margin: 30px;
    }
  }
}


</style>
