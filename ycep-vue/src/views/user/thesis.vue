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
                  <span>研究背景和必要性分析</span>
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
import { content } from "html2canvas/dist/types/css/property-descriptors/content";
// import printJS from 'print-js'
// import html2Canvas from 'html2Canvas'

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
        title: "一般家庭电路的连接分析",
        author: "蛄蛹者",
        address: "优胜北路第三小学，湖南 长沙，410000",
        brief:
          "针对传统的无线传感器网络电源电路在电流能量的存储与分配方面存在的不足，提出了无线传感器网络电源电路优化改进方法。首先，构建电源电路优化配置模型，获取网络节点约束平衡功率指标；其次，结合网络电源开关种类，设计网络电源电路拓扑结构；再次，对传感器中所有的电源网络进行标号处理，采用双锂电池供电，设计传感器网络节点管理电路；最后，根据脉冲宽度与脉冲频率的特点，共同优化改进开关电源的调制模式。",
        keywords: ["无线传感器", "网络", "电源电路", "电源效率"],
        content: [
          "目前，越来越多的行业应用无线传感器网络技术，使网络电源电路的节点功能不断增加。无线传感器网络电源电路的工作原理包括电源管理系统中能量流动原理、功率跟踪原理及充电原理。电源电路中的能量流动控制主要通过管理开关元件的导通与关断功能，实现能量流动方向控制与引导的目标。在电路管理中，根据无线传感器网络电源电路能量流动类型的不同，分为能量流动负载模型和电源模型。在电源管理电路中包括两种负载，分别为电池和电路节点电路的输出能量在为铅酸电池充电的同时，还能为超级电容充电，保证了无线传感器负载电路的稳定运行。",
          "在开关电源技术快速发展的趋势下，网络电源开关的种类越来越多，电路的拓扑结构也越来越复杂。采用 Buck-Boost 拓扑结构，再结合隔离变压器的调节控制作用，生成电源电路中常用的变换器。开关稳压电源与开关降压电源串联，将电源电压进行有功转换，控制晶体管的导通与关断时间，从而调节输出电压。该电路用于无线传感器网络的电源电路，其中包括电容和负载。",
          "本次实验选择具有无线接入功能的网关抓包工具与具有无线传感器网络节点的设备，在单片机开发的 C 语言集成开发环境下，硬件配置为 3.20GHz的 CPU 和 4.00 GB 内存的 PC 机，软件配置为Windows7SP1 操作系统，运行环境为 Visual Stu‐dio2010。利用NS2网络仿真软件进行无线传感器网络仿真，实现无线传感器自动生成与可视化操作。实验采用集成电路充电管理芯片，型号为ML2496，具有铅酸电池充电管理的功能。",
          "本文提出的无线传感器网络电源电路优化改进方法，能够提供稳定的电源电压输出，其设计指标满足无线传感器基本性能指标要求。经过实验证明，本文设计的优化改进方法整体运行性能较好，电源的运行效率更加具有优势。但是，本文在无线传感器网络稳压模块方面的研究仍然存在一定的不足，网络稳压模块仅可接收 3 种传感器类型，在未来的研究中，应当进一步改进。",
        ],
      },
      content: {},
      confirmDialogVisible: false,
      conversations: [
        // {
        //   user: "创意来源怎么写？",
        //   ai: "对于创意来源，您可以先从自身的兴趣和所学专业的前沿领域入手。",
        // },
        // {
        //   user: "研究背景是什么？",
        //   ai: "在研究背景中，可以回顾相关文献，阐述与您研究课题相关的研究现状。",
        // },
        // {
        //   user: "创新点怎么选择？",
        //   ai: "创新点是您的论文独特之处，可以在已有研究基础上指出自己的创新思路和方法。",
        // },
        // {
        //   user: "方案设计指的是什么？",
        //   ai: "方案设计部分需要详细说明您的研究方法和实验设计。",
        // },
        {
          user: "摘要和关键词是？",
          ai: "在摘要与关键词中，简明扼要地总结您的论文内容，并列出关键词方便检索。",
        },
      ],
      conversationIndex: 0,
      userMessage: "",
      responseMessage: "",
      //开启会话
      sessionPart: "创意来源",
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
      this.conversations = [];
      let gameID = sessionStorage.getItem("gameID")!;
      this.id = gameID;
      // this.showBasicThesis();
    },
    leftNavClick(index: any) {
      this.currentNav = index;
      switch (index) {
        case "2":
          this.sessionPart = "创意来源";
          break;
        case "3":
          this.sessionPart = "研究背景";
          break;
        case "4":
          this.sessionPart = "创新点";
          break;
        case "5":
          this.sessionPart = "方案设计";
          break;
        default:
          this.sessionPart = "创意来源";
          break;
      }
      console.log(this.sessionPart);
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
        part: "创意来源",
      };
      createSession(data)
        .then((res: any) => {
          console.log("create");
          console.log(res);
          that.sessionKey = res.data;
          that.inSession = true;
          if (that.inSession) {
            that.chatAI(that.userMessage);
          }
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

    close(next: any) {
      let that = this;
      deleteSession(that.sessionKey)
        .then((res: any) => {
          console.log("delete");
          this.conversations = [];
          next();
        })
        .catch((err: any) => {
          console.log(err);
        });
    },
    sendMessage() {
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
        this.create();
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
