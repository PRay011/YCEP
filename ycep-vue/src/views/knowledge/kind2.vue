<template>
  <!--  顶部导航栏-->
  <Top @getTopData2="changeTitleItem" />

  <div class="container">
    <div class="main" v-if="update">
      <div class="kind">
        <div class="info">
          <p class="text1">材料</p>
          <p class="text2">想象力/创造力/培养兴趣</p>
          <div class="tags"></div>
        </div>
      </div>

      <div class="title">
        <div
          v-for="(item, index) in itemList"
          :key="index"
          class="title-item"
          :class="{ selected: selectedItem == index }"
          @click="itemClick(index)"
        >
          <p class="text">{{ item }}</p>
        </div>
        <div class="search">
          <div class="input-container">
            <input
              type="text"
              name="text"
              class="input"
              placeholder="搜索..."
            />
            <span class="icon">
              <svg
                width="20px"
                height="20px"
                viewBox="0 0 24 24"
                fill="none"
                xmlns="http://www.w3.org/2000/svg"
              >
                <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                <g
                  id="SVGRepo_tracerCarrier"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                ></g>
                <g id="SVGRepo_iconCarrier">
                  <path
                    opacity="1"
                    d="M14 5H20"
                    stroke="#000"
                    stroke-width="1.5"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                  ></path>
                  <path
                    opacity="1"
                    d="M14 8H17"
                    stroke="#000"
                    stroke-width="1.5"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                  ></path>
                  <path
                    d="M21 11.5C21 16.75 16.75 21 11.5 21C6.25 21 2 16.75 2 11.5C2 6.25 6.25 2 11.5 2"
                    stroke="#000"
                    stroke-width="2.5"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                  ></path>
                  <path
                    opacity="1"
                    d="M22 22L20 20"
                    stroke="#000"
                    stroke-width="3.5"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                  ></path>
                </g>
              </svg>
            </span>
          </div>
        </div>
      </div>

      <div class="body">
        <div class="left">
          <div
            class="item"
            v-for="item in knowledgeInfoList"
            @click="toDetails(item.id)"
          >
            <!--知识点-->
            <div class="knowledge">
              <div class="image">
                <img :src="item.imgSrc" alt="知识点图片" />
              </div>
              <div class="info">
                <p class="title-tag">{{ item.title }}</p>
                <p class="desc">{{ item.content }}</p>
                <p class="author">作者：{{ item.author }}</p>
              </div>
            </div>
            <!--游戏-->
            <div class="game">
              <div class="card" @click="klgDetailBtnClick(item.id)">
                <div class="card-image">
                  <img :src="item.imgSrc" alt="背景图片" />
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
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import Top from "../../components/top.vue";

export default defineComponent({
  name: "kind2",
  components: { Top },
  data() {
    return {
      update: true,
      kind: 0,
      selectedItem: 0,
      itemList: ["全部", "木材", "钢材", "芯片", "物联网"],
      knowledgeInfoList: [
        {
          id: 1,
          imgSrc: "/src/assets/images/灯泡.jpg",
          title: "Spring Boot 单元测试",
          content:
            "Spring Boot 中进行单元测试是一个常见的做法，可以帮助你验证应用程序的各个组件是否按预期工作。所以我们有必要去学习一番！一、什么是单元测试？🍭 单元测试（unit testing），是指对软件中的最小可测试单元进行检查和验证的过程就叫单元测试。单元测试是开发者编写的一小段代码，用于检验被测代码的⼀个很小的、很明确的（代码）功能是否正确。执行单元测试就是为了证明某段代码的执行结果是否符合我们的预期。如果测试结果符合我们的预期，称之为测试通过，否则就是测试未通过（或者叫测试失败）。",
          author: "冷雪兮",
        },
        {
          id: 2,
          imgSrc: "/src/assets/images/灯泡.jpg",
          title: "Spring Boot 单元测试",
          content:
            "Spring Boot 中进行单元测试是一个常见的做法，可以帮助你验证应用程序的各个组件是否按预期工作。所以我们有必要去学习一番！一、什么是单元测试？🍭 单元测试（unit testing），是指对软件中的最小可测试单元进行检查和验证的过程就叫单元测试。单元测试是开发者编写的一小段代码，用于检验被测代码的⼀个很小的、很明确的（代码）功能是否正确。执行单元测试就是为了证明某段代码的执行结果是否符合我们的预期。如果测试结果符合我们的预期，称之为测试通过，否则就是测试未通过（或者叫测试失败）。",
          author: "冷雪兮",
        },
        {
          id: 3,
          imgSrc: "/src/assets/images/灯泡.jpg",
          title: "Spring Boot 单元测试",
          content:
            "Spring Boot 中进行单元测试是一个常见的做法，可以帮助你验证应用程序的各个组件是否按预期工作。所以我们有必要去学习一番！一、什么是单元测试？🍭 单元测试（unit testing），是指对软件中的最小可测试单元进行检查和验证的过程就叫单元测试。单元测试是开发者编写的一小段代码，用于检验被测代码的⼀个很小的、很明确的（代码）功能是否正确。执行单元测试就是为了证明某段代码的执行结果是否符合我们的预期。如果测试结果符合我们的预期，称之为测试通过，否则就是测试未通过（或者叫测试失败）。",
          author: "冷雪兮",
        },
        {
          id: 4,
          imgSrc: "/src/assets/images/灯泡.jpg",
          title: "Spring Boot 单元测试",
          content:
            "Spring Boot 中进行单元测试是一个常见的做法，可以帮助你验证应用程序的各个组件是否按预期工作。所以我们有必要去学习一番！一、什么是单元测试？🍭 单元测试（unit testing），是指对软件中的最小可测试单元进行检查和验证的过程就叫单元测试。单元测试是开发者编写的一小段代码，用于检验被测代码的⼀个很小的、很明确的（代码）功能是否正确。执行单元测试就是为了证明某段代码的执行结果是否符合我们的预期。如果测试结果符合我们的预期，称之为测试通过，否则就是测试未通过（或者叫测试失败）。",
          author: "冷雪兮",
        },
      ],
    };
  },

  mounted() {
    this.ready();
  },
  methods: {
    ready() {
      if (this.selectedItem === 0) {
        this.knowledgeInfoList = [
          {
            id: 1,
            imgSrc: "/src/assets/images/灯泡.jpg",
            title: "Spring Boot 单元测试",
            content:
              "Spring Boot 中进行单元测试是一个常见的做法，可以帮助你验证应用程序的各个组件是否按预期工作。所以我们有必要去学习一番！一、什么是单元测试？🍭 单元测试（unit testing），是指对软件中的最小可测试单元进行检查和验证的过程就叫单元测试。单元测试是开发者编写的一小段代码，用于检验被测代码的⼀个很小的、很明确的（代码）功能是否正确。执行单元测试就是为了证明某段代码的执行结果是否符合我们的预期。如果测试结果符合我们的预期，称之为测试通过，否则就是测试未通过（或者叫测试失败）。",
            author: "冷雪兮",
          },
          {
            id: 2,
            imgSrc: "/src/assets/images/灯泡.jpg",
            title: "Spring Boot 单元测试",
            content:
              "Spring Boot 中进行单元测试是一个常见的做法，可以帮助你验证应用程序的各个组件是否按预期工作。所以我们有必要去学习一番！一、什么是单元测试？🍭 单元测试（unit testing），是指对软件中的最小可测试单元进行检查和验证的过程就叫单元测试。单元测试是开发者编写的一小段代码，用于检验被测代码的⼀个很小的、很明确的（代码）功能是否正确。执行单元测试就是为了证明某段代码的执行结果是否符合我们的预期。如果测试结果符合我们的预期，称之为测试通过，否则就是测试未通过（或者叫测试失败）。",
            author: "冷雪兮",
          },
          {
            id: 3,
            imgSrc: "/src/assets/images/灯泡.jpg",
            title: "Spring Boot 单元测试",
            content:
              "Spring Boot 中进行单元测试是一个常见的做法，可以帮助你验证应用程序的各个组件是否按预期工作。所以我们有必要去学习一番！一、什么是单元测试？🍭 单元测试（unit testing），是指对软件中的最小可测试单元进行检查和验证的过程就叫单元测试。单元测试是开发者编写的一小段代码，用于检验被测代码的⼀个很小的、很明确的（代码）功能是否正确。执行单元测试就是为了证明某段代码的执行结果是否符合我们的预期。如果测试结果符合我们的预期，称之为测试通过，否则就是测试未通过（或者叫测试失败）。",
            author: "冷雪兮",
          },
          {
            id: 4,
            imgSrc: "/src/assets/images/灯泡.jpg",
            title: "Spring Boot 单元测试",
            content:
              "Spring Boot 中进行单元测试是一个常见的做法，可以帮助你验证应用程序的各个组件是否按预期工作。所以我们有必要去学习一番！一、什么是单元测试？🍭 单元测试（unit testing），是指对软件中的最小可测试单元进行检查和验证的过程就叫单元测试。单元测试是开发者编写的一小段代码，用于检验被测代码的⼀个很小的、很明确的（代码）功能是否正确。执行单元测试就是为了证明某段代码的执行结果是否符合我们的预期。如果测试结果符合我们的预期，称之为测试通过，否则就是测试未通过（或者叫测试失败）。",
            author: "冷雪兮",
          },
        ];
      } else if (this.selectedItem === 1) {
        this.knowledgeInfoList = [
          {
            id: 1,
            imgSrc: "/src/assets/images/灯泡.jpg",
            title: "Spring Boot 单元测试",
            content:
              "Spring Boot 中进行单元测试是一个常见的做法，可以帮助你验证应用程序的各个组件是否按预期工作。所以我们有必要去学习一番！一、什么是单元测试？🍭 单元测试（unit testing），是指对软件中的最小可测试单元进行检查和验证的过程就叫单元测试。单元测试是开发者编写的一小段代码，用于检验被测代码的⼀个很小的、很明确的（代码）功能是否正确。执行单元测试就是为了证明某段代码的执行结果是否符合我们的预期。如果测试结果符合我们的预期，称之为测试通过，否则就是测试未通过（或者叫测试失败）。",
            author: "冷雪兮",
          },
        ];
      } else if (this.selectedItem === 2) {
        this.knowledgeInfoList = [
          {
            id: 1,
            imgSrc: "/src/assets/images/灯泡.jpg",
            title: "Spring Boot 单元测试",
            content:
              "Spring Boot 中进行单元测试是一个常见的做法，可以帮助你验证应用程序的各个组件是否按预期工作。所以我们有必要去学习一番！一、什么是单元测试？🍭 单元测试（unit testing），是指对软件中的最小可测试单元进行检查和验证的过程就叫单元测试。单元测试是开发者编写的一小段代码，用于检验被测代码的⼀个很小的、很明确的（代码）功能是否正确。执行单元测试就是为了证明某段代码的执行结果是否符合我们的预期。如果测试结果符合我们的预期，称之为测试通过，否则就是测试未通过（或者叫测试失败）。",
            author: "冷雪兮",
          },
          {
            id: 2,
            imgSrc: "/src/assets/images/灯泡.jpg",
            title: "Spring Boot 单元测试",
            content:
              "Spring Boot 中进行单元测试是一个常见的做法，可以帮助你验证应用程序的各个组件是否按预期工作。所以我们有必要去学习一番！一、什么是单元测试？🍭 单元测试（unit testing），是指对软件中的最小可测试单元进行检查和验证的过程就叫单元测试。单元测试是开发者编写的一小段代码，用于检验被测代码的⼀个很小的、很明确的（代码）功能是否正确。执行单元测试就是为了证明某段代码的执行结果是否符合我们的预期。如果测试结果符合我们的预期，称之为测试通过，否则就是测试未通过（或者叫测试失败）。",
            author: "冷雪兮",
          },
          {
            id: 3,
            imgSrc: "/src/assets/images/灯泡.jpg",
            title: "Spring Boot 单元测试",
            content:
              "Spring Boot 中进行单元测试是一个常见的做法，可以帮助你验证应用程序的各个组件是否按预期工作。所以我们有必要去学习一番！一、什么是单元测试？🍭 单元测试（unit testing），是指对软件中的最小可测试单元进行检查和验证的过程就叫单元测试。单元测试是开发者编写的一小段代码，用于检验被测代码的⼀个很小的、很明确的（代码）功能是否正确。执行单元测试就是为了证明某段代码的执行结果是否符合我们的预期。如果测试结果符合我们的预期，称之为测试通过，否则就是测试未通过（或者叫测试失败）。",
            author: "冷雪兮",
          },
        ];
      } else if (this.selectedItem === 3) {
        this.knowledgeInfoList = [
          {
            id: 1,
            imgSrc: "/src/assets/images/灯泡.jpg",
            title: "Spring Boot 单元测试",
            content:
              "Spring Boot 中进行单元测试是一个常见的做法，可以帮助你验证应用程序的各个组件是否按预期工作。所以我们有必要去学习一番！一、什么是单元测试？🍭 单元测试（unit testing），是指对软件中的最小可测试单元进行检查和验证的过程就叫单元测试。单元测试是开发者编写的一小段代码，用于检验被测代码的⼀个很小的、很明确的（代码）功能是否正确。执行单元测试就是为了证明某段代码的执行结果是否符合我们的预期。如果测试结果符合我们的预期，称之为测试通过，否则就是测试未通过（或者叫测试失败）。",
            author: "冷雪兮",
          },
          {
            id: 2,
            imgSrc: "/src/assets/images/灯泡.jpg",
            title: "Spring Boot 单元测试",
            content:
              "Spring Boot 中进行单元测试是一个常见的做法，可以帮助你验证应用程序的各个组件是否按预期工作。所以我们有必要去学习一番！一、什么是单元测试？🍭 单元测试（unit testing），是指对软件中的最小可测试单元进行检查和验证的过程就叫单元测试。单元测试是开发者编写的一小段代码，用于检验被测代码的⼀个很小的、很明确的（代码）功能是否正确。执行单元测试就是为了证明某段代码的执行结果是否符合我们的预期。如果测试结果符合我们的预期，称之为测试通过，否则就是测试未通过（或者叫测试失败）。",
            author: "冷雪兮",
          },
        ];
      } else {
        this.knowledgeInfoList = [
          {
            id: 4,
            imgSrc: "/src/assets/images/灯泡.jpg",
            title: "Spring Boot 单元测试",
            content:
              "Spring Boot 中进行单元测试是一个常见的做法，可以帮助你验证应用程序的各个组件是否按预期工作。所以我们有必要去学习一番！一、什么是单元测试？🍭 单元测试（unit testing），是指对软件中的最小可测试单元进行检查和验证的过程就叫单元测试。单元测试是开发者编写的一小段代码，用于检验被测代码的⼀个很小的、很明确的（代码）功能是否正确。执行单元测试就是为了证明某段代码的执行结果是否符合我们的预期。如果测试结果符合我们的预期，称之为测试通过，否则就是测试未通过（或者叫测试失败）。",
            author: "冷雪兮",
          },
        ];
      }
    },
    changeTitleItem(data: any) {
      console.log(data);
      this.itemClick(data);
      console.log(this.selectedItem);
    },
    toDetails(id: any) {
      this.$router.push("/knowledge/detail/" + id);
    },
    itemClick(index: any) {
      this.selectedItem = index;
      console.log("selectedItem:" + this.selectedItem);
      this.ready();
    },
  },
});
</script>

<style scoped lang="scss">
@import "../../assets/style/css/knowledge/kind.scss";
</style>
