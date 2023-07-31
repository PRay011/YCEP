<template>
  <!--  顶部导航栏-->
  <Top/>

  <div class="container">
    <div class="main">
      <!-- 顶部轮播图 -->
      <div class="title-block">
        <el-carousel height="300px" type="card" indicator-position="outside" interval="10000">
          <el-carousel-item v-for="item in imageList" :key="item">
            <img :src="item" alt="轮播图">
<!--            <h3 class="small">{{ item }}</h3>-->
          </el-carousel-item>
        </el-carousel>
      </div>

      <div class="body">
        <div class="left">

        </div>
        <div class="right">

          <!--知识点推荐（可左右翻页）-->
          <template class="block">
            <h3 class="block-title">您可能感兴趣的知识</h3>
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
                <el-carousel height="200px" interval="5000">
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
        },
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
@media (min-width: 1024px) {
  .container {
    min-height: 100vh;
    padding-top: 80px;
    display: flex;
    align-items: center;
  }
}

.main {
  width: 100%;

  .title-block {
    width: 80%;
    margin: 50px auto 0;

    .el-carousel__item h3 {
      color: #475669;
      font-size: 14px;
      opacity: 0.75;
      line-height: 150px;
      margin: 0;
    }

    .el-carousel__item:nth-child(2n) {
      background-color: #99a9bf;
    }

    .el-carousel__item:nth-child(2n+1) {
      background-color: #d3dce6;
    }
  }

  .body {
    display: flex;
    height: auto;
    margin-top: 50px;
    margin-bottom: 100px;

    .left {
      width: 15%;
      height: 800px;
      margin-left: 150px;
      background-color: #a1a1a1;
    }

    .right {
      width: 65%;
      height: auto;
      margin-left: auto;
      margin-right: 150px;
      padding-bottom: 50px;
      background-color: #e2e2e2;

      .block {
        display: grid;

        .block-title {
          margin-left: 30px;
          font-size: 28px;
          color: #181818;
          font-family: "Microsoft YaHei", sans-serif;
          margin-bottom: 30px;
        }

        .block-main {
          display: flex;
          flex-wrap: wrap;
          width: 100%;

          .item1 {
            display: flex;
            flex-direction: column;
            width: 46%;
            margin-left: 30px;
            height: 340px;
            //background-color: #4f7df0;
            //overflow: hidden;

            .image {
              height: 90%;
              overflow: hidden;

              img {
                width: 100%;
              }
            }

            .cover {
              display: flex;
              flex-direction: column;
              height: 20%;
              background-color: white;

              p {
                margin-left: 10px;
                font-size: 18px;

                &.p1 {
                  font-weight: bold;
                  font-size: 20px;
                }

                &.p2 {
                  margin-bottom: 5px;
                }

              }
            }
          }

          .item2 {
            width: 95%;
            height: 200px;
            margin-left: 30px;

            .el-carousel__item h3 {
              color: #475669;
              font-size: 14px;
              opacity: 0.75;
              line-height: 150px;
              margin: 0;
            }

            .el-carousel__item:nth-child(2n) {
              background-color: #99a9bf;
            }

            .el-carousel__item:nth-child(2n+1) {
              background-color: #d3dce6;
            }
          }
        }

        .block-cards {
          display: flex;
          width: 100%;

          .card {
            width: 220px;
            height: 300px;
            margin-left: 30px;
            margin-top: 30px;
            border-radius: 20px;
            background: #f5f5f5;
            //background-image: url("../../assets/images/灯泡.jpg");
            //background-size: cover;
            //background-repeat: no-repeat;
            position: relative;
            padding: 1.5rem;
            border: 2px solid #c3c6ce;
            transition: 0.5s ease-out;
            overflow: visible;

            .card-details {
              color: black;
              height: 100%;
              gap: .5em;
              display: grid;
              place-content: center;

              .card-image {
                overflow: hidden;

                img {
                  width: 100%;
                  //height: 100px;
                }
              }

              .text-body {
                color: rgb(134, 134, 134);
              }

              /*Text*/
              .text-title {
                font-size: 1.5em;
                font-weight: bold;
              }
            }

            .card-button {
              transform: translate(-50%, 125%);
              width: 60%;
              border-radius: 1rem;
              border: none;
              background-color: #008bf8;
              color: #fff;
              font-size: 1rem;
              padding: .5rem 1rem;
              position: absolute;
              left: 50%;
              bottom: 0;
              opacity: 0;
              transition: 0.3s ease-out;
              cursor: pointer;
            }

          }

          /*Hover*/
          .card:hover {
            border-color: #008bf8;
            box-shadow: 0 4px 18px 0 rgba(0, 0, 0, 0.25);
          }

          .card:hover .card-button {
            transform: translate(-50%, 50%);
            opacity: 1;
          }
        }
      }
    }
  }
}


</style>
