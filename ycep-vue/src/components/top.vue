<template>
  <div class="header">
    <div class="header-content">
      <div
        class="header-item"
        @click="titleItemClick(-1)"
        style="width: 400px; text-align: left"
      >
        <p>YCEP网站</p>
      </div>
      <div class="header-item" @click="titleItemClick(0)">
        <p>首页</p>
        <div class="underline" v-if="currentItem === 0"></div>
      </div>

      <div
        class="header-item item1"
        @click="titleItemClick(kind.kindId)"
        v-for="kind in kinds"
        :key="kind.kindId"
      >
        <template class="dropdown">
          <el-dropdown @command="commandItemClick">
            <span class="el-dropdown-link">
              <p>{{ kind.kindName }}</p>
              <el-icon class="el-icon--right"><arrow-down /></el-icon>
            </span>
            <template #dropdown>
              <el-dropdown-menu>
                <el-dropdown-item command="1">排序算法</el-dropdown-item>
                <el-dropdown-item command="2">数组</el-dropdown-item>
                <el-dropdown-item command="3">链表</el-dropdown-item>
                <el-dropdown-item command="4">对象</el-dropdown-item>
              </el-dropdown-menu>
            </template>
          </el-dropdown>
        </template>
        <div class="underline" v-if="currentItem === kind.kindId"></div>
      </div>
      <!-- <div class="header-item item1" @click="titleItemClick(2)">
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
      <div class="header-item item1" @click="titleItemClick(3)">
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
      <div class="header-item item1" @click="titleItemClick(4)">
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
      </div> -->

      <template v-if="isLogged">
        <el-avatar
          alt="用户头像"
          @click="selfCenterClick"
          class="self"
          src="https://i03piccdn.sogoucdn.com/5cf35c1052b8f21d"
        ></el-avatar>
        <div class="self" @click="selfCenterClick">
          <p class="username">{{ user.username }}</p>
        </div>
        <div class="header-item" @click="logout">
          <p>退出账号</p>
        </div>
      </template>
      <template v-else>
        <div class="header-item login">
          <button @click="loginBtnClick">
            登录
            <div class="arrow-wrapper">
              <div class="arrow"></div>
            </div>
          </button>
        </div>
      </template>
    </div>
  </div>
</template>

<script lang="ts">
import { getCategory } from "../api/knowledge/kind";

export default {
  name: "top",
  data() {
    return {
      kinds: [
        {
          kindId: 1,
          kindName: "编程",
        },
      ],
      isLogged: false,
      user: {
        username: "蛄蛹者",
        password: "123",
        chosenInterests: false,
      },
      currentItem: 0,
      knowledgeList: [
        "数组",
        "算式",
        "排序",
        "追及",
        "电路",
        "太空",
        "力",
        "电磁",
        "法律",
        "品德",
        "生活",
        "相处",
        "语法",
        "口语",
        "情景",
        "对话",
      ],
    };
  },
  mounted() {
    this.ready();
    this.category();
  },
  methods: {
    ready() {
      //刷新后保持选中值不变
      let path = this.$route.params.kindID;
      this.currentItem = Number(path);
      //判断用户登录
      let username = sessionStorage.getItem("username");
      console.log("username:" + username);
      if (username !== "" && username) {
        this.isLogged = true;
        this.user.username = username;
      }
    },
    category() {
      let that = this;
      getCategory()
        .then((res: any) => {
          console.log("catagory");
          console.log(res);
          that.kinds = res.data;
        })
        .catch((err: any) => {
          console.log(err);
        });
    },
    titleItemClick(index: any) {
      console.log(index);
      this.currentItem = index;
      switch (index) {
        case -1:
          this.$router.push("/");
          break;
        case 0:
          this.currentItem = 0;
          this.$router.push("/knowledge/index");
          break;
        default:{
          console.log(1);
          this.$router.push("/knowledge/kind/" + index);
        }
          // sessionStorage.setItem('index', '0')
          break;
      }
    },

    commandItemClick(command: any) {
      this.currentItem = command;
      this.$emit("getTopData1", command);
      this.$router.push("/knowledge/kind" + command);
    },
    selfCenterClick() {
      this.$router.push("/user/selfCenter");
    },
    loginBtnClick() {
      this.$router.push("/user/login");
    },
    logout() {
      sessionStorage.clear();
      this.$router.push("/");
    },
  },
};
</script>

<style scoped lang="scss">
//$top_color: rgb(24, 26, 32);
$top_color:#ffffff;
//$font_color: #ffffff;
$font_color:#000000;
$font_color_hover: #a2a2a2;

.header {
  border-bottom: 2px #eaeaea solid;
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
      color: $font_color;
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
        background-color: $font_color;
      }

      .dropdown {
        display: flex;
        justify-content: center;

        .el-dropdown-link {
          cursor: pointer;
          color: $font_color;
          display: flex;
          align-items: center;
          //有个乱出现的边界线，终于找到这个b了！
          &:focus-visible {
            outline: none;
          }
        }
      }

      &:hover {
        outline: none;
        & .dropdown .el-dropdown-link,
        & p {
          color: $font_color_hover;
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
