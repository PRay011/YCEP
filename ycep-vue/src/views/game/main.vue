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
          background: `url(${imgHost + background})`,

          'background-size': 'cover',
        }"
      >
        <el-icon class="fullScreen" @click="toggleScreen">
          <FullScreen />
        </el-icon>
        <el-icon class="chatRoom" @click="chatRoom">
          <ChatDotRound />
        </el-icon>
        <el-icon class="exitGame" @click="exitGame">
          <CircleClose />
        </el-icon>

        <div class="play-btn" v-if="!playing" @click="startGame()">
          <img src="../../assets/images/play_btn.png" alt="播放按钮" />
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
            @click="characterChosen(index)"
          >
            <img
              :src="imgHost + character.imgSrc"
              class="character-image"
            /><br />
            <div class="character-name">{{ character.name }}</div>
            <div class="character-confirm" v-if="isCharacterConfirm">
              <button class="selectButton" @click.stop="reChooseCharacter">
                重选
              </button>
              <button class="selectButton" @click.stop="confirmChooseCharacter">
                确认
              </button>
            </div>
          </div>
        </div>
        <div
          class="chatCharacter"
          v-if="isGame"
        ></div>
        <div class="chatBox" v-if="isGame">
          <div class="chat-content">{{ data }}</div>
          <button class="chat-page-previous" @click="previousPage()">
            上一页
          </button>
          <button class="chat-page-next" @click="nextPage()">下一页</button>
        </div>
        <div class="interaction" v-if="isInteracted">
          <div
            :class="{
              choice: true,
              active: choice.active,
              hide: choice.hide,
            }"
            v-for="(choice, index) in choices"
            :key="index"
            @click="choiceChosen(index)"
          >
            <img :src="imgHost + choice.imgSrc" class="choice-image" /><br />
            <div class="choice-name" v-if="choice.active">
              {{ choice.description }}
            </div>
            <div class="choice-name" v-else>{{ choice.name }}</div>
            <div class="choice-confirm" v-if="isChoiceConfirm">
              <button class="selectButton" @click.stop="reChooseChoice">
                重选
              </button>
              <button class="selectButton" @click.stop="confirmChooseChoice">
                确认
              </button>
            </div>
          </div>
        </div>
      </div>
      <div class="game-actions">
        <button class="button" @click="again()">重新开始</button>
        <button class="button" @click="key()">关键剧情</button>
        <button class="button" @click="end()">结束游戏</button>
      </div>
      <div class="game-info">
        <div class="title">
          <p class="text1">{{ game.title }}</p>
          <el-tag>{{ game.author }}</el-tag>
        </div>
        <hr />
        <div class="desc">
          <p class="text2">&emsp;&emsp;{{ game.description }}</p>
        </div>
        <div class="images">
          <div class="image">
            <img :src="imgHost + game.imgSrc" alt="游戏图片" />
          </div>
          <div class="image">
            <img :src="imgHost + plot.imgSrc" alt="游戏图片" />
          </div>
          <div class="image" v-for="imgSrc in gameDetailImgSrc">
            <img :src="imgSrc" alt="游戏图片" />
          </div>
        </div>
      </div>
    </div>
    <div class="mask" v-if="showChatAndSort"></div>
    <div class="key-plot" v-if="showChatAndSort">
      <el-icon class="closeBtn" @click="closeKeyClick" size="30"
        ><Close
      /></el-icon>
      <div class="chat">
        <div class="chat-card">
          <div class="chat-header">
            <div class="h2">聊天室</div>
          </div>
          <el-scrollbar height="450px">
            <div class="chat-body">
              <template v-for="conversation in conversations">
                <div class="message outgoing">
                  <p>{{ conversation.my }}</p>
                </div>
                <div class="message incoming">
                  <p>{{ conversation.other }}</p>
                </div>
              </template>
            </div>
          </el-scrollbar>
          <div class="chat-footer">
            <input placeholder="请输入..." type="text" v-model="sendMessage" />
            <button @click="sendMyMessage">发送</button>
          </div>
        </div>
      </div>
      <div class="sort">
        <div class="sort-card">
          <div class="title">
            <p>游戏步骤排序</p>
          </div>
          <div class="content">
            <VueDraggableNext v-model="sortList" @start="onStart" @end="onEnd">
              <transition-group>
                <div
                  class="item"
                  v-for="(item, index) in sortList"
                  :key="index"
                >
                  <p class="item-text">{{ item.index }}：{{ item.text }}</p>
                </div>
              </transition-group>
            </VueDraggableNext>
          </div>
          <div class="confirmSortBtn">
            <button @click="confirmSortClick">确认排序</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent, getCurrentInstance } from "vue";
import screenfull from "screenfull";
import { VueDraggableNext } from "vue-draggable-next";
import Top from "../../components/top.vue";
import image1 from "../../assets/images/氧气.jpg";
import image2 from "../../assets/images/宇宙.jpg";
import backImage1 from "../../assets/images/gameBack.jpg";
// import { fa } from "element-plus/es/locale/index.js";
import type interactionVue from "./interaction.vue";
import {
  getStartPlot,
  getCharacter,
  getInteraction,
  postInteraction,
} from "../../api/game/main";
import { ElMessage } from "element-plus";

export default defineComponent({
  name: "main",
  data() {
    return {
      imgHost:
        getCurrentInstance()?.appContext.config.globalProperties.$imgHost,
      gameID: 0,
      myCharacter: {
        id: 0,
        imgSrc: image1,
      },
      gameDetailImgSrc: [
        "/src/assets/images/demo/gamedetail1.jpg",
        "/src/assets/images/demo/gamedetail2.jpg",
        "/src/assets/images/demo/gamedetail3.jpg",
      ],
      //单页剧情
      data: "",
      // 用于存放剧情
      plot: {
        imgSrc: "default.jpg",
        content: [
          {
            text: "asjhdfuiashdasiofhnasiofjsaofjasi9of",
          },
          {
            text: "全流程，初步结果显示并没有出现超导现象。该实验采用了多种方法，包括合成前驱物、抽真空、烧结等，但结果与韩国团队的研究中有所不同。孙悦教授表示对于韩国新研究的持「怀疑态度」，但他团队的实验结果仍需要更多的验证和研究。",
          },
          {
            text: "社交赛道。据消息人士透露，产品或于8月份对外开启测试。这是腾讯时隔两年，再度研发的一款重量级别的社交产品。（Tech星球）",
          },
        ],
      },
      plotRecord: [
        {
          imgSrc: "default.jpg",
          content: [
            {
              text: "asjhdfuiashdasiofhnasiofjsaofjasi9of",
            },
            {
              text: "南大学教授孙悦展示了一组由孙悦教授和施智祥教授团队复现的常温常压超导全流程，初步结果显示并没有出现超导现象。该实验采用了多种方法，包括合成前驱物、抽真空、烧结等，但结果与韩国团队的研究中有所不同。孙悦教授表示对于韩国新研究的持「怀疑态度」，但他团队的实验结果仍需要更多的验证和研究。",
            },
            {
              text: "腾讯内部正在研发一款名为“M8”的社交APP，由QQ团队打造，定位是基于地图的虚拟社交产品，主攻年轻人社交赛道。据消息人士透露，产品或于8月份对外开启测试。这是腾讯时隔两年，再度研发的一款重量级别的社交产品。（Tech星球）",
            },
          ],
        },
        {
          imgSrc: backImage1,
          content: [
            {
              text: "asjhdfuiashdasiofhnasiofjsaofjasi9of",
            },
            {
              text: "全流程，初步结果显示并没有出现超导现象。该实验采用了多种方法，包括合成前驱物、抽真空、烧结等，但结果与韩国团队的研究中有所不同。孙悦教授表示对于韩国新研究的持「怀疑态度」，但他团队的实验结果仍需要更多的验证和研究。",
            },
            {
              text: "社交赛道。据消息人士透露，产品或于8月份对外开启测试。这是腾讯时隔两年，再度研发的一款重量级别的社交产品。（Tech星球）",
            },
          ],
        },
      ],
      //是否结束
      isFinished: false,
      //当前页数
      currentPage: {
        plot: 0,
        page: 0,
      },
      //全屏
      isFullscreen: false,
      loading: false,
      background: "default.jpg",
      game: {
        gameId: 1,
        imgSrc: "/src/assets/images/demo/game1.jpg",
        kindName: "",
        title: "电路排查",
        author: "da",
        description: "家里的灯泡是怎么亮起来的呢？来这里一探究竟吧！",
      },
      //可选角色
      characters: [
        {
          id: 0,
          name: "马越",
          imgSrc: image1,
          active: false,
          hide: false,
        },
        {
          id: 1,
          name: "越越",
          imgSrc: image2,
          active: false,
          hide: false,
        },
      ],
      choices: [
        {
          id: 0,
          name: "马越",
          imgSrc: image1,
          description: "",
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
      //交互
      //这里是下一次要进行的交互
      interactionNumber: 1,
      interactionID: 0,
      isInteracting: false,
      isInteracted: false,
      isChoiceConfirm: false,

      //聊天和排序
      showChatAndSort: false,
      conversations: [
        {
          my: "你们掌握了什么数据都？",
          other: "摄像头看不了录像，监控坏了！",
        },
        {
          my: "啊，那这条路就找不到嫌疑人了...我这边看到了卫生间的电线了，从这入手试试",
          other: "嗯嗯，我们先把电路连一下！",
        },
        {
          my: "这应该是个并联电路吧！房间好多",
          other: "是的，我看看，应该是这样连...",
        },
        {
          my: "好棒！那这个排序题，我试试23145",
          other: "好的...怎么样，对了吗？",
        },
        {
          my: "不太对...你试试",
          other: "好...欸23154对了！",
        },
        {
          my: "太棒了！",
          other: "哈哈哈哈哈通关！",
        },
      ],
      sendMessage: "",
      sortList: [
        { index: 1, correctIndex: 3, text: "连接宝石博物馆的电路图" },
        { index: 2, correctIndex: 1, text: "“海洋之心”宝石失窃" },
        { index: 3, correctIndex: 2, text: "修好厕所门口裸露的电线" },
        { index: 4, correctIndex: 5, text: "抓到嫌疑人老李" },
        { index: 5, correctIndex: 4, text: "推断偷盗者对供电室厕所进行短接" },
      ],
      userSortList: [],
    };
  },
  components: { Top, VueDraggableNext },
  mounted() {
    this.ready();
  },
  methods: {
    ready() {
      let gameID = sessionStorage.getItem("gameID");
      this.gameID = Number(gameID);
      let gameStr = sessionStorage.getItem("game");
      if (gameStr != null) {
        this.game = JSON.parse(gameStr);
      }
      // console.log(this.game);
    },
    startGame() {
      this.playing = true;
      this.isPlayed = true;
      this.character();
    },
    again() {
      this.playing = false;
      this.isPlayed = false;
      this.isCharacter = false;
      this.isCharacterConfirm = false;
      this.isGame = false;
      (this.isInteracting = false), (this.isInteracted = false);
      this.isChoiceConfirm = false;
      this.background = "default.jpg";
      this.currentPage.page = 0;
      this.currentPage.plot = 0;
      this.interactionNumber = 1;
      this.interactionID = 0;
    },
    singerMode() {
      this.chosenMode = 0;
      this.isPlayed = false;
      this.isCharacter = true;
    },
    onLineMode() {
      this.chosenMode = 1;
      this.isPlayed = false;
      this.isCharacter = true;
    },
    toggleScreen() {
      const element = document.getElementById("game_main")!;
      if (screenfull.isEnabled) {
        // screenfull提供放大的方法
        screenfull.toggle(element);
      }
      if (this.isFullscreen) {
        this.isFullscreen = false;
      } else {
        this.isFullscreen = true;
      }
    },
    //卡片移动
    //角色卡片
    characterChosen(index: any) {
      //卡片按钮显示
      this.isCharacterConfirm = true;
      this.characters.forEach((character, i) => {
        character.active = i === index;
        if (!character.active) {
          character.hide = true;
        } else {
          this.myCharacter.id = character.id;
          this.myCharacter.imgSrc = character.imgSrc;
        }
      });
    },
    //选项卡片
    choiceChosen(index: any) {
      //卡片按钮显示
      this.isChoiceConfirm = true;
      this.choices.forEach((choice, i) => {
        choice.active = i === index;
        if (!choice.active) {
          choice.hide = true;
        } else {
          this.interactionID = choice.id;
        }
      });
    },
    //重新选择
    reChooseCharacter(event: any) {
      event.stopPropagation();
      this.characters.forEach((character, i) => {
        character.active = false;
        character.hide = false;
      });
      //按钮消失
      this.isCharacterConfirm = false;
    },
    reChooseChoice(event: any) {
      event.stopPropagation();
      this.choices.forEach((choice, i) => {
        choice.active = false;
        choice.hide = false;
      });
      //按钮消失
      this.isChoiceConfirm = false;
    },
    //确认选择
    //角色
    confirmChooseCharacter(event: any) {
      event.stopPropagation();
      //选完人物之后就获取剧情
      this.loading = true;
      this.startPlot();
      setTimeout(() => {
        this.loading = false;
      }, 1000);
    },
    //交互
    confirmChooseChoice(event: any) {
      event.stopPropagation();
      this.loading = true;
      this.finishInteraction();
      setTimeout(() => {
        this.loading = false;
      }, 1000);
    },
    chatRoom() {
      // this.$router.push("/game/room");
    },
    exitGame() {
      this.again();
    },
    // 翻页
    previousPage() {
      //判断是不是第一页，是就查看前面一个plot
      if (this.currentPage.page) {
        console.log("previous");
        let page = --this.currentPage.page;
        this.data = this.plotRecord[this.currentPage.plot].content[page].text;
      } else {
        if (this.currentPage.plot) {
          let plot = --this.currentPage.plot;
          this.background = this.plotRecord[plot].imgSrc;
          this.currentPage.page = this.plotRecord[plot].content.length;
          this.previousPage();
        } else {
          console.log("最后一页");
        }
      }
    },
    nextPage() {
      let page = this.currentPage.page;
      console.log(this.plotRecord[this.currentPage.plot].content.length);
      if (page < this.plotRecord[this.currentPage.plot].content.length - 1) {
        console.log("next");
        page = ++this.currentPage.page;
        this.data = this.plotRecord[this.currentPage.plot].content[page].text;
      } else {
        if (this.currentPage.plot < this.plotRecord.length - 1) {
          let plot = ++this.currentPage.plot;
          this.background = this.plotRecord[plot].imgSrc;
          this.currentPage.page = -1;
          this.nextPage();
        } else {
          if (this.isFinished) {
            // this.showChatAndSort = true;
            if (this.isFullscreen) {
              this.toggleScreen();
            }
            this.key();
          } else {
            if (!this.isInteracting) {
              //避免连续点击两次交互
              this.isInteracting = true;
              this.getInteraction();
            } else {
              console.log("交互中");
            }
          }
        }
      }
    },
    character() {
      let that = this;
      getCharacter(that.gameID)
        .then((res: any) => {
          console.log("character");
          that.characters = res.data;
          that.characters.forEach((character, i) => {
            character.active = false;
            character.hide = false;
          });
        })
        .catch((err: any) => {
          console.log(err);
        });
    },
    startPlot() {
      let that = this;
      console.log(that.myCharacter.id);
      getStartPlot(that.gameID, that.myCharacter.id)
        .then((res: any) => {
          console.log(res);
          that.isFinished = res.data.isFinished;
          let plot = res.data.plot;
          that.plotRecord = [];
          let first = that.plotRecord.length;
          // that.plotRecord.push(plot);
          res.data.plot.forEach((plot: any, i: any) => {
            that.plotRecord.push(plot);
          });
          //获取背景图片和剧情
          that.background = this.plotRecord[first].imgSrc;
          that.data = this.plotRecord[first].content[0].text;
          that.isCharacter = false;
          that.isGame = true;
        })
        .catch((err: any) => {
          console.log(err);
        });
    },
    interaction() {
      let that = this;
      getInteraction(that.gameID, that.myCharacter.id, that.interactionNumber)
        .then((res: any) => {
          console.log(res);
          that.isInteracted = true;
          that.choices = [];
          that.choices = res.data;
          that.choices.forEach((choice, i) => {
            choice.active = false;
            choice.hide = false;
          });
        })
        .catch((err: any) => {
          console.log(err);
        });
    },
    finishInteraction() {
      let that = this;
      postInteraction(
        that.gameID,
        that.myCharacter.id,
        that.interactionNumber,
        that.interactionID
      )
        .then((res: any) => {
          console.log("finish");
          console.log(res);
          that.isFinished = res.data.isFinished;
          that.interactionNumber++;
          let next = that.plotRecord.length;
          //获取后续背景图片和剧情
          // that.plotRecord.push(plot);
          res.data.plot.forEach((plot: any, i: any) => {
            that.plotRecord.push(plot);
          });
          that.isInteracted = false;
          that.isChoiceConfirm = false;
          that.isInteracting = false;
          that.choices.forEach((choice, i) => {
            choice.active = false;
            choice.hide = false;
          });
          //获取新添加的部分
          that.background = this.plotRecord[next].imgSrc;
          that.data = this.plotRecord[next].content[0].text;
          //改变currentPage
          that.currentPage.page = 0;
          that.currentPage.plot++;
        })
        .catch((err: any) => {
          console.log(err);
        });
    },
    getInteraction() {
      this.interaction();
    },
    //聊天和排序
    key() {
      //开启关键剧情遮罩层
      this.showChatAndSort = true;
    },
    closeKeyClick() {
      //关闭关键剧情遮罩层
      this.showChatAndSort = false;
    },
    //用户发送信息
    sendMyMessage() {
      this.conversations.push({
        my: this.sendMessage,
        other: "你说你说，我听着呢！",
      });
      this.sendMessage = "";
    },
    //游戏步骤排序
    //开始拖拽事件
    onStart(e) {
      // console.log(e);
    },
    //拖拽结束事件
    onEnd(e) {
      // 这里将会有调整前后的 index 及其他可能需要传递给接口的信息
      // console.log(e);
    },
    confirmSortClick() {
      for (let i = 0; i < this.sortList.length; i++) {
        this.userSortList.push({
          index: this.sortList[i].index,
          userIndex: i + 1,
        });
      }
      console.log("sortList:", this.sortList);
      console.log("userSortList:", this.userSortList);
      let isAllCorrect = true;
      //判断答题情况
      let length = this.sortList.length;
      for (let index = 1; index < length + 1; index++) {
        for (let i = 0; i < length; i++) {
          if (this.sortList[i].index == index) {
            for (let j = 0; j < this.userSortList.length; j++) {
              if (this.userSortList[j].index == index) {
                if (
                  this.sortList[i].correctIndex ==
                  this.userSortList[j].userIndex
                ) {
                  console.log("第" + (i + 1) + "题写对了");
                } else {
                  console.log("第" + (i + 1) + "题写错了");
                  isAllCorrect = false;
                  break;
                }
              }
            }
          }
        }
      }
      if (isAllCorrect) {
        ElMessage({
          message: "恭喜你，通过排序测试！点击结束游戏来进行巩固练习吧!",
          type: "success",
        });
      } else {
        this.userSortList = [];
        ElMessage({
          message: "很遗憾，答错了，再试一次吧！",
          type: "error",
        });
      }
    },
    //结束游戏
    end() {
      this.$router.push("/game/review");
    },
  },
});
</script>

<style lang="scss" scoped>
@import "../../assets/style/css/game/main.scss";
</style>
