<template>
  <!--  顶部导航栏-->
  <Top/>
  <div class="container">
    <div class="main">
      <div class="game-main">
        <div class="play-btn" v-if="!isPlayed" @click="isPlayed=true">
          <img src="../../assets/images/play_btn.png" alt="播放按钮">
          <div class="mask"></div>
        </div>
        <div class="choose-mode" v-if="isPlayed">
          <div class="choose-title">请选择游戏模式</div>
          <div class="choose-buttons">
            <button class="button" @click="chosenMode=0">单机模式</button>
            <button class="button" @click="chosenMode=1">联机模式</button>
          </div>
        </div>



      </div>
      <div class="game-info">

      </div>
      <div class="game-actions">
        <button class="button">重新开始</button>
        <button class="button">结束游戏</button>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import Top from "../../components/top.vue";

export default defineComponent({
  name: "main",
  data() {
    return {
      data: "",
      game:{
        id:1,
        title:'',
      },
      isPlayed:false,
      //游戏模式：0为单机，1为联机
      chosenMode:0,

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
@media (min-width: 1024px) {
  .container {
    min-height: 100vh;
    padding-top: 50px;
    display: flex;
    align-items: center;
    background-image: url('../../assets/images/bgi.jpg');
    background-size: cover;
    background-repeat: repeat;
  }
}

@mixin pretty_button($width, $height){
  .button {
    width: $width;
    height: $height;
    display: inline-block;
    padding: 12px 24px;
    border: 1px solid #4f4f4f;
    border-radius: 4px;
    transition: all 0.2s ease-in;
    position: relative;
    overflow: hidden;
    font-size: 19px;
    color: black;
    z-index: 1;
  }

  .button:before {
    content: "";
    position: absolute;
    left: 50%;
    transform: translateX(-50%) scaleY(1) scaleX(1.25);
    top: 100%;
    width: 140%;
    height: 180%;
    background-color: rgba(0, 0, 0, 0.05);
    border-radius: 50%;
    display: block;
    transition: all 0.5s 0.1s cubic-bezier(0.55, 0, 0.1, 1);
    z-index: -1;
  }

  .button:after {
    content: "";
    position: absolute;
    left: 55%;
    transform: translateX(-50%) scaleY(1) scaleX(1.45);
    top: 180%;
    width: 160%;
    height: 190%;
    background-color: #39bda7;
    border-radius: 50%;
    display: block;
    transition: all 0.5s 0.1s cubic-bezier(0.55, 0, 0.1, 1);
    z-index: -1;
  }

  .button:hover {
    color: #ffffff;
    border: 1px solid #39bda7;
  }

  .button:hover:before {
    top: -35%;
    background-color: #39bda7;
    transform: translateX(-50%) scaleY(1.3) scaleX(0.8);
  }

  .button:hover:after {
    top: -45%;
    background-color: #39bda7;
    transform: translateX(-50%) scaleY(1.3) scaleX(0.8);
  }
}

.main{
  width:80%;
  height: auto;
  display: flex;
  flex-direction: column;
  margin: 50px auto;
  .game-main{
    width:80%;
    height:700px;
    background-color: white;
    margin:50px auto 0;

    .play-btn{
      width:150px;
      height:120px;
      margin: 250px auto 0;
      cursor: pointer;
      img{
        width:150px;
        height: 120px;
      }
    }

    .choose-mode{
      width:50%;
      height:200px;
      margin:200px auto;
      background-color: #e2e2e2;
      border-radius: 10px;
      display: flex;
      flex-direction: column;
      text-align: center;
      .choose-title{
        height: 100px;
        line-height: 100px;
        font-size: 28px;
      }
      .choose-buttons{
        width:50%;
        height:150px;
        display:flex;
        justify-content: space-between;
        margin: 0 auto;
        @include pretty_button(150px,50px)
      }
    }

  }
  .game-info{
    width:80%;
    height:100px;
    background-color: #a1a1a1;
    margin:20px auto;
  }
  .game-actions{
    width: 80%;
    height:100px;
    display:flex;
    justify-content: space-between;
    margin: 0 auto;
    @include pretty_button(600px,60px);
  }

}

</style>
