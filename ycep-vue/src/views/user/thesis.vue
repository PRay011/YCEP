<template>
  <!--  顶部导航栏-->
  <!--  <Top/>-->

  <div class="container">
    <div class="main">
      <div class="header">
        <div class="title">
          <img
            src="../../assets/images/thesis/论文插画0.png"
            style="cursor: pointer"
            alt=""
            @click="currentNav = 0"
          />
          <!--          <p class="text">AI帮你写论文</p>-->
        </div>
        <div class="title-items">
          <div
            class="title-item"
            :class="currentTitleNav === 0 ? 'selected' : ''"
            @click="titleItemNavClick(0)"
            id="step1"
          >
            <el-icon size="32" color="#363636">
              <Guide />
            </el-icon>
            <p>论文导引</p>
          </div>
          <div
            class="title-item"
            :class="currentTitleNav === 1 ? 'selected' : ''"
            @click="titleItemNavClick(1)"
            id="step2"
          >
            <el-icon size="32" color="#363636">
              <Document />
            </el-icon>
            <p>论文撰写</p>
          </div>
          <div
            class="title-item"
            :class="currentTitleNav === 2 ? 'selected' : ''"
            @click="titleItemNavClick(2)"
            id="step3"
          >
            <el-icon size="32" color="#363636">
              <Checked />
            </el-icon>
            <p>论文预览</p>
          </div>
          <div
            class="title-item level2"
            v-if="currentTitleNav === 2"
            @click="editPaperBtnClick"
          >
            <el-icon size="32" color="#363636">
              <Edit />
            </el-icon>
            <p>继续编辑</p>
          </div>
          <div
            class="title-item level2"
            v-if="currentTitleNav === 2"
            @click="confirmPaperBtnClick"
          >
            <el-icon size="32" color="#363636">
              <CircleCheckFilled />
            </el-icon>
            <p>确认生成</p>
          </div>
<!--          <div-->
<!--            class="title-item level2"-->
<!--            v-if="currentTitleNav === 2"-->
<!--            @click="downloadThesis"-->
<!--          >-->
<!--            <el-icon size="32" color="#363636">-->
<!--              <DocumentChecked />-->
<!--            </el-icon>-->
<!--            <p>下载论文</p>-->
<!--          </div>-->
        </div>
        <div class="actions">
          <!--          <button class="backToTest" @click="backToTestClick">回到试题</button>-->
          <!--          <button class="backToKnowledge" @click="backToKnowledgeClick">重新学习</button>-->
          <img
            class="guide-icon"
            src="../../assets/images/thesis/论文插画8.png"
            alt=""
          />
          <button @click="guideClick">新手指引</button>
          <button @click="backToIndexClick">回到首页</button>
        </div>
      </div>
      <div class="content">
        <div class="middle">
          <div class="steps-bar" v-if="currentTitleNav === 1">
            <div class="steps">
              <div
                class="steps-item"
                :class="currentNav === 1 ? 'selected' : ''"
                @click="leftNavClick(1)"
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
                @click="leftNavClick(2)"
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
                @click="leftNavClick(3)"
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
                @click="leftNavClick(4)"
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
                @click="leftNavClick(5)"
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
                @click="leftNavClick(6)"
              >
                <div class="steps-item-container">
                  <div class="steps-item-icon">
                    <span class="steps-text">6</span>
                  </div>
                  <div class="steps-item-content">
                    <div class="steps-item-title">关键词和摘要</div>
                    <div class="steps-item-description">
                      <span>可AI生成</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <el-scrollbar height="710px">
            <div class="paper intro" v-if="currentNav == 0">
              <div class="info">
                <p class="text">① AI智能助手全程回答您的问题</p>
                <div class="image">
                  <img src="../../assets/images/thesis/img1.png" alt="" :width="350">
                </div>
              </div>
              <div class="arrow">
                <img src="../../assets/images/thesis/downarrow.png" alt="" :width="30">
              </div>
              <div class="info">
                <p class="text">② 填写论文基本内容</p>
                <div class="image">
                  <img src="../../assets/images/thesis/img2.png" alt="" :width="800">
                </div>
              </div>
              <div class="arrow">
                <img src="../../assets/images/thesis/downarrow.png" alt="" :width="30">
              </div>
              <div class="info">
                <p class="text">③ 论文预览</p>
                <div class="image">
                  <img src="../../assets/images/thesis/img3.png" alt="" :width="800">
                </div>
              </div>
              <button @click="editPaperBtnClick">开始编辑论文</button>
            </div>
            <div class="paper" v-if="currentNav == 1">
              <div class="paper-top">
                <div class="info">
                  <p class="title">基本信息>></p>
                  <p class="desc">
                    在这里填写你要生成的论文的基本信息，包括论文题目、作者信息等，这是生成论文的第一步，需要你仔细思考确定填写内容哦~
                  </p>
                </div>
                <img src="../../assets/images/thesis/论文插画1.png" alt="" />
              </div>
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
              <button class="next" @click="nextStep(2)">下一步</button>
            </div>
            <div class="paper" v-if="currentNav == 2">
              <div class="paper-top">
                <div class="info">
                  <p class="title">研究背景和必要性分析>></p>
                  <p class="desc">
                    在这里填写论文的研究背景和必要性分析，即是指你开展这项研究的前提、起因，如果你不太清楚，可以问一问右边的AI助手哦~
                  </p>
                </div>
                <img src="../../assets/images/thesis/论文插画2.png" alt="" />
              </div>
              <el-form>
                <!--                <span class="chapter-name">一、研究背景和必要性分析</span>-->
                <el-input
                  type="textarea"
                  v-model="thesis.content[0]"
                  :rows="20"
                ></el-input>
              </el-form>
              <button class="next" @click="nextStep(3)">下一步</button>
            </div>
            <div class="paper" v-if="currentNav == 3">
              <div class="paper-top">
                <div class="info">
                  <p class="title">创意来源>></p>
                  <p class="desc">
                    在这里填写你要生成的论文的创意来源，即是有什么契机让你想到了这篇论文的主题？如果你不太清楚，可以问一问右边的AI助手哦~
                  </p>
                </div>
                <img src="../../assets/images/thesis/论文插画3.png" alt="" />
              </div>
              <el-form>
                <!--                <span class="chapter-name">二、创意来源</span>-->
                <el-input
                  type="textarea"
                  v-model="thesis.content[1]"
                  :rows="20"
                ></el-input>
              </el-form>
              <button class="next" @click="nextStep(4)">下一步</button>
            </div>
            <div class="paper" v-if="currentNav == 4">
              <div class="paper-top">
                <div class="info">
                  <p class="title">基本设计>></p>
                  <p class="desc">
                    在这里填写你要生成的论文的基本设计，即是你开展这个主题的研究的设计方案，采取什么实验方法等，如果你不太清楚，可以问一问右边的AI助手哦~
                  </p>
                </div>
                <img src="../../assets/images/thesis/论文插画4.png" alt="" />
              </div>
              <el-form>
                <!--                <span class="chapter-name">三、基本设计</span>-->
                <el-input
                  type="textarea"
                  v-model="thesis.content[2]"
                  :rows="20"
                ></el-input>
              </el-form>
              <button class="next" @click="nextStep(5)">下一步</button>
            </div>
            <div class="paper" v-if="currentNav == 5">
              <div class="paper-top">
                <div class="info">
                  <p class="title">创新点>></p>
                  <p class="desc">
                    在这里填写你要生成的论文的创新点，根据你了解的研究背景等信息提炼出你想法中有所创新的地方，如果你不太清楚，可以问一问右边的AI助手哦~
                  </p>
                </div>
                <img src="../../assets/images/thesis/论文插画5.png" alt="" />
              </div>
              <el-form>
                <!--                <span class="chapter-name">三、创新点</span>-->
                <el-input
                  type="textarea"
                  v-model="thesis.content[3]"
                  :rows="20"
                ></el-input>
              </el-form>
              <button class="next" @click="nextStep(6)">下一步</button>
            </div>
            <div class="paper" v-if="currentNav == 6">
              <div class="paper-top">
                <div class="info">
                  <span style="display: flex; justify-content: space-between">
                    <p class="title">摘要和关键词>></p>
                    <div class="aiBtn" @click="aiKeywordsClick">
                      <img
                        class="ai-icon"
                        src="../../assets/images/thesis/robot.png"
                        alt=""
                      />
                      <p class="text">AI生成</p>
                    </div>
<!--                    <button class="aiBtn" @click="aiKeywordsClick">-->
<!--                      AI生成-->
<!--                    </button>-->
                  </span>
                  <p class="desc">
                    在这里填写你要生成的论文的摘要和关键词，关键词可以有不止一个，摘要是整篇论文最核心的地方，字数不能过多，要抓住重点，AI可以根据前面你所写的内容来自动生成，不过仅限参考哦~
                  </p>
                </div>
                <img src="../../assets/images/thesis/论文插画6.png" alt="" />
              </div>
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
              <button class="next" @click="nextStep(7)">预览论文</button>
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
                <p class="text2">{{ thesis.brief }}</p>
                <p class="text1">
                  关键词：&emsp;
                  <template v-for="keyword in thesis.keywords"
                    >{{ keyword }};&emsp;
                  </template>
                </p>
              </div>
              <br /><br />
              <div class="block4">
                <p class="text1">一、研究背景和必要性分析</p>
                <p class="text2" v-for="p in chapter1">{{ p }}</p>
                <p class="text1">二、创意来源</p>
                <p class="text2" v-for="p in chapter2">{{ p }}</p>
                <p class="text1">三、基本设计</p>
                <p class="text2" v-for="p in chapter3">{{ p }}</p>
                <p class="text1">四、创新点</p>
                <p class="text2" v-for="p in chapter4">{{ p }}</p>
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
          <!--          <div class="btn-container" v-if="currentNav == 7">-->
          <!--            <button @click="editPaperBtnClick">继续编辑</button>-->
          <!--            <button @click="confirmPaperBtnClick">确认生成</button>-->
          <!--            <button @click="downloadThesis">下载论文</button>-->
          <!--          </div>-->
        </div>
        <div
          id="step4"
          class="right"
          :style="{ width: containerWidth + 'px', right: 0 + 'px' }"
          @mouseover="changeCursor"
          @mousedown="startResize"
          :class="{ resizeable: isMouseOver }"
        >
          <div class="chat-box" id="chatBox">
            <div class="title">
              <img
                class="chat-icon"
                src="../../assets/images/thesis/robot.png"
                alt=""
              />
              <p class="text">AI助手</p>
              <p class="topic">
                <span>正在搜索：</span>
                {{ sessionPart }}
              </p>
            </div>
            <!-- 这里将显示聊天消息 -->
            <el-scrollbar height="600px">
              <div class="message-container ai">
                <div class="message ai">
                  <p>AI：有什么可以帮助您？</p>
                </div>
              </div>
              <template
                v-for="(conversation, index) in conversations"
                :key="index"
              >
                <div class="message-container user">
                  <div class="message user">
                    <p>你：{{ conversation.user }}</p>
                  </div>
                </div>
                <div class="message-container ai" v-if="conversation.ai !== null && conversation.ai !== 'waiting...'">
                  <div class="message ai">
                    <span>AI：<p class="chapter" style="white-space: pre-wrap; color:black" v-html="conversation.ai"></p></span>
                  </div>
                </div>
                <div class="message-container ai" v-else>
                  <div class="message ai">
                    <span>AI：请稍等...</span>
                  </div>
                </div>
              </template>
            </el-scrollbar>
          </div>
          <div class="user-input">
            <!--  <input
                type="text"
                v-model="userMessage"
                placeholder="在此输入消息..."
            />
            <button @click="sendMessage()">发送</button> -->
            <p class="refresh" @click="refreash()">
              <el-icon size="25">
                <Refresh />
              </el-icon>
            </p>
            <input
              placeholder="Type here"
              class="input"
              v-model="userMessage"
              type="text"
            />
            <p class="search">
              <el-icon size="25">
                <Promotion @click="sendMessage()" />
              </el-icon>
            </p>
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
          <img src="../../assets/images/thesis/论文插画7.png" alt="论文配图" />
        </div>
        <template #footer>
          <span class="dialog-footer">
            <el-button @click="backToIndexClick">回到首页</el-button>
<!--            <el-button type="primary" @click="toSelfCenter">-->
<!--              个人主页-->
<!--            </el-button>-->
            <el-button type="primary" @click="downloadThesis">
              下载论文
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

const InputRef = ref<InstanceType<typeof ElInput>>();

export default defineComponent({
  name: "thesis",
  data() {
    return {
      id: "",
      data: "",
      currentNav: 0,
      currentTitleNav: 0,
      inputVisible: false,
      inputValue: "",
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
      chapter1: [],
      chapter2: [],
      chapter3: [],
      chapter4: [],
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
      sessionPart: "研究背景和必要性分析",
      inSession: false,
      sessionKey: "",
      introOption: {
        // 参数对象
        prevLabel: "上一步",
        nextLabel: "下一步",
        skipLabel: "跳过",
        doneLabel: "完成",
        tooltipClass: "intro-tooltip" /* 引导说明文本框的样式 */,
        // highlightClass: 'intro-highlight', /* 说明高亮区域的样式 */
        exitOnEsc: true /* 是否使用键盘Esc退出 */,
        exitOnOverlayClick: false /* 是否允许点击空白处退出 */,
        keyboardNavigation: true /* 是否允许键盘来操作 */,
        showBullets: false /* 是否使用点显示进度 */,
        showProgress: false /* 是否显示进度条 */,
        scrollToElement: true /* 是否滑动到高亮的区域 */,
        overlayOpacity: 0.5, // 遮罩层的透明度 0-1之间
        positionPrecedence: [
          "bottom",
          "top",
          "right",
          "left",
        ] /* 当位置选择自动的时候，位置排列的优先级 */,
        disableInteraction: false /* 是否禁止与元素的相互关联 */,
        hidePrev: true /* 是否在第一步隐藏上一步 */,
        // hideNext: true, /* 是否在最后一步隐藏下一步 */
        steps: [] /* steps步骤，可以写个工具类保存起来 */,
      },

      //下面是拉宽
      containerWidth: 390,
      containerLeft: 0,
      isMouseOver: false,
      isResizing: false,
      initialX: 0,
      initialWidth: 0,
      minWidth: 390, // 设置最小宽度
      maxWidth: 1000, // 设置最小宽度
    };
  },
  components: { Top },
  mounted() {
    this.ready();
    //为保证页面渲染成功后调用函数，使用定时器和nextTick
    let timer = setTimeout(() => {
      this.$nextTick(() => {
        this.initGuide(); // 调用新手引导的方法
      });
    }, 800);
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
    //下一步
    nextStep(nav: number) {
      this.leftNavClick(nav);
      if(nav == 7){
        this.currentTitleNav=2;
        this.leftNavClick(7);
      }
    },
    leftNavClick(index: any) {
      this.currentNav = index;
      switch (index) {
        case 1:
          this.sessionPart = "研究背景和必要性分析";
          break;
        case 2:
          this.sessionPart = "研究背景和必要性分析";
          break;
        case 3:
          this.sessionPart = "创意来源";
          break;
        case 4:
          this.sessionPart = "基本设计";
          break;
        case 5:
          this.sessionPart = "创新点";
          break;
        case 6:
          this.sessionPart = "研究背景和必要性分析";
          break;
        case 7:
          this.sessionPart = "研究背景和必要性分析";
          this.thesis.address = this.author.school + "，" + this.author.address + "，" + this.author.zip;
          this.convertToArray();
          break;
        default:
          this.sessionPart = "研究背景和必要性分析";
          break;
      }
      if (this.inSession) {
        this.otherPart();
      }
    },
    //将输入框中的文本按换行转换成数组
    convertToArray() {
      this.chapter1 = this.thesis.content[0].split("\n").map(item => item.trim());
      this.chapter2 = this.thesis.content[1].split("\n").map(item => item.trim());
      this.chapter3 = this.thesis.content[2].split("\n").map(item => item.trim());
      this.chapter4 = this.thesis.content[3].split("\n").map(item => item.trim());
    },
    titleItemNavClick(index: any) {
      this.currentTitleNav = index;
      if (index == 0) {
        this.currentNav = 0;
      } else if (index == 1) {
        this.currentNav = 1;
      } else if (index == 2) {
        this.leftNavClick(7);
      }
    },
    guideClick() {
      this.initGuide();
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
      ElMessage({
        message: "正在生成，请稍后...",
        type: "info",
      });
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
      this.currentTitleNav = 1;
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
          console.log(res);
          that.sessionKey = res.data;
          console.log(res.data);
          that.inSession = true;
        })
        .catch((err: any) => {
          console.log(err);
        });
    },

    chatAI(message: any) {
      let that = this;
      // let messageContent =
      //   "dfsfaSDFAFAF\nASYUDFQUWTYDFsaduiyhasgfyuiasgbdyuiashgduiaasdfafassfasfsafsd\n\nasdafafafafafafasfasfasf";
      // let messageTest = messageContent.replace(/(\r\n|\n|\r)/gm, "<br />");
      // this.conversations[this.conversationIndex++].ai = messageContent;
      // this.userMessage = "";

      let data = {
        content: message,
        sessionKey: that.sessionKey,
      };
      chat(data)
        .then((res: any) => {
          console.log("chat");
          console.log(res);
          let aiResponse = res.msg.replace(/(\r\n|\n|\r|\\n)/gm, "<br>        ").replace(/(\\)/gm,"");

          aiResponse = '  '+ aiResponse;
          console.log(that.conversations);
          //将文本按每段存放入数组中，便于后续缩进2em
          // Reflect.set(this.conversations[this.conversationIndex], 'aiMessageArray', aiResponse.split("\n").map(item => item.trim()));
          this.conversations[this.conversationIndex].ai = aiResponse;
          this.userMessage = "";
          //接收ai的回应
          this.conversationIndex++;
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
      console.log(this.inSession);
      if (this.userMessage == "" || this.userMessage == null) {
        ElMessage({
          message: "发送的内容不能为空！",
          type: "error",
        });
      } else {
        this.conversations.push({
          user: this.userMessage,
          ai: "waiting...",
        });
        if (this.inSession) {
          //会话已开启
          this.chatAI(this.userMessage);
        } else {
          //会话未开启
          let data = {
            theme: that.thesis.title,
            part: that.sessionPart,
          };
          createSession(data)
            .then((res: any) => {
              console.log("create");
              console.log(res);
              that.sessionKey = res.data;
              that.inSession = true;
              that.chatAI(that.userMessage);
            })
            .catch((err: any) => {
              console.log(err);
            });
          // let start = new Promise(function (resolve, reject) {
          //   // resolve 在外部函数的回调中调用
          //   let data = {
          //     theme: that.thesis.title,
          //     part: that.sessionPart,
          //   };
          //   createSession(data)
          //     .then((res: any) => {
          //       console.log("create");
          //       console.log(res);
          //       that.sessionKey = res.data;
          //       that.inSession = true;
          //       resolve("会话开启");
          //     })
          //     .catch((err: any) => {
          //       console.log(err);
          //     });
          // });
          // start.then(function () {
          //   that.chatAI(that.userMessage);
          // });
        }
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
    //引导动画
    initGuide() {
      // 绑定标签元素的选择器数组
      this.introOption.steps = [
        {
          title: "系统使用指导",
          element: "#step1",
          position: "bottom",
          intro: "点击即可看到生成论文的三步流程，在AI的帮助下轻松生成一篇较为完善的论文。",
        },
        {
          title: "论文撰写",
          element: "#step2",
          position: "bottom",
          intro: "点击后进入一系列流程，你可以在右方AI的帮助下完成各部分的编写。",
        },
        {
          title: "论文预览",
          element: "#step3",
          position: "bottom",
          intro: "点击此处，系统可以将先前所有内容制作成论文，进行初步预览，若有问题还可以继续返回编辑。",
        },
        {
          title: "AI助手",
          element: "#step4",
          position: "left",
          intro: "你可以在此处向AI提出你不懂的问题，可以重复提问选取你满意的回答。",
        },
      ];
      //在main.ts中已经声明过，报红可忽略
      this.$intro()
        .setOptions(this.introOption)
        // 点击结束按钮后执行的事件
        .oncomplete(() => {
          console.log("点击结束按钮后执行的事件");
        })
        // 点击跳过按钮后执行的事件
        .onexit(() => {
          console.log("点击跳过按钮后执行的事件");
        })
        // 确认完毕之后执行的事件
        .onbeforeexit(() => {
          console.log("确认完毕之后执行的事件");
        })
        .start();
    },

    //拉宽控件
    changeCursor(event: any) {
      const containerRect = event.target.getBoundingClientRect();
      const borderWidth = 2; // 边框宽度，根据实际情况调整
      const isBorderClicked =
        Math.abs(event.clientX - containerRect.left) <= borderWidth;

      if (isBorderClicked) {
        this.isMouseOver = true;
      } else {
        this.isMouseOver = false;
      }
    },
    startResize(event: any) {
      const containerRect = event.target.getBoundingClientRect();
      const borderWidth = 2; // 边框宽度，根据实际情况调整
      const isBorderClicked =
        Math.abs(event.clientX - containerRect.left) <= borderWidth;

      if (isBorderClicked) {
        this.isResizing = true;
        this.initialX = event.clientX;
        this.initialWidth = this.containerWidth;
        document.addEventListener("mousemove", this.resizeContainer);
        document.addEventListener("mouseup", this.stopResizeContainer);
      }
    },
    resizeContainer(event: any) {
      if (this.isResizing) {
        const deltaX = event.clientX - this.initialX;
        const newWidth = this.initialWidth - deltaX;
        if (newWidth <= this.minWidth) {
          this.containerWidth = this.minWidth;
        } else if (newWidth >= this.maxWidth) {
          this.containerWidth = this.maxWidth;
        } else {
          this.containerWidth = newWidth;
        }

        this.containerLeft = this.initialX - event.clientX;
      }
    },
    stopResizeContainer() {
      this.isResizing = false;
      document.removeEventListener("mousemove", this.resizeContainer);
      document.removeEventListener("mouseup", this.stopResizeContainer);
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
