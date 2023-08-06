<template>
  <!--  顶部导航栏-->
  <Top />

  <div class="container">
    <div class="main">
      <!-- 顶部轮播图 -->
      <div class="title-block">
        <el-carousel height="300px" :interval="10000">
          <el-carousel-item v-for="item in imageList" :key="item">
            <img :src="item" alt="轮播图" />
            <!--            <h3 class="small">{{ item }}</h3>-->
          </el-carousel-item>
        </el-carousel>
      </div>

      <div class="tags">
        <div class="tag-item">
          <el-icon size="40px"><Cpu /></el-icon>
          <p class="tag-text">AI协助</p>
        </div>
        <div class="tag-item">
          <el-icon size="40px"><VideoPlay /></el-icon>
          <p class="tag-text">配套游戏</p>
        </div>
        <div class="tag-item">
          <el-icon size="40px"><ChromeFilled /></el-icon>
          <p class="tag-text">支持联机</p>
        </div>
        <div class="tag-item">
          <el-icon size="40px"><DocumentChecked /></el-icon>
          <p class="tag-text">巩固练习</p>
        </div>
        <div class="tag-item">
          <el-icon size="40px"><Document /></el-icon>
          <p class="tag-text">生成论文</p>
        </div>
        <div class="tag-item">
          <el-icon size="40px"><DataAnalysis /></el-icon>
          <p class="tag-text">数据可视</p>
        </div>
      </div>

      <div class="body">
        <!--        <div class="left">-->
        <!--        </div>-->
        <div class="right">
          <!--知识点推荐（可左右翻页）-->
          <template class="block">
            <div class="block-title"><p>您可能感兴趣的知识</p></div>
            <div class="block-title eng">
              <p>Knowledge That May Interest You</p>
            </div>
            <div class="block-main">
              <div class="item1">
                <div class="image">
                  <img src="../../assets/images/宇宙.jpg" alt="知识点图片" />
                </div>
                <div class="cover">
                  <p class="p1">趣味物理</p>
                  <p class="p2">太阳系中有多少行星？</p>
                </div>
              </div>
              <div class="item1">
                <div class="image">
                  <img src="../../assets/images/氧气.jpg" alt="知识点图片" />
                </div>
                <div class="cover">
                  <p class="p1">微观化学</p>
                  <p class="p2">生活中的氧气是怎么来的？</p>
                </div>
              </div>
            </div>
            <template class="block-cards">
              <div
                class="card"
                v-for="item in knowledgeList"
                @click="klgDetailBtnClick(item.kind)"
                :key="item.id"
              >
                <div class="card-image">
                  <img :src="item.imgSrc" alt="背景图片" />
                </div>
                <div class="card-details">
                  <p class="text-title">{{ item.title }}</p>
                  <p class="text-body">{{ item.introduction }}</p>
                  <el-tag class="text-author">作者：{{ item.author }}</el-tag>
                </div>
                <button class="card-button">{{ item.kindName }}</button>
              </div>
            </template>
          </template>

          <!--游戏推荐（可左右翻页）-->
          <template class="block">
            <div class="block-title" style="margin-top: 50px">
              <p>您可能感兴趣的游戏</p>
            </div>
            <div class="block-title eng">
              <p>Games That May Interest You</p>
            </div>
            <div class="block-main">
              <div class="item2">
                <el-carousel height="200px" :interval="10000">
                  <el-carousel-item v-for="item in imageList2" :key="item">
                    <img :src="item" alt="轮播图" />
                    <!--                    <h3 class="small">{{ item }}</h3>-->
                  </el-carousel-item>
                </el-carousel>
              </div>
            </div>
            <template class="block-cards">
              <div
                class="card"
                v-for="item in gameList"
                :key="item.id"
                @click="klgDetailBtnClick(item.id)"
              >
                <div class="card-image">
                  <img :src="item.imgSrc" alt="背景图片" />
                </div>
                <div class="card-details">
                  <p class="text-title">{{ item.title }}</p>
                  <p class="text-body">{{ item.introduction }}</p>
                  <el-tag class="text-author">作者：{{ item.author }}</el-tag>
                </div>
                <button class="card-button">{{ item.kindName }}</button>
              </div>
            </template>
          </template>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import Top from "../../components/top.vue";
import { getKnowledge, getGame } from "../../api/knowledge/index";

export default defineComponent({
  name: "index",
  data() {
    return {
      //当前页
      pageNum: 1,
      //一页的个数
      pageSize: 5,
      imageList: [
        "/src/assets/images/demo/item1.jpg",
        "/src/assets/images/demo/item2.jpg",
        "/src/assets/images/demo/item3.jpg",
      ],
      imageList2: [
        "/src/assets/images/demo/game1.jpg",
        "/src/assets/images/demo/game2.jpg",
        "/src/assets/images/demo/game3.jpg",
      ],
      knowledgeList: [
        {
          title: "string",
          id: 0,
          author: "string",
          kindName: 3,
          introduction: "string",
          image: "/src/assets/images/灯泡.jpg",
        },
        {
          id: 2,
          imgSrc: "/src/assets/images/灯泡.jpg",
          title: "电路排查",
          kindName: 3,
          introduction: "家里的灯泡是怎么亮起来的呢？来这里一探究竟吧！",
          author: "冷月汐",
        },
        {
          id: 3,
          imgSrc: "/src/assets/images/灯泡.jpg",
          title: "电路排查",
          kindName: 3,
          introduction: "家里的灯泡是怎么亮起来的呢？来这里一探究竟吧！",
          author: "冷月汐",
        },
        {
          id: 4,
          imgSrc: "/src/assets/images/灯泡.jpg",
          title: "电路排查",
          kindName: 3,
          introduction: "家里的灯泡是怎么亮起来的呢？来这里一探究竟吧！",
          author: "冷月汐",
        },
        {
          id: 5,
          imgSrc: "/src/assets/images/氧气.jpg",
          title: "氧气制取",
          kindName: 3,
          introduction: "氧气瓶中的氧气是怎么制造出来呢？",
          author: "冷月汐",
        },
      ],
      gameList: [
        {
          id: 1,
          imgSrc: "/src/assets/images/demo/game1.jpg",
          title: "法庭疑案",
          kind: 2,
          kindName: "材料",
          introduction:
            "放学回家的小军路上做了一件事，竟然犯了法！法官有点发愁！",
          author: "机智的皇冠",
        },
        {
          id: 2,
          imgSrc: "/src/assets/images/demo/game2.jpg",
          title: "电路排查",
          kind: 3,
          kindName: "物理",
          introduction:
            "莉莉在正常工作，办公室的台灯却突然爆炸了！快来帮帮她吧！",
          author: "看手机东方红",
        },
        {
          id: 3,
          imgSrc: "/src/assets/images/demo/game3.jpg",
          title: "三态变化",
          kind: 4,
          kindName: "化学",
          introduction:
            "空气里究竟都有些什么状态的物质呢？小白走在路上发出了这样的疑问。",
          author: "梵蒂冈",
        },
        {
          id: 4,
          imgSrc: "/src/assets/images/demo/game1.jpg",
          title: "法庭疑案",
          kind: 2,
          kindName: "材料",
          introduction:
            "放学回家的小军路上做了一件事，竟然犯了法！法官有点发愁！",
          author: "机智的皇冠",
        },
        {
          id: 5,
          imgSrc: "/src/assets/images/demo/game2.jpg",
          title: "电路排查",
          kind: 3,
          kindName: "物理",
          introduction:
            "莉莉在正常工作，办公室的台灯却突然爆炸了！快来帮帮她吧！",
          author: "看手机东方红",
        },
      ],
    };
  },
  components: { Top },
  mounted() {
    this.ready()
  },
  methods: {
    ready() {
      this.showKnowledges();
      this.showGames();
    },

    showKnowledges() {
      let that = this;
      getKnowledge(that.pageNum, that.pageSize)
        .then((res: any) => {
          console.log(res);
          that.pageNum++;
          that.knowledgeList = res.data.knowledge;
        })
        .catch((err: any) => {
          console.log(err);
        });
    },

    showGames() {
      let that = this;
      getGame(that.pageNum, that.pageSize)
        .then((res: any) => {
          console.log(res);
          that.pageNum++;
          that.gameList = res.data.game;
        })
        .catch((err: any) => {
          console.log(err);
        });
    },

    //点击进入知识点详情
    klgDetailBtnClick(id: number) {
      this.$router.push("/knowledge/detail/" + id);
    },
  },
});
</script>

<style lang="scss" scoped>
@import "../../assets/style/css/knowledge/index.scss";
</style>
