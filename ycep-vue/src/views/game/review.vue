<template>
  <!--  顶部导航栏-->
  <Top/>
  <div class="container">
    <div class="main">
      <div class="congratulations" v-if="testVisible">
        <div class="card">恭喜你完成知识点和游戏的全部过程！来巩固一下知识吧！</div>
      </div>
      <div class="congratulations" v-if="reviewVisible">
        <div class="card">恭喜你完成试题！来查看一下错题和解析吧！</div>
      </div>
      <div class="test" v-if="testVisible">
        <div class="item" v-for="(item,itemIndex) in test">
          <div class="question">
            <p class="index">{{ itemIndex + 1 }}、 </p>
            <p class="text">{{ item.question }}</p>
          </div>
          <div class="choices">
            <div class="choice-item" v-for="(choice,choiceIndex) in item.choice"
                 @click="choiceItemClick(itemIndex,choiceIndex)"
                 :class="test[itemIndex].selected===choiceIndex?'selected':''">
              <div class="choice-icon" v-if="choiceIndex === 0">A</div>
              <div class="choice-icon" v-if="choiceIndex === 1">B</div>
              <div class="choice-icon" v-if="choiceIndex === 2">C</div>
              <div class="choice-icon" v-if="choiceIndex === 3">D</div>
              <p class="choice-name">{{ choice }}</p>
            </div>
          </div>
        </div>
      </div>
      <div class="actions" v-if="testVisible">
        <button class="button cancel" @click="backToKlg">返回知识点</button>
        <button class="button confirm" @click="confirmTest">提交试卷</button>
      </div>

      <div class="review" v-if="reviewVisible">
        <div class="item" v-for="(item,itemIndex) in test">
          <div class="question">
            <p class="index">{{ itemIndex + 1 }}、 </p>
            <p class="text">{{ item.question }}</p>
          </div>
          <div class="choices">
            <div class="choice-item" v-for="(choice,choiceIndex) in item.choice"
                 :class="[test[itemIndex].answer===choiceIndex?'right':'',
                 test[itemIndex].answer!==choiceIndex && choiceIndex===test[itemIndex].selected?'wrong':'']">
              <div class="choice-icon" v-if="choiceIndex === 0">A</div>
              <div class="choice-icon" v-if="choiceIndex === 1">B</div>
              <div class="choice-icon" v-if="choiceIndex === 2">C</div>
              <div class="choice-icon" v-if="choiceIndex === 3">D</div>
              <p class="choice-name">{{ choice }}</p>
            </div>
          </div>
          <div class="explain">
            <p class="title">解析：</p>
            <p class="content">{{item.explain}}</p>
          </div>
        </div>

      </div>
      <div class="actions" v-if="reviewVisible">
        <button class="button cancel" @click="backToKlg">返回知识点</button>
        <button class="button confirm" @click="confirmTest">生成论文</button>
      </div>
    </div>
    <div class="mask" v-if="scoreVisible"></div>
    <div class="score" v-if="scoreVisible">
      <el-icon class="close" size="30"><Close /></el-icon>
      <div class="content">
        <div class="results-summary-container">
          <div class="confetti">
            <div class="confetti-piece"></div>
            <div class="confetti-piece"></div>
            <div class="confetti-piece"></div>
            <div class="confetti-piece"></div>
            <div class="confetti-piece"></div>
            <div class="confetti-piece"></div>
            <div class="confetti-piece"></div>
            <div class="confetti-piece"></div>
            <div class="confetti-piece"></div>
            <div class="confetti-piece"></div>
            <div class="confetti-piece"></div>
            <div class="confetti-piece"></div>
            <div class="confetti-piece"></div>
            <div class="confetti-piece"></div>
            <div class="confetti-piece"></div>
            <div class="confetti-piece"></div>
            <div class="confetti-piece"></div>
            <div class="confetti-piece"></div>
            <div class="confetti-piece"></div>
          </div>
          <div class="results-summary-container__result">
            <div class="heading-tertiary">恭喜您</div>
            <div class="result-box">
              <div class="heading-primary">{{ userScore }}</div>
              <p class="result">of {{ fullScore }}</p>
            </div>
            <div class="result-text-box">
              <div class="heading-secondary" v-if="fullScore / userScore >= 0.9">Excellent</div>
              <div class="heading-secondary" v-else-if="fullScore / userScore >= 0.8">Great</div>
              <div class="heading-secondary" v-else-if="fullScore / userScore >= 0.6">Good</div>
              <div class="heading-secondary" v-else>Sorry</div>
              <p class="paragraph">
                在这次考试中，您的得分超过78%的同学！真棒，希望你在接下来的学习中继续加油！
              </p>
            </div>
            <div class="summary__cta">
              <button class="btn btn__continue" @click="toThesis">生成论文</button>
              <button class="btn btn__continue" @click="testReview">查看错题</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

</template>

<script lang="ts">
import {defineComponent} from "vue";
import Top from "../../components/top.vue";

export default defineComponent({
  name: "review",
  data() {
    return {
      data: "",
      scoreVisible: false,
      test: [
        {
          question: "你说的国家大事不回家",
          choice: [
            "对", "错", "都行", "我不知道"
          ],
          answer: 0,
          explain: "束带结发宏观环境水电费合计打撒,束带结发宏观环境水电费合计打撒,束带结发宏观环境水电费合计打撒,束带结发宏观环境水电费合计打撒,束带结发宏观环境水电费合计打撒",
          score: 20,
          selected: 0,
        },
        {
          question: "你说的国家大事不回家",
          choice: [
            "对", "错", "都行", "我不知道"
          ],
          answer: 0,
          explain: "束带结发宏观环境水电费合计打撒",
          score: 20,
          selected: 1,
        },
        {
          question: "你说的国家大事不回家",
          choice: [
            "对", "错", "都行", "我不知道"
          ],
          answer: 0,
          explain: "束带结发宏观环境水电费合计打撒",
          score: 20,
          selected: 0,
        },
        {
          question: "你说的国家大事不回家",
          choice: [
            "对", "错", "都行", "我不知道"
          ],
          answer: 0,
          explain: "束带结发宏观环境水电费合计打撒",
          score: 20,
          selected: 0,
        },
        {
          question: "你说的国家大事不回家",
          choice: [
            "对", "错", "都行", "我不知道"
          ],
          answer: 0,
          explain: "束带结发宏观环境水电费合计打撒",
          score: 20,
          selected: 0,
        },
      ],
      fullScore:100,
      userScore:90,
      testVisible: true,
      reviewVisible: false,
    };
  },
  components: {Top},
  mounted() {
  },
  methods: {
    ready() {
    },
    backToKlg() {
      this.$router.go(-2);
    },
    confirmTest() {
      let userScore = 0;
      for (let i = 0; i < this.test.length ; i++) {
        if(this.test[i].selected == this.test[i].answer)
          userScore += this.test[i].score;
      }
      this.userScore = userScore;
      this.scoreVisible = true;
      //返回顶部
      document.documentElement.scrollTop = 0;
    },
    testReview() {
      this.testVisible = false;
      this.reviewVisible = true;
      this.scoreVisible = false;
    },
    toThesis() {
      this.$router.push('/user/thesis');
    },
    choiceItemClick(itemIndex: number, choiceIndex: number) {
      this.test[itemIndex].selected = choiceIndex;
    }
  },
});
</script>

<style lang="scss" scoped>
@import "../../assets/style/css/game/review.scss";
</style>
