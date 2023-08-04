<template>
  <!--  顶部导航栏-->
  <Top />

  <div class="container">
    <div class="main">
      <div class="left"></div>
      <div class="center">
        <div class="knowledge">
          <div class="title">
            <div class="title">
              <p>{{ knowledge.title }}</p>
            </div>
            <div class="author">
              <p>{{ knowledge.author }}</p>
            </div>
          </div>
          <br />
          <hr />
          <p class="title-tip">前言</p>
          <div class="desc">
            <p>{{ knowledge.desc }}</p>
          </div>
          <p class="title-tip">正文</p>
          <div class="content">
            <div class="content-text">
              <div v-if="active < knowledge.content.length">
                <img
                  :src="knowledge.content[active].imgSrc"
                  class="content-text-image"
                />
                <div class="content-text-words">
                  {{ knowledge.content[active].text }}
                </div>
              </div>
              <div class="" v-else>
                <div class="game">
                  <!-- <p class="title-tip">相关游戏</p> -->
                  <!-- <br />
                  <hr /> -->
                  <div class="game-items">
                    <template class="block-cards">
                      <div
                          class="card"
                          v-for="item in gameList"
                          :key="item.id"
                          @click="toGame(item.id)"
                      >
                        <div class="card-image">
                          <img :src="item.imgSrc" alt="背景图片" />
                        </div>
                        <div class="card-details">
                          <p class="text-title">{{ item.title }}</p>
                          <p class="text-body">{{ item.introduction }}</p>
                          <el-tag class="text-author">作者：{{ item.author }}</el-tag>
                        </div>
                        <button class="card-button">{{ item.kindName }}</button>
                      </div>
                    </template>
                  </div>
                </div>
              </div>
            </div>
            <el-steps :active="active" finish-status="success">
              <el-step
                v-for="(step, index) in knowledge.content.length"
                :key="index"
              />
            </el-steps>
            <el-button style="margin-top: 12px" @click="previous"
              >previous step</el-button
            >
            <el-button style="margin-top: 12px" @click="next"
              >Next step</el-button
            >
          </div>
          <br />
        </div>
      </div>
      <div class="right">
        <!--推荐游戏-->
        <div class="recommend-game" v-for="item in recommendGameList">
          <div class="card" @click="klgDetailBtnClick(item.id)">
            <div class="card-image">
              <img :src="item.imgSrc" alt="背景图片"/>
            </div>
            <div class="card-details">
              <p class="text-title">{{ item.title }}</p>
              <el-tag class="text-author">作者：{{ item.author }}</el-tag>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import Top from "../../components/top.vue";
import { getDetail, getGame } from "../../api/knowledge/detail";

export default defineComponent({
  name: "detail",
  data() {
    return {
      active: 0,
      hadRead: false,
      id: 0,
      knowledge: {
        id: 0,
        title: "Spring Boot 单元测试",
        desc: "Spring Boot 中进行单元测试是一个常见的做法，可以帮助你验证应用程序的各个组件是否按预期工作。所以我们有必要去学习一番！",
        pages: 3,
        author: "冷雪兮",
        content: [
          {
            imgSrc: "/src/assets/images/demo/game1.jpg",
            text: "？🍭 单元测试（unit testing），是指对软🍭件中的最小可测试单元进行检查和验证的过程就叫单元测试。单元测试是开发者编写的一小段代码，用于检验被测代码的⼀个很小的、很明确的（代码）功能是否正确。执行单元测试就是为了证明某段代码的执行结果是否符合我们的预期。如果测试结果符合我们的预期，称之为测试通过，否则就是测试未通过（或者叫测试失败）。",
          },
          {
            imgSrc: "/src/assets/images/demo/game2.jpg",
            text: "一、什么是单元测试？🍭 单元测试（unit testing），是指对软件中的最小可测试单🍭元进🍭行检查和验证的过程就叫单元测试。单元测试是开发者编写的一小段代码，用于检验被测代码的⼀个很小的、很明确的（代码）功能是否正确。执行单元测试就是为了证明某段代码的执行结果是否符合我们的预期。如果测试结果符合我们的预期，称之为测试通过，否则就是测试未通过（或者叫测试失败）。",
          },
          {
            imgSrc: "/src/assets/images/demo/game3.jpg",
            text: "一、什🍭么是🍭单元测试？🍭 单元测试（unit testing），是指🍭对软件中的最小🍭可测试单元🍭进行检查🍭和。单元测试是开发者编写的一小段代码，用于检验被测代码的⼀个很小的、很明确的（代码）功能是否正确。执行单元测试就是为了证明某段代码的执行结果是否符合我们的预期。如果测试结果符合我们的预期，称之为测试通过，否则就是测试未通过（或者叫测试失败）。",
          },
        ],
      },
      gameList: [
        {
          id: 1,
          imgSrc: "/src/assets/images/demo/game1.jpg",
          title: "法庭疑案",
          kind: 2,
          kindName: "材料",
          introduction:
              "放学回家的小军路上做了一件事，竟然犯了法！法官有点发愁！",
          author: "机智的皇冠",
        },
        {
          id: 2,
          imgSrc: "/src/assets/images/demo/game2.jpg",
          title: "电路排查",
          kind: 3,
          kindName: "物理",
          introduction:
              "莉莉在正常工作，办公室的台灯却突然爆炸了！快来帮帮她吧！",
          author: "看手机东方红",
        },
        {
          id: 3,
          imgSrc: "/src/assets/images/demo/game3.jpg",
          title: "三态变化",
          kind: 4,
          kindName: "化学",
          introduction:
              "空气里究竟都有些什么状态的物质呢？小白走在路上发出了这样的疑问。",
          author: "梵蒂冈",
        }
      ],
      recommendGameList:[
        {
          id: 1,
          imgSrc: "/src/assets/images/demo/game1.jpg",
          title: "法庭疑案",
          kind: 2,
          kindName: "材料",
          introduction:
              "放学回家的小军路上做了一件事，竟然犯了法！法官有点发愁！",
          author: "机智的皇冠",
        },
        {
          id: 2,
          imgSrc: "/src/assets/images/demo/game2.jpg",
          title: "电路排查",
          kind: 3,
          kindName: "物理",
          introduction:
              "莉莉在正常工作，办公室的台灯却突然爆炸了！快来帮帮她吧！",
          author: "看手机东方红",
        },
        {
          id: 3,
          imgSrc: "/src/assets/images/demo/game3.jpg",
          title: "三态变化",
          kind: 4,
          kindName: "化学",
          introduction:
              "空气里究竟都有些什么状态的物质呢？小白走在路上发出了这样的疑问。",
          author: "梵蒂冈",
        },
        {
          id: 4,
          imgSrc: "/src/assets/images/demo/game1.jpg",
          title: "法庭疑案",
          kind: 2,
          kindName: "材料",
          introduction:
              "放学回家的小军路上做了一件事，竟然犯了法！法官有点发愁！",
          author: "机智的皇冠",
        },
        {
          id: 5,
          imgSrc: "/src/assets/images/demo/game2.jpg",
          title: "电路排查",
          kind: 3,
          kindName: "物理",
          introduction:
              "莉莉在正常工作，办公室的台灯却突然爆炸了！快来帮帮她吧！",
          author: "看手机东方红",
        },
        {
          id: 6,
          imgSrc: "/src/assets/images/demo/game3.jpg",
          title: "三态变化",
          kind: 4,
          kindName: "化学",
          introduction:
              "空气里究竟都有些什么状态的物质呢？小白走在路上发出了这样的疑问。",
          author: "梵蒂冈",
        }
      ],
    };
  },
  components: { Top },
  mounted() {
    this.ready();
  },
  methods: {
    ready() {
      let id = this.$route.params.id;
      this.id = Number(id);
      this.getDetails();
      this.getGames();
    },
    getGames() {
      let that = this;
      getGame(this.id)
        .then((res: any) => {
          console.log(res);
          that.gameList = res.data;
        })
        .catch((err: any) => {
          console.log(err);
        });
    },
    getDetails() {
      let that = this;
      getDetail(this.id)
        .then((res: any) => {
          console.log(res);
          that.knowledge = res.data;
        })
        .catch((err: any) => {
          console.log(err);
        });
    },
    next() {
      if (this.active < this.knowledge.content.length) this.active++;
      console.log(this.active);
    },
    previous() {
      if (this.active > 0) this.active--;
    },
    //进入游戏
    toGame(id: any) {
      this.$router.push("/game/main/" + id);
    },
    //点击进入知识点详情
    klgDetailBtnClick(id: any) {
      this.$router.push("/knowledge/detail/" + id);
    },
  },
});
</script>

<style lang="scss" scoped>
@import "../../assets/style/css/knowledge/detail.scss";
</style>
