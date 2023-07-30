<template>
  <!--  顶部导航栏-->
  <Top/>

  <div class="container">
    <div class="main">
      <!-- 顶部轮播图 -->
      <div class="title-block">
        <el-carousel height="300px" type="card" indicator-position="outside" interval="5000">
          <el-carousel-item v-for="item in 4" :key="item">
            <h3 class="small">{{ item }}</h3>
          </el-carousel-item>
        </el-carousel>
      </div>

      <div class="body">
        <div class="left">

        </div>
        <div class="right">
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
      this.$router.push("/knowledge/kind/"+kind)
    }
  },
});
</script>

<style lang="scss" scoped>
@media (min-width: 1024px) {
  .container {
    //min-height: 100vh;
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
    height: 1000px;
    margin-top: 50px;

    .left {
      width: 15%;
      height: 800px;
      margin-left: 80px;
      background-color: #a1a1a1;
    }

    .right {
      display: flex;
      flex-wrap: wrap;
      width: 65%;
      height: 800px;
      margin-left: 100px;
      background-color: #e2e2e2;

      .card {
        width: 220px;
        height: 300px;
        margin: 30px;
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


</style>
