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

      <div class="header-item item1" @click="titleItemClick(1)">
        <template class="dropdown">
          <el-dropdown @command="commandItemClick1">
            <span class="el-dropdown-link">
              <p>编程</p><el-icon class="el-icon--right"><arrow-down/></el-icon>
            </span>
            <template #dropdown>
              <el-dropdown-menu>
                <el-dropdown-item command=1>排序算法</el-dropdown-item>
                <el-dropdown-item command=2>数组</el-dropdown-item>
                <el-dropdown-item command=3>链表</el-dropdown-item>
                <el-dropdown-item command=4>对象</el-dropdown-item>
              </el-dropdown-menu>
            </template>
          </el-dropdown>
        </template>
        <div class="underline" v-if="currentItem===1"></div>
      </div>
      <div class="header-item item2" @click="titleItemClick(2)">
        <template class="dropdown">
          <el-dropdown @command="commandItemClick2">
            <span class="el-dropdown-link">
              <p>材料</p><el-icon class="el-icon--right"><arrow-down/></el-icon>
            </span>
            <template #dropdown>
              <el-dropdown-menu>
                <el-dropdown-item command=1>木材</el-dropdown-item>
                <el-dropdown-item command=2>钢材</el-dropdown-item>
                <el-dropdown-item command=3>芯片</el-dropdown-item>
                <el-dropdown-item command=4>物联网</el-dropdown-item>
              </el-dropdown-menu>
            </template>
          </el-dropdown>
        </template>
        <div class="underline" v-if="currentItem===2"></div>
      </div>
      <div class="header-item item3" @click="titleItemClick(3)">
        <template class="dropdown">
          <el-dropdown @command="commandItemClick3">
            <span class="el-dropdown-link">
              <p>物理</p><el-icon class="el-icon--right"><arrow-down/></el-icon>
            </span>
            <template #dropdown>
              <el-dropdown-menu>
                <el-dropdown-item command=1>电路</el-dropdown-item>
                <el-dropdown-item command=2>太空</el-dropdown-item>
                <el-dropdown-item command=3>力</el-dropdown-item>
                <el-dropdown-item command=4>电磁</el-dropdown-item>
              </el-dropdown-menu>
            </template>
          </el-dropdown>
        </template>
        <div class="underline" v-if="currentItem===3"></div>
      </div>
      <div class="header-item item4" @click="titleItemClick(4)">
        <template class="dropdown">
          <el-dropdown @command="commandItemClick4">
            <span class="el-dropdown-link">
              <p>化学</p><el-icon class="el-icon--right"><arrow-down/></el-icon>
            </span>
            <template #dropdown>
              <el-dropdown-menu>
                <el-dropdown-item command=1>液体</el-dropdown-item>
                <el-dropdown-item command=2>气体</el-dropdown-item>
                <el-dropdown-item command=3>固体</el-dropdown-item>
                <el-dropdown-item command=4>合成</el-dropdown-item>
              </el-dropdown-menu>
            </template>
          </el-dropdown>
        </template>
        <div class="underline" v-if="currentItem===4"></div>
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
  </div>


</template>

<script>
import {ArrowDown} from '@element-plus/icons-vue'

export default {
  name: "top",
  data() {
    return {
      isLogged: false,
      username: "蛄蛹者",
      currentItem: 0,
      knowledgeList: ['数组', '算式', '排序', '追及',
        '电路', '太空', '力', '电磁',
        '法律', '品德', '生活', '相处',
        '语法', '口语', '情景', '对话'],
    }
  },
  mounted() {
    this.ready();
  },
  methods: {
    ready() {
      //刷新后保持选中值不变
      let path = this.$route.path
      if (path === '/knowledge/kind1') {
        this.currentItem = 1;
      } else if (path === '/knowledge/kind2') {
        this.currentItem = 2;
      } else if (path === '/knowledge/kind3') {
        this.currentItem = 3;
      } else if (path === '/knowledge/kind4') {
        this.currentItem = 4;
      } else if (path === '/knowledge/index') {
        this.currentItem = 0;
      } else {
        this.currentItem = -1;
      }

      //判断用户登录
      let username = localStorage.getItem('username')
      console.log('username:' + username)
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
          this.$router.push('/knowledge/kind' + index);
          sessionStorage.setItem('index', 0)
          break;
      }
    },
    commandItemClick1(command) {
      this.currentItem = 1;
      this.$router.push('/knowledge/kind1');
      // console.log('click on command:' + command);
    },
    commandItemClick2(command) {
      this.currentItem = 2;
      this.$router.push('/knowledge/kind2');
      // console.log('click on command:' + command);
    },
    commandItemClick3(command) {
      this.currentItem = 3;
      this.$router.push('/knowledge/kind3');
      // console.log('click on command:' + command);
    },
    commandItemClick4(command) {
      this.currentItem = 4;
      this.$router.push('/knowledge/kind4');
      // console.log('click on command:' + command);
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

    p {
      font-size: 17px;
      font-family: "Helvetica", sans-serif;
      color: #e2e2e2;
    }

    .header-item {
      width: 100px;
      text-align: center;
      display: flex;
      flex-direction: column;
      cursor: pointer;

      .underline {
        position: absolute;
        width: 100px;
        height: 3px;
        margin-top: 35px;
        background-color: #c2c2c2;
      }

      .dropdown {
        display: flex;
        justify-content: center;

        .el-dropdown-link {
          cursor: pointer;
          color: #ffffff;
          display: flex;
          align-items: center;
          //有个乱出现的边界线，终于找到这个b了！
          &:focus-visible{
            outline:none;
          }
        }
      }

      &:hover {
        outline: none;
        & .dropdown .el-dropdown-link, & p {
          color: #a1a1a1;
          border: none;
        }

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
}


</style>
