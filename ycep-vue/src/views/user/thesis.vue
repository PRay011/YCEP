<template>
  <!--  顶部导航栏-->
  <Top />

  <div class="container">
    <div class="main">
      <div class="header">
        <p class="title">生成论文</p>
        <div class="actions">
          <button class="backToTest" @click="backToTestClick">回到试题</button>
          <button class="backToKnowledge" @click="backToKnowledgeClick">
            重新学习
          </button>
        </div>
      </div>
      <div class="content">
        <div class="left">
          <el-row class="tac">
            <el-col>
              <el-menu
                default-active="1"
                class="el-menu-vertical-demo"
                @select="leftNavClick"
              >
                <el-menu-item index="1">
                  <el-icon>
                    <Circle-Check />
                  </el-icon>
                  <span>基本信息</span>
                </el-menu-item>
                <el-menu-item index="2">
                  <el-icon>
                    <House />
                  </el-icon>
                  <span>背景&必要性</span>
                </el-menu-item>
                <el-menu-item index="3">
                  <el-icon>
                    <MagicStick />
                  </el-icon>
                  <span>创意来源</span>
                </el-menu-item>
                <el-menu-item index="4">
                  <el-icon>
                    <DataAnalysis />
                  </el-icon>
                  <span>基本设计</span>
                </el-menu-item>
                <el-menu-item index="5">
                  <el-icon>
                    <Magnet />
                  </el-icon>
                  <span>创新点</span>
                </el-menu-item>
                <el-menu-item index="6">
                  <el-icon>
                    <Key />
                  </el-icon>
                  <span>摘要&关键词</span>
                </el-menu-item>
                <el-menu-item index="7">
                  <el-icon>
                    <Document />
                  </el-icon>
                  <span>预览论文</span>
                </el-menu-item>
              </el-menu>
            </el-col>
          </el-row>
        </div>
        <div class="middle">
          <el-scrollbar height="600px">
            <div class="paper" v-if="currentNav == 1">
              <p class="title">基本信息>></p>
              <hr />
              <el-form label-width="150px">
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
                <el-form-item label="学校&地址&邮编">
                  <el-input type="text" v-model="thesis.address" />
                </el-form-item>
              </el-form>
            </div>
            <div class="paper" v-if="currentNav == 2">
              <p class="title">研究背景和必要性分析>></p>
              <hr />
              <el-form>
                <span class="chapter-name">一、研究背景和必要性分析</span>
                <el-input
                  type="textarea"
                  v-model="thesis.content[0]"
                  :autosize="{ minRows: 18 }"
                ></el-input>
              </el-form>
            </div>
            <div class="paper" v-if="currentNav == 3">
              <p class="title">创意来源>></p>
              <hr />
              <el-form>
                <span class="chapter-name">二、创意来源</span>
                <el-input
                  type="textarea"
                  v-model="thesis.content[1]"
                  :autosize="{ minRows: 18 }"
                ></el-input>
              </el-form>
            </div>
            <div class="paper" v-if="currentNav == 4">
              <p class="title">基本设计>></p>
              <hr />
              <el-form>
                <span class="chapter-name">三、基本设计</span>
                <el-input
                  type="textarea"
                  v-model="thesis.content[2]"
                  :autosize="{ minRows: 18 }"
                ></el-input>
              </el-form>
            </div>
            <div class="paper" v-if="currentNav == 5">
              <p class="title">创新点>></p>
              <hr />
              <el-form>
                <span class="chapter-name">三、创新点</span>
                <el-input
                  type="textarea"
                  v-model="thesis.content[3]"
                  :autosize="{ minRows: 18 }"
                ></el-input>
              </el-form>
            </div>
            <div class="paper" v-if="currentNav == 6">
              <span style="display: flex; justify-content: space-between">
                <p class="title">摘要&关键词>></p>
                <button class="aiBtn" @click="aiKeywordsClick">AI生成</button>
              </span>
              <hr />
              <el-form label-width="80px">
                <el-form-item label="关键词">
                  <el-tag
                    v-for="tag in thesis.keywords"
                    :key="tag"
                    class="mx-1"
                    closable
                    :disable-transitions="false"
                    @close="handleClose(tag)"
                  >
                    {{ tag }}
                  </el-tag>
                  <el-input
                    v-if="inputVisible"
                    ref="InputRef"
                    v-model="inputValue"
                    class="ml-1 w-20"
                    size="small"
                    @keyup.enter="handleInputConfirm"
                    @blur="handleInputConfirm"
                  />
                  <el-button
                    v-else
                    class="button-new-tag ml-1"
                    size="small"
                    @click="showInput"
                  >
                    + 关键词
                  </el-button>
                </el-form-item>
                <el-form-item label="摘要">
                  <el-input
                    type="textarea"
                    v-model="thesis.brief"
                    :autosize="{ minRows: 10, maxRows: 50 }"
                  />
                </el-form-item>
              </el-form>
            </div>
            <div class="paper-content" v-if="currentNav == 7" id="printDiv">
              <div class="block1">
                <p class="text1">{{ thesis.time }}</p>
                <p class="text2">青少年创新教育平台</p>
                <p class="text1">{{ thesis.kind }}/{{ thesis.item }}</p>
              </div>
              <hr />
              <hr />
              <div class="block2">
                <p class="text1">{{ thesis.title }}</p>
                <p class="text2">{{ thesis.author }}</p>
                <p class="text3">（{{ thesis.address }}）</p>
              </div>
              <br />

              <div class="block3">
                <p class="text1">摘要：</p>
                <p class="text2">&emsp;&emsp;{{ thesis.brief }}</p>
                <p class="text1">
                  关键词：&emsp;
                  <template v-for="keyword in thesis.keywords"
                    >{{ keyword }};&emsp;</template
                  >
                </p>
              </div>
              <br /><br />
              <div class="block4">
                <p class="text1">一、研究背景和必要性分析</p>
                <p class="text2">&emsp;&emsp;{{ thesis.content[0] }}</p>
                <p class="text1">二、创意来源</p>
                <p class="text2">&emsp;&emsp;{{ thesis.content[1] }}</p>
                <p class="text1">三、基本设计</p>
                <p class="text2">&emsp;&emsp;{{ thesis.content[2] }}</p>
                <p class="text1">四、创新点</p>
                <p class="text2">&emsp;&emsp;{{ thesis.content[3] }}</p>
              </div>
              <br /><br />
              <hr />
              <hr />
              <div class="block1">
                <p class="text1">{{ thesis.time }}</p>
                <p class="text2">青少年创新教育平台</p>
                <p class="text1">{{ thesis.kind }}/{{ thesis.item }}</p>
              </div>
            </div>
          </el-scrollbar>
          <div class="btn-container" v-if="currentNav == 7">
            <button @click="editPaperBtnClick">继续编辑</button>
            <button @click="confirmPaperBtnClick">确认生成</button>
            <button @click="downloadThesis">下载论文</button>
          </div>
        </div>
        <div class="right">
          <div class="chat-box" id="chatBox">
            <div class="title">
              <el-icon size="30">
                <ChatLineSquare />
              </el-icon>
              <p class="text">AI助手帮你写论文</p>
              <p class="refresh" @click="refreash()">
                <span>重置会话</span>
                <el-icon size="20"><Refresh /></el-icon>
              </p>
            </div>
            <!-- 这里将显示聊天消息 -->
            <el-scrollbar height="600px">
              <div class="message ai">
                <p>当前正在搜索：{{ sessionPart }}</p>
              </div>
              <div class="message ai">
                <p>AI： 有什么可以帮助您？</p>
              </div>
              <template
                v-for="(conversation, index) in conversations"
                :key="index"
              >
                <div class="message user">
                  <p>你：{{ conversation.user }}</p>
                </div>
                <div
                  class="message ai"
                  v-if="
                    conversation.ai !== null && conversation.ai !== 'waiting...'
                  "
                >
                  <p>AI： {{ conversation.ai }}</p>
                </div>
              </template>
            </el-scrollbar>
          </div>
          <div class="user-input">
            <input
              type="text"
              v-model="userMessage"
              placeholder="在此输入消息..."
            />
            <button @click="sendMessage()">发送</button>
          </div>
        </div>
      </div>
      <el-dialog
        v-model="confirmDialogVisible"
        title="恭喜你完成论文"
        width="32%"
        center
        top="150px"
      >
        <div class="content">
          <img src="../../assets/images/paper-icon.png" alt="论文配图" />
        </div>
        <template #footer>
          <span class="dialog-footer">
            <el-button @click="backToIndexClick">回到首页</el-button>
            <el-button type="primary" @click="toSelfCenter">
              个人主页
            </el-button>
          </span>
        </template>
      </el-dialog>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import Top from "../../components/top.vue";

import { nextTick, ref } from "vue";
import { ElInput, ElMessage } from "element-plus";
import { getPdf } from "../../utils/htmlToPdf";
import {
  createSession,
  chat,
  refreshSession,
  deleteSession,
  getBasicThesis,
  getKeywordsAndBrief,
} from "../../api/user/thesis";
// import { content } from "html2canvas/dist/types/css/property-descriptors/content";
// // import printJS from 'print-js'
// // import html2Canvas from 'html2Canvas'

const InputRef = ref<InstanceType<typeof ElInput>>();

export default defineComponent({
  name: "thesis",
  data() {
    return {
      id: "",
      data: "",
      currentNav: 1,
      inputVisible: false,
      inputValue: "",
      thesis: {
        id: "1",
        time: "2023/8/6",
        kind: "物理",
        item: "电路",
        title: "简单电路的连接分析",
        author: "pr",
        address: "优胜北路第三小学，湖南 长沙，410000",
        brief:
          "本研究旨在探讨将简易的电路知识，以提升中小学生对电路教育的兴趣和理解能力。通过进行一个具有挑战性的游戏，培养学生的逻辑思维、实际问题解决能力和对电路故障的判断能力。游戏通过将电路故障作为关键线索，引导玩家找出偷窃宝石的嫌疑人，同时提供电路相关题目来加深学生的理解。",
        keywords: ["无线传感器", "网络", "电源电路", "电源效率"],
        content: [
          //一、
          "中小学生的综合素质教育需要注重培养学生的创新能力、问题解决能力和逻辑思维。电路教育作为实际应用领域，能够激发学生的兴趣。然而，传统的电路教育方式难以吸引学生。结合游戏设计，可以创造出一个更具趣味性和参与感的学习环境。\n" +
            "\n" +
            '"电路侦探" 游戏的成功设计为中小学生的电路教育提供了一种新的途径。类似的方法也可以应用于其他学科，提高学生的学习积极性和效果。未来，可以进一步优化游戏设计，开发更多关卡和题目，扩展游戏的教育价值。',
          //二、
          "游戏设计灵感来自于经典的侦探故事和电路故障排查过程。设计的目标是将学习与娱乐相结合，通过解决电路故障问题，锻炼学生的逻辑思维和判断能力。\n" +
            "\n" +
            "我们进行了一系列评估，包括问卷调查、知识测试和学生反馈，以评估创新方法在电路教育中的实际效果。结果表明，学生对于创新方法的学习体验更为积极，并且在知识掌握方面表现更优异。",
          //三、
          "我们设计了一组实验，对比了传统课堂教学和创新方法的教育效果。结果显示，采用创新方法的学生在电路知识的理解和问题解决能力方面表现出更明显的提升。\n" +
            "\n" +
            "创新方法为中小学生电路教育带来了新的可能性。本研究的实验和评估结果表明，实际案例分析和互动式学习等方法能够有效地提升学生的学习兴趣和问题解决能力，为电路教育注入了新的活力。",
          //四、
          "本研究提出了以下创新方法，以改善中小学生的电路教育：\n" +
            "\n" +
            "实际案例分析： 在课堂中引入实际电路故障案例，让学生从实际问题入手，深入理解电路原理和故障排除方法。\n" +
            "\n" +
            "互动式学习： 通过小组合作、讨论和实验，在学生之间创造积极互动的学习氛围，培养他们的团队合作和沟通能力。",
        ],
      },
      content: {},
      confirmDialogVisible: false,
      conversations: [
        {
          user: "摘要和关键词是？",
          ai: "在摘要与关键词中，简明扼要地总结您的论文内容，并列出关键词方便检索。",
        },
      ],
      conversationIndex: 0,
      userMessage: "",
      responseMessage: "",
      //开启会话
      sessionPart: "研究背景",
      inSession: false,
      sessionKey: "",
    };
  },
  components: { Top },
  mounted() {
    this.ready();
  },
  methods: {
    ready() {
      let username = sessionStorage.getItem("username");
      if (username !== "" && username) {
        this.thesis.author = username;
      }
      this.conversations = [];
      let gameID = sessionStorage.getItem("gameID")!;
      this.id = gameID;
      // this.showBasicThesis();
    },
    leftNavClick(index: any) {
      this.currentNav = index;
      switch (index) {
        case "2":
          this.sessionPart = "研究背景";
          break;
        case "3":
          this.sessionPart = "创意来源";
          break;
        case "4":
          this.sessionPart = "方案设计";
          break;
        case "5":
          this.sessionPart = "创新点";
          break;
        default:
          this.sessionPart = "研究背景";
          break;
      }
      if (this.inSession) {
        this.otherPart();
      }
    },
    //获取论文框架
    showBasicThesis() {
      let that = this;
      getBasicThesis(that.id)
        .then((res) => {
          console.log("论文框架", res);
          this.thesis = res.data;
        })
        .catch((err: any) => {
          console.log(err);
        });
    },
    //点击AI生成关键词和摘要按钮
    aiKeywordsClick() {
      this.showKeywordAndBrief();
    },
    //AI生成关键词和摘要
    showKeywordAndBrief() {
      let that = this;
      // console.log(that.thesis.id+','+that.thesis.content)
      let data = {
        title: that.thesis.title,
        content: that.thesis.content,
      };
      console.log(that.thesis.content);
      getKeywordsAndBrief(data)
        .then((res) => {
          console.log("AI生成关键词和摘要", res);
          this.thesis.keywords = res.data.keyword;
          this.thesis.brief = res.data.abstract;
          ElMessage({
            message: "AI成功生成关键词和摘要！",
            type: "success",
          });
        })
        .catch((err: any) => {
          console.log(err);
        });
    },
    //关键词标签
    handleClose(tag: string) {
      this.thesis.keywords.splice(this.thesis.keywords.indexOf(tag), 1);
    },
    showInput() {
      this.inputVisible = true;
      nextTick(() => {
        InputRef.value!.input!.focus();
      });
    },
    handleInputConfirm() {
      if (this.inputValue) {
        this.thesis.keywords.push(this.inputValue);
      }
      this.inputVisible = false;
      this.inputValue = "";
    },
    editPaperBtnClick() {
      this.currentNav = 1;
    },
    confirmPaperBtnClick() {
      this.confirmDialogVisible = true;
    },

    //创建会话
    create() {
      let that = this;
      let data = {
        theme: this.thesis.title,
        part: this.sessionPart,
      };
      createSession(data)
        .then((res: any) => {
          console.log("create");
          that.sessionKey = res.data;
          that.inSession = true;
          // if (that.inSession) {
          //   that.chatAI(that.userMessage);
          // }
        })
        .catch((err: any) => {
          console.log(err);
        });
    },

    chatAI(message: any) {
      let that = this;
      let data = {
        content: message,
        sessionKey: that.sessionKey,
      };
      chat(data)
        .then((res: any) => {
          console.log("chat");
          console.log(res);
          let aiResponse = res.msg;
          console.log(that.conversations);
          console.log(this.conversationIndex);
          this.conversations[this.conversationIndex++].ai = aiResponse;
          this.userMessage = "";
          //接收ai的回应
        })
        .catch((err: any) => {
          console.log(err);
        });
    },

    refreash() {
      let that = this;
      if (that.inSession) {
        refreshSession(that.sessionKey)
          .then((res: any) => {
            console.log("refresh");
            that.conversationIndex = 0;
            that.conversations = [];
          })
          .catch((err: any) => {
            console.log(err);
          });
      }
    },
    otherPart() {
      let that = this;
      deleteSession(that.sessionKey)
        .then((res: any) => {
          console.log("otherPart");
          this.inSession = false;
          that.create();
        })
        .catch((err: any) => {
          console.log(err);
        });
    },
    close(next: any) {
      let that = this;
      deleteSession(that.sessionKey)
        .then((res: any) => {
          console.log("delete");
          that.conversations = [];
          next();
        })
        .catch((err: any) => {
          console.log(err);
        });
    },
    sendMessage() {
      let that = this;
      console.log(this.userMessage);
      this.conversations.push({
        user: this.userMessage,
        ai: "waiting...",
      });
      console.log(this.conversations);
      if (this.inSession) {
        //会话已开启
        this.chatAI(this.userMessage);
      } else {
        //会话未开启
        let start = new Promise(function (resolve, reject) {
          that.create();
          resolve('会话开启');
        });
        start.then(function () {
          that.chatAI(that.userMessage);
        });
      }
    },
    //回到试题页面

    backToTestClick() {
      this.$router.go(-1);
    },
    //回到知识点页面
    backToKnowledgeClick() {
      this.$router.go(-2);
    },
    //下载论文pdf
    downloadThesis() {
      getPdf(this.thesis);
      ElMessage({
        message: "正在获取，请稍后...",
        type: "success",
      });
    },
    //生成结束回到首页
    backToIndexClick() {
      this.$router.push("/knowledge/index");
    },
    //到个人账户查看论文详情
    toSelfCenter() {
      this.$router.push("/user/selfCenter");
    },
  },
  beforeRouteLeave(to, from, next) {
    if (this.sessionKey) {
      this.close(next);
    } else {
      next();
    }
  },
});
</script>

<style lang="scss" scoped>
@import "../../assets/style/css/user/thesis.scss";
</style>
