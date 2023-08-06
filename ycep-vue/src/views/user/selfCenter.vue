<template>
  <!--  顶部导航栏-->
  <Top/>
  <div class="container">
    <div class="main">
      <div class="left">
        <div class="self-card">
          <div class="card">
            <div class="card__img">
              <img src="../../assets/images/techBack.jpg" alt="背景图片"/>
              <el-icon class="edit-bg" size="26">
                <Edit/>
              </el-icon>
            </div>
            <div class="card__avatar">
              <el-avatar src="https://i03piccdn.sogoucdn.com/5cf35c1052b8f21d" alt="背景图片"/>
            </div>
            <div class="card__title">{{ user.username }}
              <el-icon class="sex" v-if="user.sex === '女'" color="#ef20de">
                <Female/>
              </el-icon>
              <el-icon class="sex" v-if="user.sex === '男'" color="#2062ef">
                <Male/>
              </el-icon>
            </div>
            <div class="card__subtitle">{{ user.email }}</div>
            <div class="card__wrapper">
              <button class="card__btn">编辑信息</button>
              <button class="card__btn">退出系统</button>
            </div>
          </div>
        </div>
        <div class="left-nav">
          <el-row class="tac">
            <el-col>
              <el-menu
                  default-active="1"
                  class="el-menu-vertical-demo"
                  @select="leftNavClick"
              >
                <el-menu-item index="1">
                  <el-icon>
                    <Circle-Check/>
                  </el-icon>
                  <span>已学习知识</span>
                </el-menu-item>
                <el-menu-item index="2">
                  <el-icon>
                    <Document/>
                  </el-icon>
                  <span>学习论文</span>
                </el-menu-item>
                <el-menu-item index="3">
                  <el-icon>
                    <View/>
                  </el-icon>
                  <span>浏览记录</span>
                </el-menu-item>
                <el-menu-item index="4">
                  <el-icon>
                    <Star/>
                  </el-icon>
                  <span>我的感兴趣</span>
                </el-menu-item>
                <el-menu-item index="5">
                  <el-icon>
                    <User/>
                  </el-icon>
                  <span>个人账户</span>
                </el-menu-item>
              </el-menu>
            </el-col>
          </el-row>
        </div>
      </div>
      <div class="right">
        <div class="detail page1" v-if="currentNav == 1">
          <div class="title">已学习知识>></div>
          <br/>
          <hr/>
          <div class="kind">
            <div
                v-for="(kind, index) in kindList"
                :key="index"
                class="title-item"
                :class="{ selected: selectedKind == index }"
                @click="kindClick(index)"
            >
              <p class="text">{{ kind }}</p>
            </div>
          </div>
          <div class="content">
            <div
                class="item"
                v-for="item in knowledgeInfoList"
                :key="item.id"
                @click="klgDetailBtnClick(item.id)"
            >
              <div class="knowledge">
                <div class="image">
                  <img :src="item.imgSrc" alt="知识点图片"/>
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
                    <img :src="item.game.imgSrc" alt="背景图片"/>
                  </div>
                  <div class="card-details">
                    <p class="text-title">{{ item.game.title }}</p>
                    <el-tag class="text-author">作者：{{ item.game.author }}
                    </el-tag>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="detail page2" v-if="currentNav == 2">
          <div class="title">学习论文>></div>
          <br/>
          <hr/>
          <div class="kind">
            <div
                v-for="(kind, index) in kindList"
                :key="index"
                class="title-item"
                :class="{ selected: selectedKind == index }"
                @click="kindClick(index)"
            >
              <p class="text">{{ kind }}</p>
            </div>
          </div>
        </div>
        <div class="detail page2" v-if="currentNav == 3">
          <div class="title">浏览记录>></div>
          <br/>
          <hr/>
          <div class="kind">
            <div
                v-for="(kind, index) in kindList"
                :key="index"
                class="title-item"
                :class="{ selected: selectedKind == index }"
                @click="kindClick(index)"
            >
              <p class="text">{{ kind }}</p>
            </div>
          </div>
        </div>
        <div class="detail page3" v-if="currentNav == 4">
          <div class="title">我的感兴趣>></div>
        </div>
        <div class="detail page4" v-if="currentNav == 5">
          <div class="title">个人账户>></div>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import {defineComponent} from "vue";
import Top from "../../components/top.vue";

export default defineComponent({
  name: "selfCenter",
  data() {
    return {
      data: "",
      currentNav: 1,
      user: {
        account: 3,
        username: "pr",
        sex: "男",
        phone: "18312341234",
        email: "asdfghhjkl@test.com",
        school: "中南",
        description: "无"
      },
      knowledgeInfoList: [
        {
          id: 1,
          imgSrc: "/src/assets/images/灯泡.jpg",
          title: "Spring Boot 单元测试",
          content:
              "Spring Boot 中进行单元测试是一个常见的做法，可以帮助你验证应用程序的各个组件是否按预期工作。所以我们有必要去学习一番！一、什么是单元测试？🍭 单元测试（unit testing），是指对软件中的最小可测试单元进行检查和验证的过程就叫单元测试。单元测试是开发者编写的一小段代码，用于检验被测代码的⼀个很小的、很明确的（代码）功能是否正确。执行单元测试就是为了证明某段代码的执行结果是否符合我们的预期。如果测试结果符合我们的预期，称之为测试通过，否则就是测试未通过（或者叫测试失败）。",
          author: "冷雪兮",
          game: {
            id: 1,
            imgSrc: "/src/assets/images/demo/game1.jpg",
            title: "法庭疑案",
            kind: 2,
            kindName: "材料",
            body: "放学回家的小军路上做了一件事，竟然犯了法！法官有点发愁！",
            author: "机智的皇冠",
          },
        },
        {
          id: 1,
          imgSrc: "/src/assets/images/灯泡.jpg",
          title: "Spring Boot 单元测试",
          content:
              "Spring Boot 中进行单元测试是一个常见的做法，可以帮助你验证应用程序的各个组件是否按预期工作。所以我们有必要去学习一番！一、什么是单元测试？🍭 单元测试（unit testing），是指对软件中的最小可测试单元进行检查和验证的过程就叫单元测试。单元测试是开发者编写的一小段代码，用于检验被测代码的⼀个很小的、很明确的（代码）功能是否正确。执行单元测试就是为了证明某段代码的执行结果是否符合我们的预期。如果测试结果符合我们的预期，称之为测试通过，否则就是测试未通过（或者叫测试失败）。",
          author: "冷雪兮",
          game: {
            id: 1,
            imgSrc: "/src/assets/images/demo/game1.jpg",
            title: "法庭疑案",
            kind: 2,
            kindName: "材料",
            body: "放学回家的小军路上做了一件事，竟然犯了法！法官有点发愁！",
            author: "机智的皇冠",
          },
        },
        {
          id: 1,
          imgSrc: "/src/assets/images/灯泡.jpg",
          title: "Spring Boot 单元测试",
          content:
              "Spring Boot 中进行单元测试是一个常见的做法，可以帮助你验证应用程序的各个组件是否按预期工作。所以我们有必要去学习一番！一、什么是单元测试？🍭 单元测试（unit testing），是指对软件中的最小可测试单元进行检查和验证的过程就叫单元测试。单元测试是开发者编写的一小段代码，用于检验被测代码的⼀个很小的、很明确的（代码）功能是否正确。执行单元测试就是为了证明某段代码的执行结果是否符合我们的预期。如果测试结果符合我们的预期，称之为测试通过，否则就是测试未通过（或者叫测试失败）。",
          author: "冷雪兮",
          game: {
            id: 1,
            imgSrc: "/src/assets/images/demo/game1.jpg",
            title: "法庭疑案",
            kind: 2,
            kindName: "材料",
            body: "放学回家的小军路上做了一件事，竟然犯了法！法官有点发愁！",
            author: "机智的皇冠",
          },
        },
        {
          id: 1,
          imgSrc: "/src/assets/images/灯泡.jpg",
          title: "Spring Boot 单元测试",
          content:
              "Spring Boot 中进行单元测试是一个常见的做法，可以帮助你验证应用程序的各个组件是否按预期工作。所以我们有必要去学习一番！一、什么是单元测试？🍭 单元测试（unit testing），是指对软件中的最小可测试单元进行检查和验证的过程就叫单元测试。单元测试是开发者编写的一小段代码，用于检验被测代码的⼀个很小的、很明确的（代码）功能是否正确。执行单元测试就是为了证明某段代码的执行结果是否符合我们的预期。如果测试结果符合我们的预期，称之为测试通过，否则就是测试未通过（或者叫测试失败）。",
          author: "冷雪兮",
          game: {
            id: 1,
            imgSrc: "/src/assets/images/demo/game1.jpg",
            title: "法庭疑案",
            kind: 2,
            kindName: "材料",
            body: "放学回家的小军路上做了一件事，竟然犯了法！法官有点发愁！",
            author: "机智的皇冠",
          },
        },
        {
          id: 1,
          imgSrc: "/src/assets/images/灯泡.jpg",
          title: "Spring Boot 单元测试",
          content:
              "Spring Boot 中进行单元测试是一个常见的做法，可以帮助你验证应用程序的各个组件是否按预期工作。所以我们有必要去学习一番！一、什么是单元测试？🍭 单元测试（unit testing），是指对软件中的最小可测试单元进行检查和验证的过程就叫单元测试。单元测试是开发者编写的一小段代码，用于检验被测代码的⼀个很小的、很明确的（代码）功能是否正确。执行单元测试就是为了证明某段代码的执行结果是否符合我们的预期。如果测试结果符合我们的预期，称之为测试通过，否则就是测试未通过（或者叫测试失败）。",
          author: "冷雪兮",
          game: {
            id: 1,
            imgSrc: "/src/assets/images/demo/game1.jpg",
            title: "法庭疑案",
            kind: 2,
            kindName: "材料",
            body: "放学回家的小军路上做了一件事，竟然犯了法！法官有点发愁！",
            author: "机智的皇冠",
          },
        },
      ],
      kindList: ['全部','编程','材料','物理','化学'],
      selectedKind:0,
    };
  },
  components: {Top},
  mounted() {
  },
  methods: {
    ready() {
    },
    leftNavClick(index: number) {
      this.currentNav = index;
      this.selectedKind = 0;
    },
    //点击进入知识点详情
    klgDetailBtnClick(id: number) {
      this.$router.push("/knowledge/detail/" + id);
    },
    kindClick(index: number) {
      this.selectedKind = index;
    }

  },
});
</script>

<style lang="scss" scoped>
@import "../../assets/style/css/user/selfCenter.scss";
</style>
