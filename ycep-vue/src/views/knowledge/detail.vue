<template>
  <!--  顶部导航栏-->
  <Top />

  <div class="container">
    <div class="main">
      <div class="left">
        <div class="side-block1">
          <img src="../../assets/images/demo/detail1.png" alt="背景图片"/>
        </div>
        <div class="side-block2">
          <p class="title">热门知识点</p>
          <div class="content">
            <div class="item">
              <p>基础电路分析</p>
              <img src="../../assets/images/eye-icon.png" alt="浏览人数">
              <p class="eye">178</p>
            </div>
            <div class="item">
              <p>台式电脑电路连接</p>
              <img src="../../assets/images/eye-icon.png" alt="浏览人数">
              <p class="eye">178</p>
            </div>
            <div class="item">
              <p>静电的产生和“形状”</p>
              <img src="../../assets/images/eye-icon.png" alt="浏览人数">
              <p class="eye">178</p>
            </div>
            <div class="item">
              <p>静电的产生和“形状”</p>
              <img src="../../assets/images/eye-icon.png" alt="浏览人数">
              <p class="eye">178</p>
            </div>
            <div class="item">
              <p>静电的产生和“形状”</p>
              <img src="../../assets/images/eye-icon.png" alt="浏览人数">
              <p class="eye">178</p>
            </div>
            <div class="item">
              <p>静电的产生和“形状”</p>
              <img src="../../assets/images/eye-icon.png" alt="浏览人数">
              <p class="eye">178</p>
            </div>
          </div>
        </div>
      </div>
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
            <div class="content-text" if="knowledge.content">
              <div v-if="active < knowledge.content.length">
                <div class="content-text-words">
                  {{ knowledge.content[active].text }}
                </div>
                <img
                  :src="imgHost + knowledge.content[active].imgSrc"
                  class="content-text-image"
                />
                <div class="content-text-words">
                  {{ knowledge.content[active].text }}
                </div>
              </div>
              <div class="" v-else>
                <div class="game">
                  <div class="game-items">
                    <template class="block-cards">
                      <div
                        class="card"
                        v-for="(item, index) in gameList"
                        :key="item.gameId"
                        @click="toGame(item.gameId, index)"
                      >
                        <div class="card-image">
                          <img :src="imgHost + item.imgSrc" alt="背景图片" />
                        </div>
                        <div class="card-details">
                          <p class="text-title">{{ item.title }}</p>
                          <p class="text-body">{{ item.description }}</p>
                          <el-tag class="text-author"
                            >作者：{{ item.author }}</el-tag
                          >
                        </div>
                        <button class="card-button">游戏</button>
                      </div>
                    </template>
                  </div>

                  <div class="pagination">
                    <el-pagination
                      v-model:currentPage="paginationConfig.currentPage"
                      layout="total, prev, pager, next"
                      :page-size="paginationConfig.pageSize"
                      :total="paginationConfig.total"
                      @current-change="handlePageChange"
                    />
                  </div>
                </div>
              </div>
            </div>
            <el-steps
              :active="active"
              finish-status="success"
              if="knowledge.content"
            >
              <el-step
                v-for="(step, index) in knowledge.content.length"
                :key="index"
              />
            </el-steps>
            <div class="step-btns">
              <el-button class="step-btn" @click="previous">上一页</el-button>
              <el-button class="step-btn" @click="next">下一页</el-button>
            </div>
          </div>
          <br />
        </div>
      </div>
      <div class="right">
        <div class="side-block1">
          <img src="../../assets/images/物理.png" style="margin-top: 20px;" alt="">
        </div>
        <div class="side-block2">
          <p class="title">目录</p>
          <div class="content">
            <div class="item" v-for="plot in knowledge.content">
              <p>{{ plot.text }}</p>
            </div>
          </div>
        </div>
        <div class="side-block2">
          <p class="title">热门游戏</p>
          <div class="content">
            <div class="item">
              <p>静电的产生和“形状”</p>
              <img src="../../assets/images/eye-icon.png" alt="浏览人数">
              <p class="eye">178</p>
            </div>
            <div class="item">
              <p>静电的产生和“形状”</p>
              <img src="../../assets/images/eye-icon.png" alt="浏览人数">
              <p class="eye">178</p>
            </div>
            <div class="item">
              <p>静电的产生和“形状”</p>
              <img src="../../assets/images/eye-icon.png" alt="浏览人数">
              <p class="eye">178</p>
            </div>
            <div class="item">
              <p>静电的产生和“形状”</p>
              <img src="../../assets/images/eye-icon.png" alt="浏览人数">
              <p class="eye">178</p>
            </div>
            <div class="item">
              <p>静电的产生和“形状”</p>
              <img src="../../assets/images/eye-icon.png" alt="浏览人数">
              <p class="eye">178</p>
            </div>
            <div class="item">
              <p>静电的产生和“形状”</p>
              <img src="../../assets/images/eye-icon.png" alt="浏览人数">
              <p class="eye">178</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent, getCurrentInstance } from "vue";
import Top from "../../components/top.vue";
import { getDetail, getGame } from "../../api/knowledge/detail";
import {getKnowledge} from "@/api/knowledge";

export default defineComponent({
  name: "detail",
  data() {
    return {
      imgHost:
        getCurrentInstance()?.appContext.config.globalProperties.$imgHost,
      active: 0,
      hadRead: false,
      id: 0,
      paginationConfig: {
        currentPage: 1, // 当前页码
        pageSize: 4, // 每页显示的条数
        pageCount: 1, //总共有多少页
        total: 10, // 总条数
      },
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
        ],
      },
      gameList: [
        {
          gameId: 1,
          imgSrc: "../../assets/images/灯泡.jpg",
          kindName: "",
          title: "电路排查",
          author: "da",
          description: "家里的灯泡是怎么亮起来的呢？来这里一探究竟吧！",
        },
      ],
      hotKnowledge:[
        '基础电路分析',
        '台式电脑电路连接',
        '静电的形态',
        '高空中的雷电',
        '风力发电',
        '页面设计',
        '简易计算器',
        '简易鞋架建模',
      ],
      hotGames:[
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
      ]
    };
  },
  components: { Top },
  mounted() {
    this.ready();
  },
  methods: {
    ready() {
      let id = this.$route.params.id;
      console.log("id" + this.id);
      this.id = Number(id);
      this.getDetails();
      this.getGames();
    },
    getGames() {
      let that = this;
      getGame(
        this.id,
        this.paginationConfig.currentPage,
        this.paginationConfig.pageSize
      )
        .then((res: any) => {
          console.log("getGame" + res);
          that.gameList = res.data.list;
          that.paginationConfig.total = res.data.total;
        })
        .catch((err: any) => {
          console.log(err);
        });
    },
    getDetails() {
      let that = this;
      getDetail(this.id)
        .then((res: any) => {
          console.log("getKnowledge" + res);
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
    toGame(id: any, index: number) {
      sessionStorage.setItem("gameID", id);
      sessionStorage.setItem("game", JSON.stringify(this.gameList[index]));
      this.$router.push("/game/main/" + id);
    },
    //点击进入知识点详情
    klgDetailBtnClick(id: any) {
      this.$router.push("/knowledge/detail/" + id);
    },
    handlePageChange(val: number) {
      this.paginationConfig.currentPage = val;
      console.log("当前页面数为：" + val);
      this.getGames();
    },
  },
});
</script>

<style lang="scss" scoped>
@import "../../assets/style/css/knowledge/detail.scss";
</style>
