<template>
  <div class="container">
    <div v-if="currentState===0" class="top">
      <p class="title">AI智能论文</p>
      <p class="desc">----智能助手伴你写论文----</p>
    </div>
    <div class="main">
      <div v-if="currentState===0" class="intro">
        <div class="title">
          <p class="text1">简单两步</p>
          <p class="text2">立即生成</p>
          <button class="edit-entry-btn" @click="editThesisClick">开始编辑</button>
        </div>
        <div class="blocks">
          <div class="block">
            <div class="info">
              <p class="text">① 智能助写</p>
              <div class="table">
                <p class="label">论文题目</p>
                <input readonly="readonly" placeholder="简单家庭电路分析" />
                <p class="label">摘要</p>
                <input readonly="readonly" placeholder="本研究旨在探讨将简易的电路知识，以提升中小学生对电路教育的兴趣和理解能力。"/>
                <p class="label">一、研究背景</p>
                <input readonly="readonly" placeholder="中小学生的综合素质教育需要注重培养学生的创新能力、问题解决能力和逻辑思维。"/>
                <p class="label">二、创意来源</p>
                <input readonly="readonly" placeholder="游戏设计灵感来自于经典的侦探故事和电路故障排查过程。"/>
              </div>
            </div>
          </div>
          <div class="block">
            <div class="info">
              <p class="text">② 论文预览</p>
              <div class="thesis">
                <p class="text1">简单家庭电路分析</p>
                <p class="text2">摘要</p>
                <p class="text3">本研究旨在探讨将简易的电路知识，以提升中小学生对电路教育的兴趣和理解能力。</p>
                <p class="text4">一、研究背景</p>
                <p class="text3">中小学生的综合素质教育需要注重培养学生的创新能力、问题解决能力和逻辑思维。</p>
                <p class="text4">二、创意来源</p>
                <p class="text3" style="-webkit-line-clamp:1">游戏设计灵感来自于经典的侦探故事和电路故障排查过程。</p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="steps-bar" v-if="currentState !== 0">
        <div class="steps">
          <div
              class="steps-item"
              :class="currentNav === 1 ? 'selected' : ''"
              @click="stepClick(1)"
          >
            <div class="steps-item-container">
              <div class="steps-item-icon">
                <span class="steps-text">1</span>
              </div>
              <div class="steps-item-content">
                <div class="steps-item-title">基本信息</div>
              </div>
            </div>
          </div>
          <div
              class="steps-item"
              :class="currentNav === 2 ? 'selected' : ''"
              @click="stepClick(2)"
          >
            <div class="steps-item-container">
              <div class="steps-item-icon">
                <span class="steps-text">2</span>
              </div>
              <div class="steps-item-content">
                <div class="steps-item-title">背景和必要性</div>
              </div>
            </div>
          </div>
          <div
              class="steps-item"
              :class="currentNav === 3 ? 'selected' : ''"
              @click="stepClick(3)"
          >
            <div class="steps-item-container">
              <div class="steps-item-icon">
                <span class="steps-text">3</span>
              </div>
              <div class="steps-item-content">
                <div class="steps-item-title">创意来源</div>
              </div>
            </div>
          </div>
          <div
              class="steps-item"
              :class="currentNav === 4 ? 'selected' : ''"
              @click="stepClick(4)"
          >
            <div class="steps-item-container">
              <div class="steps-item-icon">
                <span class="steps-text">4</span>
              </div>
              <div class="steps-item-content">
                <div class="steps-item-title">基本设计</div>
              </div>
            </div>
          </div>
          <div
              class="steps-item"
              :class="currentNav === 5 ? 'selected' : ''"
              @click="stepClick(5)"
          >
            <div class="steps-item-container">
              <div class="steps-item-icon">
                <span class="steps-text">5</span>
              </div>
              <div class="steps-item-content">
                <div class="steps-item-title">创新点</div>
              </div>
            </div>
          </div>
          <div
              class="steps-item"
              :class="currentNav === 6 ? 'selected' : ''"
              @click="stepClick(6)"
          >
            <div class="steps-item-container">
              <div class="steps-item-icon">
                <span class="steps-text">6</span>
              </div>
              <span class="ai-tip">AI</span>
              <div class="steps-item-content">
                <div class="steps-item-title">关键词和摘要</div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div v-if="currentState===1" class="paper">
        <el-form label-width="80px">
          <el-form-item label="论文题目">
            <el-input
                type="text"
                maxlength="20"
                show-word-limit
                v-model="thesis.title"
            />
          </el-form-item>
          <el-form-item label="作者">
            <el-input
                type="text"
                maxlength="10"
                show-word-limit
                v-model="thesis.author"
            />
          </el-form-item>
          <el-form-item label="学校">
            <el-input type="text" v-model="author.school" />
          </el-form-item>
          <el-form-item label="地址">
            <el-input type="text" v-model="author.address" />
          </el-form-item>
          <el-form-item label="邮编">
            <el-input type="text" v-model="author.zip" />
          </el-form-item>
        </el-form>
        <div class="buttons">
          <button class="next" @click="">回到首页</button>
          <button class="next" @click="nextStep(2)">下一步</button>
        </div>





      </div>
    </div>
    <!--AI智能助手-->
    <div  v-if="currentState===0" class="robot">
      <div class="chat-bubble">
        <input type="text" class="tip" placeholder="有什么不懂的来问我吧！"/>
        <div class="triangle"></div>
      </div>
      <img src="../../../assets/images/thesis/论文插画0.png" alt="">
    </div>
    <div class="chat">
      <div class="arrows">
        <img v-if="showUpArrow" class="up-arrow" @click="chatHeightUp" src="../../../assets/images/mobile/arrow_up.png" alt="" />
        <img v-if="showDownArrow" class="down-arrow" @click="chatHeightDown" src="../../../assets/images/mobile/arrow_down.png" alt="" />
      </div>
      <div class="chat-view" :style=chatHeight>
        <div class="chat-block ai">
          <img class="avatar" src="../../../assets/images/mobile/chatgpticon.png" alt="">
          <div class="chat-bubble">
            <div class="triangle"></div>
            <span class="bubble">有什么不懂的来问我吧!</span>
          </div>
        </div>
        <div class="chat-block user">
          <div class="chat-bubble">
            <span class="bubble">我不懂......</span>
            <div class="triangle"></div>
          </div>
          <img class="avatar" src="https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2022%2F1110%2F0be1778cj00rl4jow0010c000hs00hsg.jpg&thumbnail=660x2147483647&quality=80&type=jpg" alt="">
        </div>
      </div>
      <div class="message">
        <input class="user-input" type="text" placeholder="请输入你的问题...">
        <el-icon size="25">
          <Promotion @click="sendMessage()" />
        </el-icon>
      </div>

    </div>
  </div>


</template>

<script lang="ts">
import { defineComponent } from "vue";

export default defineComponent({
  name: "index",
  data() {
    return {
      data: "",
      chatHeight:"height: 150px",
      showUpArrow: true,
      showDownArrow: false,
      //当前状态：0为首页，1为编辑论文页，2为预览论文页
      currentState:0,
      currentNav:1,
      author: {
        school: "中南大学附属中学",
        address: "湖南省长沙市",
        zip: "410000",
      },
      thesis: {
        id: "1",
        time: "2023/8/6",
        kind: "物理",
        item: "电路",
        title: "简单电路的连接分析",
        author: "pr",
        address: "优胜路小学，湖南省长沙市，410000",
        brief:
            "本研究旨在探讨将简易的电路知识，以提升中小学生对电路教育的兴趣和理解能力。通过进行一个具有挑战性的游戏，培养学生的逻辑思维、实际问题解决能力和对电路故障的判断能力。游戏通过将电路故障作为关键线索，引导玩家找出偷窃宝石的嫌疑人，同时提供电路相关题目来加深学生的理解。",
        keywords: ["无线传感器", "网络", "电源电路", "电源效率"],
        content: [
          //一、
          "中小学生的综合素质教育需要注重培养学生的创新能力、问题解决能力和逻辑思维。电路教育作为实际应用领域，能够激发学生的兴趣。然而，传统的电路教育方式难以吸引学生。结合游戏设计，可以创造出一个更具趣味性和参与感的学习环境。\n" +
          '"电路侦探" 游戏的成功设计为中小学生的电路教育提供了一种新的途径。类似的方法也可以应用于其他学科，提高学生的学习积极性和效果。未来，可以进一步优化游戏设计，开发更多关卡和题目，扩展游戏的教育价值。',
          //二、
          "游戏设计灵感来自于经典的侦探故事和电路故障排查过程。设计的目标是将学习与娱乐相结合，通过解决电路故障问题，锻炼学生的逻辑思维和判断能力。\n" +
          "我们进行了一系列评估，包括问卷调查、知识测试和学生反馈，以评估创新方法在电路教育中的实际效果。结果表明，学生对于创新方法的学习体验更为积极，并且在知识掌握方面表现更优异。",
          //三、
          "我们设计了一组实验，对比了传统课堂教学和创新方法的教育效果。结果显示，采用创新方法的学生在电路知识的理解和问题解决能力方面表现出更明显的提升。\n" +
          "创新方法为中小学生电路教育带来了新的可能性。本研究的实验和评估结果表明，实际案例分析和互动式学习等方法能够有效地提升学生的学习兴趣和问题解决能力，为电路教育注入了新的活力。",
          //四、
          "本研究提出了以下创新方法，以改善中小学生的电路教育：\n" +
          "实际案例分析： 在课堂中引入实际电路故障案例，让学生从实际问题入手，深入理解电路原理和故障排除方法。\n" +
          "互动式学习： 通过小组合作、讨论和实验，在学生之间创造积极互动的学习氛围，培养他们的团队合作和沟通能力。",
        ],
      },
    };
  },
  components: {},
  mounted() {},
  methods: {
    ready() {},
    //对话框高度改变
    chatHeightUp() {
      if(this.chatHeight == "height: 150px") {
        this.showUpArrow = true;
        this.showDownArrow = true;
        this.chatHeight = "height: 400px";
      }
      else{
        this.chatHeight = "height: 600px";
        this.showUpArrow = false;
        this.showDownArrow = true;
      }
    },
    chatHeightDown() {
      if(this.chatHeight == "height: 600px"){
        this.chatHeight = "height: 400px";
        this.showUpArrow = true;
        this.showDownArrow = true;
      }else{
        this.chatHeight = "height: 150px";
        this.showUpArrow = true;
        this.showDownArrow = false;
      }
    },
    sendMessage() {

    },

    editThesisClick() {
      this.currentState = 1;
    },
    stepClick(index:number) {
      this.currentNav = index;
    },
  },
});
</script>

<style lang="scss" scoped>
@import '../../../assets/style/css/mobile/index.scss';
</style>
