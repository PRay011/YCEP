<template>
  <!--  顶部导航栏-->
  <Top/>

  <div class="container">

    <div class="main">
      <div class="left">

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
          <br/>
          <hr/>
          <p class="title-tip">前言</p>
          <div class="desc">
            <p>{{ knowledge.desc }}</p>
          </div>
          <p class="title-tip">正文</p>
          <div class="content">
            <p>{{ knowledge.content }}</p>
          </div>
          <br/>
          <div class="buttons">
            <button @click="hadRead=true">
              <span>完成阅读</span>
              <svg width="34" height="34" viewBox="0 0 74 74" fill="none" xmlns="http://www.w3.org/2000/svg">
                <circle cx="37" cy="37" r="35.5" stroke="black" stroke-width="3"></circle>
                <path d="M25 35.5C24.1716 35.5 23.5 36.1716 23.5 37C23.5 37.8284 24.1716 38.5 25 38.5V35.5ZM49.0607 38.0607C49.6464 37.4749 49.6464 36.5251 49.0607 35.9393L39.5147 26.3934C38.9289 25.8076 37.9792 25.8076 37.3934 26.3934C36.8076 26.9792 36.8076 27.9289 37.3934 28.5147L45.8787 37L37.3934 45.4853C36.8076 46.0711 36.8076 47.0208 37.3934 47.6066C37.9792 48.1924 38.9289 48.1924 39.5147 47.6066L49.0607 38.0607ZM25 38.5L48 38.5V35.5L25 35.5V38.5Z" fill="black"></path>
              </svg>
            </button>
          </div>
        </div>
        <div class="game" v-if="hadRead">
          <p class="title-tip">相关游戏</p>
          <br/>
          <hr/>
          <div class="game-items">
            <template class="block-cards">
              <div class="card" v-for="item in gameList">
                <div class="card-details">
                  <div class="card-image">
                    <img src="../../assets/images/灯泡.jpg" alt="背景图片">
                  </div>
                  <p class="text-title">{{ item.title }}</p>
                  <p class="text-body">{{ item.body }}</p>
                </div>
                <button class="card-button" @click="toGame(item.id)">进入游戏</button>
              </div>
            </template>
          </div>

        </div>


      </div>
      <div class="right">

      </div>
    </div>
  </div>

</template>

<script lang="ts">
import {defineComponent} from "vue";
import Top from "../../components/top.vue";

export default defineComponent({
  name: "detail",
  data() {
    return {
      data: "",
      hadRead:false,
      id: 0,
      knowledge: {
        id: 0,
        title: 'Spring Boot 单元测试',
        desc: 'Spring Boot 中进行单元测试是一个常见的做法，可以帮助你验证应用程序的各个组件是否按预期工作。所以我们有必要去学习一番！',
        content: '一、什么是单元测试？🍭 单元测试（unit testing），是指对软件中的最小可测试单元进行检查和验证的过程就叫单元测试。单元测试是开发者编写的一小段代码，用于检验被测代码的⼀个很小的、很明确的（代码）功能是否正确。执行单元测试就是为了证明某段代码的执行结果是否符合我们的预期。如果测试结果符合我们的预期，称之为测试通过，否则就是测试未通过（或者叫测试失败）。' +
            '一、什么是单元测试？🍭 单元测试（unit testing），是指对软件中的最小可测试单元进行检查和验证的过程就叫单元测试。单元测试是开发者编写的一小段代码，用于检验被测代码的⼀个很小的、很明确的（代码）功能是否正确。执行单元测试就是为了证明某段代码的执行结果是否符合我们的预期。如果测试结果符合我们的预期，称之为测试通过，否则就是测试未通过（或者叫测试失败）。' +
            '一、什么是单元测试？🍭 单元测试（unit testing），是指对软件中的最小可测试单元进行检查和验证的过程就叫单元测试。单元测试是开发者编写的一小段代码，用于检验被测代码的⼀个很小的、很明确的（代码）功能是否正确。执行单元测试就是为了证明某段代码的执行结果是否符合我们的预期。如果测试结果符合我们的预期，称之为测试通过，否则就是测试未通过（或者叫测试失败）。' +
            '一、什么是单元测试？🍭 单元测试（unit testing），是指对软件中的最小可测试单元进行检查和验证的过程就叫单元测试。单元测试是开发者编写的一小段代码，用于检验被测代码的⼀个很小的、很明确的（代码）功能是否正确。执行单元测试就是为了证明某段代码的执行结果是否符合我们的预期。如果测试结果符合我们的预期，称之为测试通过，否则就是测试未通过（或者叫测试失败）。' +
            '一、什么是单元测试？🍭 单元测试（unit testing），是指对软件中的最小可测试单元进行检查和验证的过程就叫单元测试。单元测试是开发者编写的一小段代码，用于检验被测代码的⼀个很小的、很明确的（代码）功能是否正确。执行单元测试就是为了证明某段代码的执行结果是否符合我们的预期。如果测试结果符合我们的预期，称之为测试通过，否则就是测试未通过（或者叫测试失败）。',
        author: '冷雪兮',
      },
      gameList: [
        {
          id:1,
          imgSrc: '../../assets/images/灯泡.jpg',
          title: '电路排查',
          kind: 3,
          body: '家里的灯泡是怎么亮起来的呢？来这里一探究竟吧！',
        },
        {
          id:1,
          imgSrc: '../../assets/images/灯泡.jpg',
          title: '电路排查',
          kind: 3,
          body: '家里的灯泡是怎么亮起来的呢？来这里一探究竟吧！',
        },
        {
          id:1,
          imgSrc: '../../assets/images/灯泡.jpg',
          title: '电路排查',
          kind: 3,
          body: '家里的灯泡是怎么亮起来的呢？来这里一探究竟吧！',
        },
        {
          id:1,
          imgSrc: '../../assets/images/灯泡.jpg',
          title: '电路排查',
          kind: 3,
          body: '家里的灯泡是怎么亮起来的呢？来这里一探究竟吧！',
        }
      ],
    };
  },
  components: {Top},
  mounted() {
    this.ready();
  },
  methods: {
    ready() {
      let id = this.$route.params.id;
      this.id = id;
      console.log("id: " + id);
    },
    //进入游戏
    toGame(id:any) {
      this.$router.push('/game/main/' + id);
    }
  },
});
</script>

<style lang="scss" scoped>
@import "../../assets/style/css/knowledge/detail.scss";
</style>
