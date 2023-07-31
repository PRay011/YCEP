<template>
  <!--  顶部导航栏-->
  <Top/>
  <div class="container">
    <div class="main">
      <div class="game-main" id="game_main">
        <el-button
          @click="toggleScreen"
          type="primary"
          class="fullScreen"
        ></el-button>

        <div class="play-btn" v-if="!playing" @click="startGame()">
          <img src="../../assets/images/bgi.jpg" alt="播放按钮" />
          <div class="mask"></div>
        </div>
        <div class="choose-mode" v-if="isPlayed">
          <div class="choose-title">请选择游戏模式</div>
          <div class="choose-buttons">
            <button class="button" @click="singerMode()">单机模式</button>
            <button class="button" @click="onLineMode()">联机模式</button>
          </div>
        </div>
        <div class="choose-character" v-if="isCharacter">
          <div class="character" v-for="character in characters" :key="character.id">
            <img :src="character.image" class="character-image"/><br>
            <div class="character-name">{{ character.name }}</div>
          </div>
        </div>
      </div>
      <div class="game-actions">
        <button class="button">重新开始</button>
        <button class="button">结束游戏</button>
      </div>
      <div class="game-info">

      </div>

    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import screenfull from "screenfull";
import Top from "../../components/top.vue";
import image1 from '../../assets/images/氧气.jpg'

export default defineComponent({
  name: "main",
  data() {
    return {
      data: "",
      isFullscreen: false,
      game: {
        id: 1,
        title: "",
      },
      characters: [
        {
          id:0,
          name: "马越",
          image: image1,
        },
        {
          id:1,
          name: "越越",
          image: image1,
        },
      ],
      isPlayed: false,
      playing: false,
      //游戏模式：0为单机，1为联机
      chosenMode: 0,
      isCharacter: false,
      chosenCharacter: 0,
    };
  },
  components: { Top },
  mounted() {},
  methods: {
    ready() {},
    startGame() {
      this.playing = true;
      this.isPlayed = true;
    },
    singerMode() {
      this.chosenMode = 0;
      this.isPlayed = false;
      this.isCharacter = true;
    },
    onLineMode() {
      this.chosenMode = 0;
      this.isPlayed = false;
      this.isCharacter = true;
    },
    toggleScreen() {
      const element = document.getElementById("game_main")!;
      if (screenfull.isEnabled) {
        // screenfull提供放大的方法
        screenfull.toggle(element);
      }
    },
    getImageUrl(name:string) {
      return new URL(`${name}`, import.meta.url).href
    }
  },
});
</script>

<style lang="scss" scoped>
@import "../../assets/style/css/game/main.scss";
</style>
