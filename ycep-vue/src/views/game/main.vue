<template>
  <!--  顶部导航栏-->
  <Top />
  <div class="container">
    <div class="main">
      <div
        class="game-main"
        id="game_main"
        v-loading="loading"
        :style="{
          background: `url(${background})`,
          'background-size': 'cover',
        }"
      >
        <el-icon class="fullScreen" @click="toggleScreen"
          ><FullScreen
        /></el-icon>
        <el-icon class="chatRoom" @click="chatRoom"><ChatDotRound /></el-icon>
        <el-icon class="exitGame" @click="exitGame"><CircleClose /></el-icon>

        <div class="play-btn" v-if="!playing" @click="startGame()">
          <img src="../../assets/images/play_btn.png" alt="播放按钮" />
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
          <div
            :class="{
              character: true,
              active: character.active,
              hide: character.hide,
            }"
            v-for="(character, index) in characters"
            :key="index"
            @click="toggleCard(index)"
          >
            <img :src="character.image" class="character-image" /><br />
            <div class="character-name">{{ character.name }}</div>
            <div class="character-confirm" v-if="isCharacterConfirm">
              <button class="selectButton" @click.stop="reChoose">重选</button>
              <button class="selectButton" @click.stop="confirmChoose">
                确认
              </button>
            </div>
          </div>
        </div>
        <div
          class="chatCharacter"
          v-if="isGame"
          :style="{
            background: `url(${myCharacter})`,
            'background-size': 'cover',
          }"
        ></div>
        <div class="chatBox" v-if="isGame">
          <div class="chat-content">{{ data }}</div>
          <button class="chat-page-previous" @click="previousPage()">
            上一页
          </button>
          <button class="chat-page-next" @click="nextPage()">下一页</button>
        </div>
      </div>
      <div class="game-actions">
        <button class="button" @click="again()">重新开始</button>
        <button class="button" @click="end()">结束游戏</button>
      </div>
      <div class="game-info"></div>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import screenfull from "screenfull";
import Top from "../../components/top.vue";
import image1 from "../../assets/images/氧气.jpg";
import image2 from "../../assets/images/宇宙.jpg";
import backImage1 from "../../assets/images/gameBack.jpg";
import defaultImage from "../../assets/images/default.jpg";

export default defineComponent({
  name: "main",
  data() {
    return {
      data: "",
      // 用于存放剧情
      plot: [
        {
          content: "asjhdfuiashdasiofhnasiofjsaofjasi9of",
        },
        {
          content:
            "南大学教授孙悦展示了一组由孙悦教授和施智祥教授团队复现的常温常压超导全流程，初步结果显示并没有出现超导现象。该实验采用了多种方法，包括合成前驱物、抽真空、烧结等，但结果与韩国团队的研究中有所不同。孙悦教授表示对于韩国新研究的持「怀疑态度」，但他团队的实验结果仍需要更多的验证和研究。",
        },
        {
          content:
            "腾讯内部正在研发一款名为“M8”的社交APP，由QQ团队打造，定位是基于地图的虚拟社交产品，主攻年轻人社交赛道。据消息人士透露，产品或于8月份对外开启测试。这是腾讯时隔两年，再度研发的一款重量级别的社交产品。（Tech星球）",
        },
      ],
      //当前页数
      currentPage: 0,
      pageNumber: 3,
      //全屏
      isFullscreen: false,
      loading: false,
      background: defaultImage,
      myCharacter: "",
      game: {
        id: 1,
        title: "",
      },
      characters: [
        {
          id: 0,
          name: "马越",
          image: image1,
          active: false,
          hide: false,
        },
        {
          id: 1,
          name: "越越",
          image: image2,
          active: false,
          hide: false,
        },
      ],
      isPlayed: false,
      playing: false,
      //游戏模式：0为单机，1为联机
      chosenMode: 0,
      //选择的角色
      chosenCharacter: 0,
      isCharacter: false,
      isCharacterConfirm: false,
      isGame: false,
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
    again() {
      this.playing = false;
      this.isPlayed = false;
      this.isCharacter = false;
    },
    singerMode() {
      this.chosenMode = 0;
      this.myCharacter = image1;
      this.isPlayed = false;
      this.isCharacter = true;
    },
    onLineMode() {
      this.chosenMode = 1;
      this.myCharacter = image1;
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
    //卡片移动
    toggleCard(index: any) {
      //卡片按钮显示
      this.isCharacterConfirm = true;
      this.characters.forEach((card, i) => {
        card.active = i === index;
        if (!card.active) {
          card.hide = true;
        }
      });
    },
    reChoose(event: any) {
      event.stopPropagation();
      this.characters.forEach((card, i) => {
        card.active = false;
        card.hide = false;
      });
      //按钮消失
      this.isCharacterConfirm = false;
    },
    //确认选择
    confirmChoose(event: any) {
      event.stopPropagation();
      this.loading = true;
      setTimeout(() => {
        this.loading = false;
        this.background = backImage1;
        this.data = this.plot[0].content;
        this.isGame = true;
      }, 1000);
      this.isCharacter = false;
    },
    chatRoom() {
      this.$router.push("/game/room");
    },
    exitGame() {},
    // 翻页
    previousPage() {
      if (this.currentPage) {
        let page = --this.currentPage;
        this.data = this.plot[page].content;
      } else {
        alert("已经是第一页了");
      }
    },
    nextPage() {
      console.log("in");
      let page = this.currentPage;
      if (page < this.pageNumber) {
        page = ++this.currentPage;
        this.data = this.plot[page].content;
      } else {
      }
    },
    end() {
      this.$router.push("/game/review")
    },
  },
});
</script>

<style lang="scss" scoped>
@import "../../assets/style/css/game/main.scss";
</style>
