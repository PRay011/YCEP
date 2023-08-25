<template>
  <canvas id="the-canvas">
    <div class="paper-content" id="printDiv">
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
        <template v-for="chapter in thesis.content">
          <p class="text1">{{ chapter.chapter }}</p>
          <p class="text2">&emsp;&emsp;{{ chapter.text }}</p>
        </template>
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
  </canvas>
</template>

<script lang="ts">
import PDFJS from "pdfjs-dist";
export default {
  name: "pdf",
  props: {
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
        {
          chapter: "一、创意来源",
          text: "目前，越来越多的行业应用无线传感器网络技术，使网络电源电路的节点功能不断增加。无线传感器网络电源电路的工作原理包括电源管理系统中能量流动原理、功率跟踪原理及充电原理。电源电路中的能量流动控制主要通过管理开关元件的导通与关断功能，实现能量流动方向控制与引导的目标。在电路管理中，根据无线传感器网络电源电路能量流动类型的不同，分为能量流动负载模型和电源模型。在电源管理电路中包括两种负载，分别为电池和电路节点电路的输出能量在为铅酸电池充电的同时，还能为超级电容充电，保证了无线传感器负载电路的稳定运行。",
        },
        {
          chapter: "二、研究背景",
          text: "在开关电源技术快速发展的趋势下，网络电源开关的种类越来越多，电路的拓扑结构也越来越复杂。采用 Buck-Boost 拓扑结构，再结合隔离变压器的调节控制作用，生成电源电路中常用的变换器。开关稳压电源与开关降压电源串联，将电源电压进行有功转换，控制晶体管的导通与关断时间，从而调节输出电压。该电路用于无线传感器网络的电源电路，其中包括电容和负载。",
        },
        {
          chapter: "三、创新点",
          text: "本次实验选择具有无线接入功能的网关抓包工具与具有无线传感器网络节点的设备，在单片机开发的 C 语言集成开发环境下，硬件配置为 3.20GHz的 CPU 和 4.00 GB 内存的 PC 机，软件配置为Windows7SP1 操作系统，运行环境为 Visual Stu‐dio2010。利用NS2网络仿真软件进行无线传感器网络仿真，实现无线传感器自动生成与可视化操作。实验采用集成电路充电管理芯片，型号为ML2496，具有铅酸电池充电管理的功能。",
        },
        {
          chapter: "四、方案设计",
          text: "本文提出的无线传感器网络电源电路优化改进方法，能够提供稳定的电源电压输出，其设计指标满足无线传感器基本性能指标要求。经过实验证明，本文设计的优化改进方法整体运行性能较好，电源的运行效率更加具有优势。但是，本文在无线传感器网络稳压模块方面的研究仍然存在一定的不足，网络稳压模块仅可接收 3 种传感器类型，在未来的研究中，应当进一步改进。",
        },
      ],
    },
    pdfurl: "",
  },
  data() {
    return {
      pdfDoc: null, //pdfjs 生成的对象
      pageNum: 1, //
      pageRendering: false,
      pageNumPending: null,
    };
  },
  mounted() {
    let vm = this;
    PDFJS.getDocument(vm.pdfurl).then(function (pdfDoc_) {
      //初始化pdf
      vm.pdfDoc = pdfDoc_;
      vm.page_count = vm.pdfDoc.numPages;
      vm.renderPage(vm.pageNum);
    });
  },
  computed: {
    ctx() {
      let id = document.getElementById("the-canvas");
      return id.getContext("2d");
    },
  },
  methods: {
    renderPage(num) {
      //渲染pdf
      let vm = this;
      this.pageRendering = true;
      let canvas = document.getElementById("the-canvas");
      // Using promise to fetch the page
      this.pdfDoc.getPage(num).then(function (page) {
        var viewport = page.getViewport(vm.scale);
        //alert(vm.canvas.height)
        canvas.height = viewport.height;
        canvas.width = viewport.width;

        // Render PDF page into canvas context
        var renderContext = {
          canvasContext: vm.ctx,
          viewport: viewport,
        };
        var renderTask = page.render(renderContext);

        // Wait for rendering to finish
        renderTask.promise.then(function () {
          vm.pageRendering = false;
          if (vm.pageNumPending !== null) {
            // New page rendering is pending
            vm.renderPage(vm.pageNumPending);
            vm.pageNumPending = null;
          }
        });
      });
      vm.page_num = vm.pageNum;
    },
  },
};
</script>

<style scoped lang="scss">
.paper-content {
  margin: 20px auto;
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 100%;
  padding: 30px;
  color: #222226;

  hr {
    width: 100%;
  }

  //background-color: #a1a1a1;
  .block1 {
    width: 100%;
    height: 40px;
    display: flex;
    justify-content: space-between;

    .text1 {
      font-size: 18px;
      color: #a1a1a1;
    }

    .text2 {
      font-weight: 550;
      font-size: 17px;
      color: #696969;
    }
  }

  .block2 {
    width: 100%;

    .text1 {
      line-height: 60px;
      font-size: 24px;
      font-weight: 600;
    }

    .text2 {
      font-family: "楷体", sans-serif;
      font-size: 20px;
      line-height: 50px;
    }

    .text3 {
      font-size: 16px;
      font-family: "华文楷体", sans-serif;
    }
  }

  .block3 {
    text-align: left;

    .text1 {
      font-weight: 550;
      margin-top: 10px;
    }
  }

  .block4 {
    text-align: left;

    .text1 {
      font-size: 18px;
      height: 50px;
      line-height: 50px;
      font-weight: 550;
    }
  }
}
</style>
