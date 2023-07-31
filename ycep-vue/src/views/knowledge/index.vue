<template>
  <!--  顶部导航栏-->
  <Top/>

  <div class="container">
    <div class="main">
      <!-- 顶部轮播图 -->
      <div class="title-block">
        <el-carousel height="250px" type="card" indicator-position="outside" :interval="10000">
          <el-carousel-item v-for="item in imageList" :key="item">
            <img :src="item" alt="轮播图">
<!--            <h3 class="small">{{ item }}</h3>-->
          </el-carousel-item>
        </el-carousel>
      </div>

      <div class="body">
<!--        <div class="left">-->

<!--        </div>-->
        <div class="right">

          <!--知识点推荐（可左右翻页）-->
          <template class="block">
            <div class="block-title">您可能 感兴趣的知识</div>
            <div class="block-main">
              <div class="item1">
                <div class="image">
                  <img src="../../assets/images/宇宙.jpg" alt="知识点图片">
                </div>
                <div class="cover">
                  <p class="p1">趣味物理</p>
                  <p class="p2">太阳系中有多少行星？</p>
                </div>
              </div>
              <div class="item1">
                <div class="image">
                  <img src="../../assets/images/氧气.jpg" alt="知识点图片">
                </div>
                <div class="cover">
                  <p class="p1">微观化学</p>
                  <p class="p2">生活中的氧气是怎么来的？</p>
                </div>
              </div>
            </div>
            <template class="block-cards">
              <div class="card" v-for="item in knowledgeList">
                <div class="card-details">
                  <div class="card-image">
                    <img src="../../assets/images/灯泡.jpg" alt="背景图片">
                  </div>
                  <p class="text-title">{{ item.title }}</p>
                  <p class="text-body">{{ item.body }}</p>
                </div>
                <button class="card-button" @click="klgDetailBtnClick(item.kind)">进入知识点</button>
              </div>
            </template>

          </template>

          <!--游戏推荐（可左右翻页）-->
          <template class="block">
            <h3 class="block-title" style="margin-top: 30px;">您可能感兴趣的游戏</h3>
            <div class="block-main">
              <div class="item2">
                <el-carousel height="200px" :interval="10000">
                  <el-carousel-item v-for="item in 4" :key="item">
                    <h3 class="small">{{ item }}</h3>
                  </el-carousel-item>
                </el-carousel>
              </div>
            </div>
            <template class="block-cards">
              <div class="card" v-for="item in knowledgeList">
                <div class="card-details">
                  <div class="card-image">
                    <img src="../../assets/images/灯泡.jpg" alt="背景图片">
                  </div>
                  <p class="text-title">{{ item.title }}</p>
                  <p class="text-body">{{ item.body }}</p>
                </div>
                <button class="card-button" @click="klgDetailBtnClick(item.kind)">进入游戏</button>
              </div>
            </template>
          </template>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import {defineComponent} from "vue";
import Top from "../../components/top.vue";

export default defineComponent({
  name: "index",
  data() {
    return {
      data: "",
      imageList: ['/src/assets/images/灯泡.jpg','/src/assets/images/宇宙.jpg','/src/assets/images/氧气.jpg'],
      knowledgeList: [
        {
          imgSrc: '../../assets/images/灯泡.jpg',
          title: '电路排查',
          kind: 3,
          body: '家里的灯泡是怎么亮起来的呢？来这里一探究竟吧！',
        },
        {
          imgSrc: '../../assets/images/灯泡.jpg',
          title: '电路排查',
          kind: 3,
          body: '家里的灯泡是怎么亮起来的呢？来这里一探究竟吧！',
        },
        {
          imgSrc: '../../assets/images/灯泡.jpg',
          title: '电路排查',
          kind: 3,
          body: '家里的灯泡是怎么亮起来的呢？来这里一探究竟吧！',
        },
        {
          imgSrc: '../../assets/images/灯泡.jpg',
          title: '电路排查',
          kind: 3,
          body: '家里的灯泡是怎么亮起来的呢？来这里一探究竟吧！',
        }
        ,
        {
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
  },
  methods: {
    ready() {
    },

    //点击进入知识点详情
    klgDetailBtnClick(kind: number) {
      this.$router.push("/knowledge/kind/" + kind)
    }
  },
});
</script>

<style lang="scss" scoped>
@import "../../assets/style/css/knowledge/index.scss";
</style>
