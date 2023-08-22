<template>
  <div class="header">
    <div class="header-content">
      <div
          class="header-item"
          @click="titleItemClick(0)"
          style="width: 300px; text-align: left"
      >
        <p>YCEP网站</p>
      </div>
      <div class="header-item" @click="titleItemClick(0)">
        <p>首页</p>
        <div class="underline" v-if="currentItem === 0"></div>
      </div>

      <div
          class="header-item item1"
          :class="currentItem === kind.kindId ? 'selected' : ''"
          @click="titleItemClick(kind.kindId)"
          v-for="kind in kinds"
          :key="kind.kindId"
      >
        <template class="dropdown">
          <span class="el-dropdown-link">
            <p>{{ kind.kindName }}</p>
          </span>
        </template>
        <div class="underline" v-if="currentItem === kind.kindId"></div>
      </div>

      <template v-if="isLogged" class="dropdown" >
        <el-dropdown style="margin-left: 30px;">
          <div class="self">
            <el-avatar
                alt="用户头像"
                @click="selfCenterClick"
                class="self"
                src="https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2022%2F1110%2F0be1778cj00rl4jow0010c000hs00hsg.jpg&thumbnail=660x2147483647&quality=80&type=jpg"
            ></el-avatar>
            <p class="username" style="font-family: coca_cola, serif;font-size: 18px;text-align: center">
              {{ user.username }}
            </p>
          </div>
          <template #dropdown style="left: 20px;">
            <el-dropdown-menu>
              <el-dropdown-item @click="selfCenterClick">个人中心</el-dropdown-item>
              <el-dropdown-item @click="logout" divided>退出账号</el-dropdown-item>
            </el-dropdown-menu>
          </template>
        </el-dropdown>

        <button class="learn-more" @click="toThesis">
          <span class="circle" aria-hidden="true">
            <span class="icon arrow"></span>
          </span>
          <span class="button-text">生成论文</span>
        </button>
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
import {getCategory} from "../api/knowledge/kind";
import {logout} from "../api/user/login";

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
        default: {
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
      logout()
          .then((res: any) => {
            console.log("catagory");
            sessionStorage.clear();
            this.$router.push("/");
          })
          .catch((err: any) => {
            console.log(err);
          });
    },
    //生成论文
    toThesis() {
      this.$router.push("/user/thesis");
    }
  },
};
</script>

<style scoped lang="scss">
//$top_color: rgb(24, 26, 32);
$top_color: #ffffff;
//$font_color: #ffffff;
$font_color: #000000;
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

      &.selected {
        .dropdown .el-dropdown-link,
        .dropdown .el-dropdown-link p {
          color: $basic_color;
          font-weight: 550;
        }
      }

      .underline {
        position: absolute;
        width: 100px;
        height: 3px;
        margin-top: 35px;
        background-color: $basic_color;
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
    .el-avatar:focus-visible {
      outline: none;
    }
    .self {
      cursor: pointer;
      display: flex;
      .username{
        line-height: 40px;
        margin-left: 10px;
      }
      &:focus-visible {
        outline: none;
      }
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

button {
  position: relative;
  display: inline-block;
  cursor: pointer;
  outline: none;
  border: 0;
  vertical-align: middle;
  text-decoration: none;
  background: transparent;
  padding: 0;
  font-size: inherit;
  font-family: inherit;
}

button.learn-more {
  left: 100px;
  width: 10rem;
  height: auto;
}

button.learn-more .circle {
  transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
  position: relative;
  display: block;
  margin: 0;
  width: 45px;
  height: 45px;
  background: #282936;
  border-radius: 1.625rem;
}

button.learn-more .circle .icon {
  transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
  position: absolute;
  top: 0;
  bottom: 0;
  margin: auto;
  background: #fff;
}

button.learn-more .circle .icon.arrow {
  transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
  left: 0.625rem;
  width: 1.125rem;
  height: 0.125rem;
  background: none;
}

button.learn-more .circle .icon.arrow::before {
  position: absolute;
  content: "";
  top: -0.29rem;
  right: 0.0625rem;
  width: 0.625rem;
  height: 0.625rem;
  border-top: 0.125rem solid #fff;
  border-right: 0.125rem solid #fff;
  transform: rotate(45deg);
}

button.learn-more .button-text {
  transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  padding: 0.75rem 0;
  margin: 0 0 0 1.85rem;
  color: #282936;
  font-weight: 700;
  line-height: 1.4;
  text-align: center;
  text-transform: uppercase;
}

button:hover .circle {
  width: 100%;
}

button:hover .circle .icon.arrow {
  background: #fff;
  transform: translate(1rem, 0);
}

button:hover .button-text {
  color: #fff;
}
</style>
