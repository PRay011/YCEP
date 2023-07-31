<template>
  <!--  顶部导航栏-->
  <Top/>

  <div class="container">
    <div class="main">
      <div class="title">
        <p v-for="item in dataList[2].knowledge">{{ item }}</p>
        <div class="search">
          <div class="input-container">
            <input type="text" name="text" class="input" placeholder="搜索...">
            <span class="icon">
            <svg width="23px" height="23px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
              <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
              <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
              <g id="SVGRepo_iconCarrier">
                <path opacity="1" d="M14 5H20" stroke="#000" stroke-width="1.5" stroke-linecap="round"
                      stroke-linejoin="round"></path>
                <path opacity="1" d="M14 8H17" stroke="#000" stroke-width="1.5" stroke-linecap="round"
                      stroke-linejoin="round"></path>
                <path d="M21 11.5C21 16.75 16.75 21 11.5 21C6.25 21 2 16.75 2 11.5C2 6.25 6.25 2 11.5 2" stroke="#000"
                      stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"></path>
                <path opacity="1" d="M22 22L20 20" stroke="#000" stroke-width="3.5" stroke-linecap="round"
                      stroke-linejoin="round"></path>
              </g>
            </svg>
          </span>
          </div>
        </div>
      </div>

      <div class="body">
        <div class="left">
          <div class="item" v-for="item in knowledgeInfoList" @click="toDetails(item.id)">
            <div class="image">
              <img :src="item.imgSrc" alt="知识点图片">
            </div>
            <div class="info">
              <p class="title-tag">{{ item.title }}</p>
              <p class="desc">{{ item.content }}</p>
              <p class="author">作者：{{ item.author }}</p>
            </div>
          </div>
        </div>
        <div class="right">
          <p>您可能感兴趣的：</p>
          <div class="item">

          </div>

        </div>

      </div>

    </div>

  </div>


</template>

<script>
import {defineComponent} from "vue";
import Top from "../../components/top.vue";

export default defineComponent({
  name: "kind",
  components: {Top},
  data() {
    return {
      kind: 0,
      dataList: [
        {
          kind: 1,
          knowledge: ['全部', '数组', '算式', '排序', '追及']
        },
        {
          kind: 2,
          knowledge: ['全部', '木材', '钢材', '芯片', '物联网']
        },
        {
          kind: 3,
          knowledge: ['全部', '电路', '太空', '力', '电磁']
        },
        {
          kind: 4,
          knowledge: ['全部', '液体', '固体', '气体', '合成']
        }
      ],
      knowledgeInfoList: [
        {
          id: 1,
          imgSrc: '/src/assets/images/灯泡.jpg',
          title: 'Spring Boot 单元测试',
          content: 'Spring Boot 中进行单元测试是一个常见的做法，可以帮助你验证应用程序的各个组件是否按预期工作。所以我们有必要去学习一番！一、什么是单元测试？🍭 单元测试（unit testing），是指对软件中的最小可测试单元进行检查和验证的过程就叫单元测试。单元测试是开发者编写的一小段代码，用于检验被测代码的⼀个很小的、很明确的（代码）功能是否正确。执行单元测试就是为了证明某段代码的执行结果是否符合我们的预期。如果测试结果符合我们的预期，称之为测试通过，否则就是测试未通过（或者叫测试失败）。',
          author: '冷雪兮',
        },
      ]
    }
  },
  mounted() {
    this.ready();
  },
  methods: {
    ready() {
      let kind = this.$route.query.kind;
      console.log("kind:" + kind)
      this.kind = kind
    },
    toDetails(id) {
      // console.log(id)
      this.$router.push('/knowledge/detail/' + id)
    },
  }

})
</script>

<style scoped lang="scss">
@media (min-width: 1024px) {
  .container {
    min-height: 100vh;
    display: flex;
    align-items: center;
  }
}

.main {
  width: 100%;

  .title {
    display: flex;
    width: 85%;
    height: 80px;
    background-color: #e2e2e2;
    margin: 20px auto;

    p {
      font-size: 20px;
      color: #181818;
      margin-left: 50px;
      margin-right: 30px;
      line-height: 80px;
    }

    .search {
      margin-left: auto;
      margin-right: 50px;

      .input-container {
        line-height: 80px;
        width: 350px;
        position: relative;
      }

      .icon {
        position: absolute;
        right: 15px;
        top: calc(50% + 10px);
        transform: translateY(calc(-50% - 5px));
      }

      .input {
        width: 100%;
        height: 50px;
        padding: 10px;
        transition: .2s linear;
        border: 2.5px solid black;
        font-size: 18px;
        text-transform: uppercase;
        letter-spacing: 2px;
      }

      .input:focus {
        outline: none;
        border: 0.5px solid black;
        box-shadow: -5px -5px 0px black;
      }

      .input-container:hover > .icon {
        animation: anim 1s linear infinite;
      }

      @keyframes anim {
        0%,
        100% {
          transform: translateY(calc(-50% - 5px)) scale(1);
        }

        50% {
          transform: translateY(calc(-50% - 5px)) scale(1.1);
        }
      }
    }

  }

  .body {
    display: flex;
    margin-top: 80px;

    .left {
      width: 65%;
      margin-left: 150px;
      height: 700px;
      background-color: #e2e2e2;

      .item {
        display: flex;
        width: 100%;
        height: 180px;
        margin: 20px 0;
        border-bottom: 1px solid #f0f0f2;
        background-color: white;
        cursor: pointer;

        .image {
          height: 80%;
          width: 20%;
          margin: auto 10px;
          overflow: hidden;

          img {
            width: 100%;
          }
        }

        .info {
          width: 80%;
          display: flex;
          flex-direction: column;
          //background-color: #4f7df0;
          .title-tag {
            margin-top: 20px;
            font-size: 25px;
            font-weight: 500;
            color: #222226;
            overflow: hidden;
            white-space: normal;
            word-break: break-word;
            line-height: 40px;
            margin-bottom: 4px;
          }

          .desc {
            font-size: 18px;
            font-weight: 400;
            color: #555666;
            overflow: hidden;
            white-space: normal;
            word-break: break-word;
            display: -webkit-box;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 2;
          }

          .author {
            margin-top: auto;
            margin-bottom: 20px;
            font-size: 17px;
            font-weight: 400;
            color: #555666;
          }
        }
      }

    }

    .right {
      margin-left: auto;
      margin-right: 150px;
      width: 17%;
      height: 700px;
      background-color: #a1a1a1;

      p {
        width: 90%;
        margin: 0 auto;
        font-size: 20px;
        font-weight: bold;
      }

      .item {
        width: 90%;
        height: 80px;
        margin: 0 auto;
        background-color: #4f7df0;
      }
    }
  }
}


</style>
