<template>
  <!--  顶部导航栏-->
  <Top/>

  <div class="container">
    <div class="main">
      <div class="header">
        <h1>Chat with AI</h1>
      </div>
      <div class="content">
        <div class="left">
          <div class="box" onclick="highlightTitle('box1')">创意来源</div>
          <div class="box" onclick="highlightTitle('box2')">研究背景</div>
          <div class="box" onclick="highlightTitle('box3')">创新点</div>
          <div class="box" onclick="highlightTitle('box4')">方案设计</div>
          <div class="box" onclick="highlightTitle('box5')">摘要与关键词</div>
          <div class="btn-container">
            <div class="box2" onclick="highlightTitle('box5')">生成论文</div>
          </div>
        </div>
        <div class="middle">
          <el-scrollbar height="600px">
            <div class="paper-content">
              <div class="block1">
                <p class="text1">2023/8/6</p>
                <p class="text2">青少年创新教育平台</p>
                <p class="text1">物理/电路</p>
              </div>
              <hr/>
              <hr/>
              <div class="block2">
                <p class="text1">一般家庭电路的连接分析</p>
                <p class="text2">蛄蛹者</p>
                <p class="text3">（优胜北路第三小学，湖南 长沙，410000）</p>
              </div>
              <br/>
              <div class="block3">
                <p class="text1">摘要：</p>
                <p class="text2">&emsp;&emsp;针对传统的无线传感器网络电源电路在电流能量的存储与分配方面存在的不足，提
                  出了无线传感器网络电源电路优化改进方法。首先，构建电源电路优化配置模型，获取网络节
                  点约束平衡功率指标；其次，结合网络电源开关种类，设计网络电源电路拓扑结构；再次，对传
                  感器中所有的电源网络进行标号处理，采用双锂电池供电，设计传感器网络节点管理电路；最
                  后，根据脉冲宽度与脉冲频率的特点，共同优化改进开关电源的调制模式。</p>
                <p class="text1">关键词：</p>
                <p class="text2">&emsp;&emsp;无线传感器；网络；电源电路；电源效率</p>
              </div>
              <br/>
              <br/>
              <div class="block4">
                <p class="text1">一、项目背景</p>
                <p class="text2">&emsp;&emsp;目前，越来越多的行业应用无线传感器网络技术，使网络电源电路的节点功能不断增加。
                  无线传感器网络电源电路的工作原理包括电源管理系统中能量流动原理、功率跟踪原理及充电原理。
                  电源电路中的能量流动控制主要通过管理开关元件的导通与关断功能，实现能量流动方向控制与引导的目标。
                  在电路管理中，根据无线传感器网络电源电路能量流动类型的不同，分为能量流动负载
                  模型和电源模型。在电源管理电路中包括两种负载，分别为电池和电路节点。
                  电路的输出能量在为铅酸电池充电的同时，还能为超级电容充电，保证了无线传感器负载电路的稳定运行。</p>
                <p class="text1">二、设计网络电源电路拓扑结构</p>
                <p class="text2">&emsp;&emsp;在开关电源技术快速发展的趋势下，网络电源开关的种类越来越多，电路的拓扑结构也越来越复杂。
                  采用 Buck-Boost 拓扑结构，再结合隔离变压器的调节控制作用，生成电源电路中常用的变换器。
                  开关稳压电源与开关降压电源串联，将电源电压进行有功转换，控制晶体管的导通与关断时间，
                  从而调节输出电压。该电路用于无线传感器网络的电源电路，其中包括电容和负载。</p>
                <p class="text1">三、仿真实验</p>
                <p class="text2">&emsp;&emsp;本次实验选择具有无线接入功能的网关抓包工具与具有无线传感器网络节点的设备，
                  在单片机开发的 C 语言集成开发环境下，硬件配置为 3.20GHz的 CPU 和 4.00 GB 内存的 PC 机，
                  软件配置为Windows7SP1 操作系统，运行环境为 Visual Stu‐dio2010。
                  利用NS2网络仿真软件进行无线传感器网络仿真，实现无线传感器自动生成与可视化操作。
                  实验采用集成电路充电管理芯片，型号为ML2496，具有铅酸电池充电管理的功能。</p>
                <p class="text1">四、结语</p>
                <p class="text2">&emsp;&emsp;本文提出的无线传感器网络电源电路优化改进方法，能够提供稳定的电源电压输出，
                  其设计指标满足无线传感器基本性能指标要求。经过实验证明，本文设计的优化改进方法整体运行性能较好，
                  电源的运行效率更加具有优势。但是，本文在无线传感器网络稳压模块方面的研究仍然存在一定的不足，
                  网络稳压模块仅可接收 3 种传感器类型，在未来的研究中，应当进一步改进。</p>
              </div>
              <br/>
              <br/>
              <hr/>
              <hr/>
              <div class="block1">
                <p class="text1">2023/8/6</p>
                <p class="text2">青少年创新教育平台</p>
                <p class="text1">物理/电路</p>
              </div>
            </div>
          </el-scrollbar>
          <!--          <textarea class="paper-content" rows="5" placeholder="你编辑的论文..." onchange="updateUserMessage()"></textarea>-->
          <div class="btn-container">
            <button class="modify-btn" onclick="clearUserInput()">修改</button>
            <button class="submit-btn" onclick="sendMessageToAI()">提交</button>
          </div>
        </div>
        <div class="right">
          <div class="chat-box" id="chatBox">
            <div class="title">
              <el-icon size="30">
                <ChatLineSquare/>
              </el-icon>
              <p class="text">AI助手帮你写论文</p>
            </div>
            <!-- 这里将显示聊天消息 -->
            <div class="message ai">
              <p>AI： 有什么可以帮助您？</p>
            </div>
          </div>
          <div class="user-input">
            <input type="text" id="userMessage" placeholder="在此输入消息...">
            <button onclick="sendMessage()">发送</button>
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
  name: "thesis",
  data() {
    return {
      data: "",
    };
  },
  components: {Top},
  mounted() {
  },
  methods: {
    ready() {
    },
    highlightTitle(boxId) {
      var boxes = document.getElementsByClassName('box');
      for (var i = 0; i < boxes.length; i++) {
        if (boxes[i].id === boxId) {
          boxes[i].style.backgroundColor = '#1e90ff';
        } else {
          boxes[i].style.backgroundColor = '#e0e0e0';
        }
      }
    },
    modify() {
      console.log('用户点击了"修改"按钮');
    },

    submit() {
      console.log('用户点击了"提交"按钮');
    },

    updateUserMessage() {
      var userInput = document.getElementById('user-input').value;
      document.getElementById('usermessage').value = userInput;
    },

    clearUserInput() {
      document.getElementById('user-input').value = '';
      document.getElementById('usermessage').value = '';
    },

    getRandomReply() {
      var replies = [
        "对于创意来源，您可以先从自身的兴趣和所学专业的前沿领域入手。",
        "在研究背景中，可以回顾相关文献，阐述与您研究课题相关的研究现状。",
        "创新点是您的论文独特之处，可以在已有研究基础上指出自己的创新思路和方法。",
        "方案设计部分需要详细说明您的研究方法和实验设计。",
        "在摘要与关键词中，简明扼要地总结您的论文内容，并列出关键词方便检索。"
      ];
      return replies[Math.floor(Math.random() * replies.length)];
    },

    sendMessageToAI() {
      var userInput = document.getElementById('user-input').value;
      if (userInput.trim() !== '') {
        var chatBox = document.getElementById('chatBox');

        // 创建用户的消息
        var userMessageDiv = document.createElement('div');
        userMessageDiv.className = 'message user';
        userMessageDiv.innerHTML = `<p>用户： ${userInput}</p>`;
        chatBox.appendChild(userMessageDiv);

        // 清空左边输入框的内容
        document.getElementById('user-input').value = '';

        // 模拟AI的回复（此处使用setTimeout来模拟延迟）
        setTimeout(function () {
          var aiMessageDiv = document.createElement('div');
          aiMessageDiv.className = 'message ai';
          aiMessageDiv.innerHTML = `<p>AI： ${getRandomReply()}</p>`;
          chatBox.appendChild(aiMessageDiv);
        }, 1000);
      }
    },

    sendMessage() {
      const userMessageInput = document.getElementById('userMessage');
      const userMessage = userMessageInput.value.trim();

      if (userMessage !== '') {
        const chatBox = document.getElementById('chatBox');
        const messageDiv = document.createElement('div');
        messageDiv.className = 'message user';
        messageDiv.innerHTML = `<p>用户： ${userMessage}</p>`;
        chatBox.appendChild(messageDiv);
        userMessageInput.value = '';

        // 模拟AI的回复（此处使用setTimeout来模拟延迟）
        setTimeout(function () {
          const aiMessageDiv = document.createElement('div');
          aiMessageDiv.className = 'message ai';
          aiMessageDiv.innerHTML = `<p>AI： ${getRandomReply()}</p>`;
          chatBox.appendChild(aiMessageDiv);
        }, 1000);
      }
    },
  },
});
</script>

<style lang="scss" scoped>
@import "../../assets/style/css/user/thesis.scss";
</style>
