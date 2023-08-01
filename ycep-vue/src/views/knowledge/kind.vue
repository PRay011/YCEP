<template>
  <!--  顶部导航栏-->
  <Top/>

  <div class="container">
    <div class="main">

      <div class="kind">
        <div class="info">
          <p class="text1">编程</p>
          <p class="text2">锻炼思维/加强动手能力/培养兴趣</p>
          <div class="tags">

          </div>
        </div>
      </div>

      <div class="title">
        <div v-for="(item,index) in dataList[kind-1]?.knowledge" class="title-item" :class="selectedItem===index?'selected':''"
             @click="itemClick(index)">
          <p class="text">{{ item }}</p>
        </div>
        <div class="search">
          <div class="input-container">
            <input type="text" name="text" class="input" placeholder="搜索...">
            <span class="icon">
            <svg width="20px" height="20px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
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
<!--          <p>您可能感兴趣的：</p>-->
          <div class="item">
            <div class="card">
              <a class="card1" href="#">
                <p>智能垃圾桶</p>
                <p class="small">可以感应手的智能垃圾桶的原理是怎么实现的呢？</p>
                <div class="go-corner">
                  <div class="go-arrow">→</div>
                </div>
              </a>
            </div>
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
      selectedItem: 0,
      dataList: [
        {
          kind: 1,
          knowledge: ['全部', '排序算法', '数组', '链表', '对象']
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
          imgSrc: '/src/assets/images/demo/灯泡.jpg',
          title: 'Spring Boot 单元测试',
          content: 'Spring Boot 中进行单元测试是一个常见的做法，可以帮助你验证应用程序的各个组件是否按预期工作。所以我们有必要去学习一番！一、什么是单元测试？🍭 单元测试（unit testing），是指对软件中的最小可测试单元进行检查和验证的过程就叫单元测试。单元测试是开发者编写的一小段代码，用于检验被测代码的⼀个很小的、很明确的（代码）功能是否正确。执行单元测试就是为了证明某段代码的执行结果是否符合我们的预期。如果测试结果符合我们的预期，称之为测试通过，否则就是测试未通过（或者叫测试失败）。',
          author: '冷雪兮',
        },
        {
          id: 2,
          imgSrc: '/src/assets/images/demo/灯泡.jpg',
          title: 'Spring Boot 单元测试',
          content: 'Spring Boot 中进行单元测试是一个常见的做法，可以帮助你验证应用程序的各个组件是否按预期工作。所以我们有必要去学习一番！一、什么是单元测试？🍭 单元测试（unit testing），是指对软件中的最小可测试单元进行检查和验证的过程就叫单元测试。单元测试是开发者编写的一小段代码，用于检验被测代码的⼀个很小的、很明确的（代码）功能是否正确。执行单元测试就是为了证明某段代码的执行结果是否符合我们的预期。如果测试结果符合我们的预期，称之为测试通过，否则就是测试未通过（或者叫测试失败）。',
          author: '冷雪兮',
        },
        {
          id: 3,
          imgSrc: '/src/assets/images/demo/灯泡.jpg',
          title: 'Spring Boot 单元测试',
          content: 'Spring Boot 中进行单元测试是一个常见的做法，可以帮助你验证应用程序的各个组件是否按预期工作。所以我们有必要去学习一番！一、什么是单元测试？🍭 单元测试（unit testing），是指对软件中的最小可测试单元进行检查和验证的过程就叫单元测试。单元测试是开发者编写的一小段代码，用于检验被测代码的⼀个很小的、很明确的（代码）功能是否正确。执行单元测试就是为了证明某段代码的执行结果是否符合我们的预期。如果测试结果符合我们的预期，称之为测试通过，否则就是测试未通过（或者叫测试失败）。',
          author: '冷雪兮',
        },
        {
          id: 4,
          imgSrc: '/src/assets/images/demo/灯泡.jpg',
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
      let kind = this.$route.params.kind;
      console.log("kind:" + kind)
      this.kind = kind
    },
    toDetails(id) {
      // console.log(id)
      this.$router.push('/knowledge/detail/' + id)
    },
    itemClick(index){
      this.selectedItem = index;
      console.log("selectedItem:"+this.selectedItem)
    }
  }

})
</script>

<style scoped lang="scss">
@import "../../assets/style/css/knowledge/kind.scss";
</style>
