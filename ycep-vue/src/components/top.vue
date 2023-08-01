<template>

  <div class="header">
    <div class="header-content">
      <div class="header-item" @click="titleItemClick(-1)" style="width: 400px;text-align: left">
        <p>YCEP网站</p>
      </div>
      <div class="header-item" @click="titleItemClick(0)">
        <p>首页</p>
        <div class="underline" v-if="currentItem===0"></div>
      </div>

      <div class="header-item item1" @mouseenter="showHoverItem1=true" @mouseleave="showHoverItem1=false"
           @click="titleItemClick(1)">
        <p>编程</p>
<!--        <el-dropdown @command="handleCommand">-->
<!--          <span class="el-dropdown-link"><p>编程</p><i class="el-icon-arrow-down el-icon&#45;&#45;right"></i></span>-->
<!--          <el-dropdown-menu slot="dropdown">-->
<!--            <el-dropdown-item command="a">黄金糕</el-dropdown-item>-->
<!--            <el-dropdown-item command="b">狮子头</el-dropdown-item>-->
<!--            <el-dropdown-item command="c">螺蛳粉</el-dropdown-item>-->
<!--            <el-dropdown-item command="d" disabled>双皮奶</el-dropdown-item>-->
<!--            <el-dropdown-item command="e" divided>蚵仔煎</el-dropdown-item>-->
<!--          </el-dropdown-menu>-->
<!--        </el-dropdown>-->
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
        <el-avatar alt="用户头像" @click="selfCenterClick" class="self"
                   src="https://i03piccdn.sogoucdn.com/5cf35c1052b8f21d"></el-avatar>
        <div class="self" @click="selfCenterClick">
          <p class="username">{{ username }}</p>
        </div>
        <div class="header-item" @click="logout">
          <p>退出账号</p>
        </div>
      </template>
      <template v-else>
        <div class="header-item login">
          <button @click="loginBtnClick">登录
            <div class="arrow-wrapper">
              <div class="arrow"></div>
            </div>
          </button>
        </div>
      </template>
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
import { ArrowDown } from '@element-plus/icons-vue'
export default {
  name: "top",
  data() {
    return {
      isLogged: false,
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
    $route(to, from) {
      console.log('当前路由：' + to.path)
      let path = to.path
      if (path === '/knowledge/kind/1') {
        this.currentItem = 1;
      } else if (path === '/knowledge/kind/2') {
        this.currentItem = 2;
      } else if (path === '/knowledge/kind/3') {
        this.currentItem = 3;
      } else if (path === '/knowledge/kind/4') {
        this.currentItem = 4;
      } else if (path === '/knowledge/index') {
        this.currentItem = 0;
      } else if (path === '/') {
        this.currentItem = -1;
      }
    },
  },
  methods: {
    ready() {
      //刷新后保持选中值不变
      this.currentItem = this.$route.params.kind
      console.log('当前路由：' + this.$route.path)
      let path = this.$route.path
      if (path === '/knowledge/kind/1') {
        this.currentItem = 1;
      } else if (path === '/knowledge/kind/2') {
        this.currentItem = 2;
      } else if (path === '/knowledge/kind/3') {
        this.currentItem = 3;
      } else if (path === '/knowledge/kind/4') {
        this.currentItem = 4;
      } else if (path === '/knowledge/index') {
        this.currentItem = 0;
      } else if (path === '/') {
        this.currentItem = -1;
      }

      //判断用户登录
      let username = localStorage.getItem('username')
      console.log('username:'+username)
      if (username !== '' && username) {
        this.isLogged = true;
        this.username = username;
      }

    },
    titleItemClick(index) {
      this.currentItem = index
      switch (index) {
        case -1:
          this.$router.push('/');
          break;
        case 0:
          this.currentItem = 0;
          this.$router.push('/knowledge/index');
          break;
        default:
          this.$router.push('/knowledge/kind/' + index);
          break;
      }
    },
    selfCenterClick() {
      this.$router.push('/user/selfCenter')
    },
    loginBtnClick() {
      this.$router.push('/user/login')
    },
    logout() {
      localStorage.removeItem('username')
      this.$router.push('/')
      this.$router.push('/knowledge/index')
    },
    handleCommand(command){
      this.$message('click on item ' + command);
    }
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
  height: 70px;
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

      .el-dropdown-link {
        cursor: pointer;
        color: #409EFF;
      }
      .el-icon-arrow-down {
        font-size: 12px;
      }
    }

    .self {
      cursor: pointer;
    }

    .login {
      height: 45px;

      button {
        --primary-color: #645bff;
        --secondary-color: #fff;
        --hover-color: #645bff;
        --arrow-width: 10px;
        --arrow-stroke: 2px;
        box-sizing: border-box;
        border: 0;
        border-radius: 20px;
        color: var(--secondary-color);
        padding: 1em 1.8em;
        background: var(--primary-color);
        display: flex;
        transition: 0.2s background;
        align-items: center;
        gap: 0.6em;
        font-weight: bold;
        cursor: pointer;
      }

      button .arrow-wrapper {
        display: flex;
        justify-content: center;
        align-items: center;
      }

      button .arrow {
        margin-top: 1px;
        width: var(--arrow-width);
        background: var(--primary-color);
        height: var(--arrow-stroke);
        position: relative;
        transition: 0.2s;
      }

      button .arrow::before {
        content: "";
        box-sizing: border-box;
        position: absolute;
        border: solid var(--secondary-color);
        border-width: 0 var(--arrow-stroke) var(--arrow-stroke) 0;
        display: inline-block;
        top: -3px;
        right: 3px;
        transition: 0.2s;
        padding: 3px;
        transform: rotate(-45deg);
      }

      button:hover {
        background-color: var(--hover-color);
      }

      button:hover .arrow {
        background: var(--secondary-color);
      }

      button:hover .arrow:before {
        right: 0;
      }
    }

  }

  p {
    font-size: 17px;
    font-family: "Helvetica", sans-serif;
    color: #e2e2e2;
  }

  .hover-div {

    .hover-content {
      position: absolute;
      top: 60px;
      width: 800px;
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
        height: 200px;
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
        height: 200px
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
