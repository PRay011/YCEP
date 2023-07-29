<template>

  <div class="header">
    <div class="header-content">
      <div class="header-item" style="width: 400px;text-align: left">
        <p>YCEP网站</p>
      </div>
      <div class="header-item" @click="titleItemClick(0)">
        <p>首页</p>
        <div class="underline" v-if="currentItem===0"></div>
      </div>

      <div class="header-item item1" @mouseenter="showHoverItem1=true" @mouseleave="showHoverItem1=false"
           @click="titleItemClick(1)">
        <p>编程</p>
        <div class="underline" v-if="showHoverItem1 || currentItem===1"></div>
      </div>
      <div class="header-item item2" @mouseenter="showHoverItem2=true" @mouseleave="showHoverItem2=false"
           @click="titleItemClick(2)">
        <p>材料</p>
        <div class="underline" v-if="showHoverItem2 || currentItem===2"></div>
      </div>
      <div class="header-item item3" @mouseenter="showHoverItem3=true" @mouseleave="showHoverItem3=false"
           @click="titleItemClick(3)">
        <p>物理</p>
        <div class="underline" v-if="showHoverItem3 || currentItem===3"></div>
      </div>
      <div class="header-item item4" @mouseenter="showHoverItem4=true" @mouseleave="showHoverItem4=false"
           @click="titleItemClick(4)">
        <p>化学</p>
        <div class="underline" v-if="showHoverItem4 || currentItem===4"></div>
      </div>

      <template v-if="isLogged">
        <div>
          <p>欢迎您：{{ username }}</p>
        </div>
      </template>
      <template v-else>
        <div class="header-item"><p>登录</p></div>
        <div class="header-item"><p>注册</p></div>
      </template>

      <div class="header-item">
        <p>关于</p>
      </div>
    </div>
    <!--hover弹出框-->
    <div class="hover-div">
      <div class="hover-content item1" v-if="showHoverItem1">
        <div class="left">
          <p v-for="item in knowledgeList">{{ item }}</p>
        </div>
        <div class="right">

        </div>
      </div>
      <div class="hover-content item2" v-if="showHoverItem2">

      </div>
      <div class="hover-content item3" v-if="showHoverItem3">

      </div>
      <div class="hover-content item4" v-if="showHoverItem4">

      </div>
    </div>
  </div>


</template>

<script>
export default {
  name: "top",
  data() {
    return {
      isLogged: true,
      username: "蛄蛹者",
      currentItem: 0,
      showHoverItem1: false,
      showHoverItem2: false,
      showHoverItem3: false,
      showHoverItem4: false,
      knowledgeList: ['数组', '算式', '排序', '追及',
        '电路', '太空', '力', '电磁',
        '法律', '品德', '生活', '相处',
        '语法', '口语', '情景', '对话'],
    }
  },
  mounted() {
    this.ready();
  },
  // 监听,当路由发生变化的时候执行
  watch: {
    // $route(to, from) {
    //   this.currentItem = to.params.kind
    //   console.log('watch:'+this.currentItem)
    // },
  },
  methods: {
    ready() {
      this.currentItem = this.$route.params.kind
      console.log(this.currentItem)
    },
    titleItemClick(index) {
      this.currentItem = index
      switch (index) {
        case 0:
          this.currentItem = 0;
          this.$router.push('/knowledge/index');
          break;
        default:
          this.$router.push('/knowledge/kind/'+index);
          break;
      }
    },

  },
}

</script>

<style scoped lang="scss">

$top_color: rgb(24, 26, 32);

.header {
  position: fixed;
  top: 0;
  width: 100%;
  z-index: 3;
  height: 90px;
  background-color: $top_color;

  .header-content {
    display: flex;
    height: 100%;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: justify;
    justify-content: space-between;
    width: 75vw;
    margin: auto;

    .header-item {
      width: 100px;
      text-align: center;
      display: flex;
      flex-direction: column;
      cursor: pointer;

      .underline {
        width: 100px;
        height: 3px;
        margin-top: 10px;
        background-color: #c2c2c2;
      }
    }

  }

  p {
    font-size: 20px;
    font-family: "Helvetica", sans-serif;
    color: #e2e2e2;
  }

  .hover-div {

    .hover-content {
      position: absolute;
      top: 100px;
      width: 858px;
      height: auto !important;
      //background: url(../images/navbg2.jpg)no-repeat center;
      //background-size: cover;
      background-color: #a1a1a1;
      z-index: 10;
      padding: 30px;
      border-top: 3px solid #0099ff;
      box-shadow: 0 0 10px rgb(0 0 0 / 20%);
      display: flex;

      .left {
        width: 60%;
        background-color: #ffffff;
        height: 300px;
        display: flex;
        flex-wrap: wrap;

        p {
          width: 100px;
          color: $top_color;
          cursor: pointer;
        }
      }

      .right {
        width: 40%;
        background-color: #4f7df0;
        height: 300px
      }
    }

    .hover-content.item1 {
      left: 400px;
    }

    .hover-content.item2 {
      left: 500px
    }

    .hover-content.item3 {
      left: 600px
    }

    .hover-content.item4 {
      left: 700px
    }
  }
}


</style>
