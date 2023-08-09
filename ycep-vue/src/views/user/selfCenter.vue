<link rel="stylesheet" href="../../assets/style/css/knowledge/kind.scss">
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
          <div class="pagination">
            <el-pagination
                v-model:currentPage="paginationConfig.currentPage"
                layout="total, prev, pager, next"
                :page-size="paginationConfig.pageSize"
                :total="paginationConfig.total"
                @current-change="handlePageChange"
            />
          </div>
        </div>
        <div class="detail page2" v-if="currentNav == 2">
          <div class="title">学习论文>></div>
          <br/>
          <hr/>
          <div class="content">
            <div class="item" v-for="thesis in thesisList">
              <div class="card_box">
                <span></span>
                <p class="text1">{{ thesis.title }}</p>
                <p class="text2">{{ thesis.keywords[0] }};{{ thesis.keywords[1] }}</p>
                <p class="text3">{{ thesis.brief }}</p>
                <p class="text4">{{ thesis.time }}</p>
              </div>
            </div>
          </div>
          <div class="pagination">
            <el-pagination
                v-model:currentPage="paginationConfig.currentPage"
                layout="total, prev, pager, next"
                :page-size="paginationConfig.pageSize"
                :total="paginationConfig.total"
                @current-change="handlePageChange"
            />
          </div>
        </div>
        <div class="detail page1" v-if="currentNav == 3">
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
          <div class="pagination">
            <el-pagination
                v-model:currentPage="paginationConfig.currentPage"
                layout="total, prev, pager, next"
                :page-size="paginationConfig.pageSize"
                :total="paginationConfig.total"
                @current-change="handlePageChange"
            />
          </div>
        </div>
        <div class="detail page1" v-if="currentNav == 4">
          <div class="title">我的感兴趣>></div>
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
          <div class="pagination">
            <el-pagination
                v-model:currentPage="paginationConfig.currentPage"
                layout="total, prev, pager, next"
                :page-size="paginationConfig.pageSize"
                :total="paginationConfig.total"
                @current-change="handlePageChange"
            />
          </div>
        </div>
        <div class="detail page3" v-if="currentNav == 5">
          <div class="title">个人账户>></div>
          <br/>
          <hr/>
          <div class="title2">个人信息>></div>
          <el-form label-width="80px" :inline="true">
            <el-form-item label="用户名">
              <el-input type="text" v-model="user.username"/>
            </el-form-item>
            <el-form-item label="学校">
              <el-input type="text" v-model="user.school"/>
            </el-form-item>
            <el-form-item label="电话">
              <el-input type="text" v-model="user.phone"/>
            </el-form-item>
            <el-form-item label="性别">
              <el-radio-group v-model="user.sex">
                <el-radio label="男"/>
                <el-radio label="女"/>
              </el-radio-group>
            </el-form-item>
            <el-form-item label="邮箱">
              <el-input type="text" style="width: 500px" v-model="user.email"/>
            </el-form-item>
            <el-form-item label="个人简介">
              <el-input type="textarea" :autosize="{ minRows:3 }" v-model="user.description"
                        style="width: 500px"/>
            </el-form-item>
            <el-button type="primary" @click="userinfoEditClick">保存</el-button>
          </el-form>
          <div class="title2" style="margin-top: 50px;">感兴趣的知识点>></div>
          <div class="interest">
            <div
                class="kind"
                v-for="(kind, kindIndex) in kindItemList"
                :key="kindIndex"
            >
              <p class="kind-name">{{ kind.kindName }}</p>
              <div class="item">
                <p
                    class="item-name"
                    v-for="(item, itemIndex) in kind.items"
                    :key="itemIndex"
                    :class="item.isSelected === true ? 'selected' : ''"
                    @click="interestItemClick(kindIndex, itemIndex)"
                >
                  {{ item.itemName }}
                </p>
              </div>
            </div>
            <el-button type="primary" @click="interestEditClick">保存</el-button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import {defineComponent} from "vue";
import Top from "../../components/top.vue";
import { ElMessage } from 'element-plus'

export default defineComponent({
  name: "selfCenter",
  data() {
    return {
      data: "",
      currentNav: 1,
      paginationConfig: {
        currentPage: 1, // 当前页码
        pageSize: 4, // 每页显示的条数
        pageCount: 1, //总共有多少页
        total: 10, // 总条数
      },
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
      ],
      thesisList: [
        {
          id: '1',
          time: '2023/8/6',
          kind: '物理',
          item: '电路',
          title: '一般家庭电路的连接分析',
          author: '蛄蛹者',
          address: '优胜北路第三小学，湖南 长沙，410000',
          brief: '针对传统的无线传感器网络电源电路在电流能量的存储与分配方面存在的不足，提出了无线传感器网络电源电路优化改进方法。首先，构建电源电路优化配置模型，获取网络节点约束平衡功率指标；其次，结合网络电源开关种类，设计网络电源电路拓扑结构；再次，对传感器中所有的电源网络进行标号处理，采用双锂电池供电，设计传感器网络节点管理电路；最后，根据脉冲宽度与脉冲频率的特点，共同优化改进开关电源的调制模式。',
          keywords: ['无线传感器', '网络', '电源电路', '电源效率'],
          content: [
            {
              chapter: '一、项目背景',
              text: '目前，越来越多的行业应用无线传感器网络技术，使网络电源电路的节点功能不断增加。无线传感器网络电源电路的工作原理包括电源管理系统中能量流动原理、功率跟踪原理及充电原理。电源电路中的能量流动控制主要通过管理开关元件的导通与关断功能，实现能量流动方向控制与引导的目标。在电路管理中，根据无线传感器网络电源电路能量流动类型的不同，分为能量流动负载模型和电源模型。在电源管理电路中包括两种负载，分别为电池和电路节点电路的输出能量在为铅酸电池充电的同时，还能为超级电容充电，保证了无线传感器负载电路的稳定运行。'
            },
            {
              chapter: '二、设计网络电源电路拓扑结构',
              text: '在开关电源技术快速发展的趋势下，网络电源开关的种类越来越多，电路的拓扑结构也越来越复杂。采用 Buck-Boost 拓扑结构，再结合隔离变压器的调节控制作用，生成电源电路中常用的变换器。开关稳压电源与开关降压电源串联，将电源电压进行有功转换，控制晶体管的导通与关断时间，从而调节输出电压。该电路用于无线传感器网络的电源电路，其中包括电容和负载。'
            },
            {
              chapter: '三、仿真实验',
              text: '本次实验选择具有无线接入功能的网关抓包工具与具有无线传感器网络节点的设备，在单片机开发的 C 语言集成开发环境下，硬件配置为 3.20GHz的 CPU 和 4.00 GB 内存的 PC 机，软件配置为Windows7SP1 操作系统，运行环境为 Visual Stu‐dio2010。利用NS2网络仿真软件进行无线传感器网络仿真，实现无线传感器自动生成与可视化操作。实验采用集成电路充电管理芯片，型号为ML2496，具有铅酸电池充电管理的功能。'
            },
            {
              chapter: '四、结语',
              text: '本文提出的无线传感器网络电源电路优化改进方法，能够提供稳定的电源电压输出，其设计指标满足无线传感器基本性能指标要求。经过实验证明，本文设计的优化改进方法整体运行性能较好，电源的运行效率更加具有优势。但是，本文在无线传感器网络稳压模块方面的研究仍然存在一定的不足，网络稳压模块仅可接收 3 种传感器类型，在未来的研究中，应当进一步改进。'
            },
          ]
        },
        {
          id: '1',
          time: '2023/8/6',
          kind: '物理',
          item: '电路',
          title: '一般家庭电路的连接分析',
          author: '蛄蛹者',
          address: '优胜北路第三小学，湖南 长沙，410000',
          brief: '针对传统的无线传感器网络电源电路在电流能量的存储与分配方面存在的不足，提出了无线传感器网络电源电路优化改进方法。首先，构建电源电路优化配置模型，获取网络节点约束平衡功率指标；其次，结合网络电源开关种类，设计网络电源电路拓扑结构；再次，对传感器中所有的电源网络进行标号处理，采用双锂电池供电，设计传感器网络节点管理电路；最后，根据脉冲宽度与脉冲频率的特点，共同优化改进开关电源的调制模式。',
          keywords: ['无线传感器', '网络', '电源电路', '电源效率'],
          content: [
            {
              chapter: '一、项目背景',
              text: '目前，越来越多的行业应用无线传感器网络技术，使网络电源电路的节点功能不断增加。无线传感器网络电源电路的工作原理包括电源管理系统中能量流动原理、功率跟踪原理及充电原理。电源电路中的能量流动控制主要通过管理开关元件的导通与关断功能，实现能量流动方向控制与引导的目标。在电路管理中，根据无线传感器网络电源电路能量流动类型的不同，分为能量流动负载模型和电源模型。在电源管理电路中包括两种负载，分别为电池和电路节点电路的输出能量在为铅酸电池充电的同时，还能为超级电容充电，保证了无线传感器负载电路的稳定运行。'
            },
            {
              chapter: '二、设计网络电源电路拓扑结构',
              text: '在开关电源技术快速发展的趋势下，网络电源开关的种类越来越多，电路的拓扑结构也越来越复杂。采用 Buck-Boost 拓扑结构，再结合隔离变压器的调节控制作用，生成电源电路中常用的变换器。开关稳压电源与开关降压电源串联，将电源电压进行有功转换，控制晶体管的导通与关断时间，从而调节输出电压。该电路用于无线传感器网络的电源电路，其中包括电容和负载。'
            },
            {
              chapter: '三、仿真实验',
              text: '本次实验选择具有无线接入功能的网关抓包工具与具有无线传感器网络节点的设备，在单片机开发的 C 语言集成开发环境下，硬件配置为 3.20GHz的 CPU 和 4.00 GB 内存的 PC 机，软件配置为Windows7SP1 操作系统，运行环境为 Visual Stu‐dio2010。利用NS2网络仿真软件进行无线传感器网络仿真，实现无线传感器自动生成与可视化操作。实验采用集成电路充电管理芯片，型号为ML2496，具有铅酸电池充电管理的功能。'
            },
            {
              chapter: '四、结语',
              text: '本文提出的无线传感器网络电源电路优化改进方法，能够提供稳定的电源电压输出，其设计指标满足无线传感器基本性能指标要求。经过实验证明，本文设计的优化改进方法整体运行性能较好，电源的运行效率更加具有优势。但是，本文在无线传感器网络稳压模块方面的研究仍然存在一定的不足，网络稳压模块仅可接收 3 种传感器类型，在未来的研究中，应当进一步改进。'
            },
          ]
        },
        {
          id: '1',
          time: '2023/8/6',
          kind: '物理',
          item: '电路',
          title: '一般家庭电路的连接分析',
          author: '蛄蛹者',
          address: '优胜北路第三小学，湖南 长沙，410000',
          brief: '针对传统的无线传感器网络电源电路在电流能量的存储与分配方面存在的不足，提出了无线传感器网络电源电路优化改进方法。首先，构建电源电路优化配置模型，获取网络节点约束平衡功率指标；其次，结合网络电源开关种类，设计网络电源电路拓扑结构；再次，对传感器中所有的电源网络进行标号处理，采用双锂电池供电，设计传感器网络节点管理电路；最后，根据脉冲宽度与脉冲频率的特点，共同优化改进开关电源的调制模式。',
          keywords: ['无线传感器', '网络', '电源电路', '电源效率'],
          content: [
            {
              chapter: '一、项目背景',
              text: '目前，越来越多的行业应用无线传感器网络技术，使网络电源电路的节点功能不断增加。无线传感器网络电源电路的工作原理包括电源管理系统中能量流动原理、功率跟踪原理及充电原理。电源电路中的能量流动控制主要通过管理开关元件的导通与关断功能，实现能量流动方向控制与引导的目标。在电路管理中，根据无线传感器网络电源电路能量流动类型的不同，分为能量流动负载模型和电源模型。在电源管理电路中包括两种负载，分别为电池和电路节点电路的输出能量在为铅酸电池充电的同时，还能为超级电容充电，保证了无线传感器负载电路的稳定运行。'
            },
            {
              chapter: '二、设计网络电源电路拓扑结构',
              text: '在开关电源技术快速发展的趋势下，网络电源开关的种类越来越多，电路的拓扑结构也越来越复杂。采用 Buck-Boost 拓扑结构，再结合隔离变压器的调节控制作用，生成电源电路中常用的变换器。开关稳压电源与开关降压电源串联，将电源电压进行有功转换，控制晶体管的导通与关断时间，从而调节输出电压。该电路用于无线传感器网络的电源电路，其中包括电容和负载。'
            },
            {
              chapter: '三、仿真实验',
              text: '本次实验选择具有无线接入功能的网关抓包工具与具有无线传感器网络节点的设备，在单片机开发的 C 语言集成开发环境下，硬件配置为 3.20GHz的 CPU 和 4.00 GB 内存的 PC 机，软件配置为Windows7SP1 操作系统，运行环境为 Visual Stu‐dio2010。利用NS2网络仿真软件进行无线传感器网络仿真，实现无线传感器自动生成与可视化操作。实验采用集成电路充电管理芯片，型号为ML2496，具有铅酸电池充电管理的功能。'
            },
            {
              chapter: '四、结语',
              text: '本文提出的无线传感器网络电源电路优化改进方法，能够提供稳定的电源电压输出，其设计指标满足无线传感器基本性能指标要求。经过实验证明，本文设计的优化改进方法整体运行性能较好，电源的运行效率更加具有优势。但是，本文在无线传感器网络稳压模块方面的研究仍然存在一定的不足，网络稳压模块仅可接收 3 种传感器类型，在未来的研究中，应当进一步改进。'
            },
          ]
        },
        {
          id: '1',
          time: '2023/8/6',
          kind: '物理',
          item: '电路',
          title: '一般家庭电路的连接分析',
          author: '蛄蛹者',
          address: '优胜北路第三小学，湖南 长沙，410000',
          brief: '针对传统的无线传感器网络电源电路在电流能量的存储与分配方面存在的不足，提出了无线传感器网络电源电路优化改进方法。首先，构建电源电路优化配置模型，获取网络节点约束平衡功率指标；其次，结合网络电源开关种类，设计网络电源电路拓扑结构；再次，对传感器中所有的电源网络进行标号处理，采用双锂电池供电，设计传感器网络节点管理电路；最后，根据脉冲宽度与脉冲频率的特点，共同优化改进开关电源的调制模式。',
          keywords: ['无线传感器', '网络', '电源电路', '电源效率'],
          content: [
            {
              chapter: '一、项目背景',
              text: '目前，越来越多的行业应用无线传感器网络技术，使网络电源电路的节点功能不断增加。无线传感器网络电源电路的工作原理包括电源管理系统中能量流动原理、功率跟踪原理及充电原理。电源电路中的能量流动控制主要通过管理开关元件的导通与关断功能，实现能量流动方向控制与引导的目标。在电路管理中，根据无线传感器网络电源电路能量流动类型的不同，分为能量流动负载模型和电源模型。在电源管理电路中包括两种负载，分别为电池和电路节点电路的输出能量在为铅酸电池充电的同时，还能为超级电容充电，保证了无线传感器负载电路的稳定运行。'
            },
            {
              chapter: '二、设计网络电源电路拓扑结构',
              text: '在开关电源技术快速发展的趋势下，网络电源开关的种类越来越多，电路的拓扑结构也越来越复杂。采用 Buck-Boost 拓扑结构，再结合隔离变压器的调节控制作用，生成电源电路中常用的变换器。开关稳压电源与开关降压电源串联，将电源电压进行有功转换，控制晶体管的导通与关断时间，从而调节输出电压。该电路用于无线传感器网络的电源电路，其中包括电容和负载。'
            },
            {
              chapter: '三、仿真实验',
              text: '本次实验选择具有无线接入功能的网关抓包工具与具有无线传感器网络节点的设备，在单片机开发的 C 语言集成开发环境下，硬件配置为 3.20GHz的 CPU 和 4.00 GB 内存的 PC 机，软件配置为Windows7SP1 操作系统，运行环境为 Visual Stu‐dio2010。利用NS2网络仿真软件进行无线传感器网络仿真，实现无线传感器自动生成与可视化操作。实验采用集成电路充电管理芯片，型号为ML2496，具有铅酸电池充电管理的功能。'
            },
            {
              chapter: '四、结语',
              text: '本文提出的无线传感器网络电源电路优化改进方法，能够提供稳定的电源电压输出，其设计指标满足无线传感器基本性能指标要求。经过实验证明，本文设计的优化改进方法整体运行性能较好，电源的运行效率更加具有优势。但是，本文在无线传感器网络稳压模块方面的研究仍然存在一定的不足，网络稳压模块仅可接收 3 种传感器类型，在未来的研究中，应当进一步改进。'
            },
          ]
        },
        {
          id: '1',
          time: '2023/8/6',
          kind: '物理',
          item: '电路',
          title: '一般家庭电路的连接分析',
          author: '蛄蛹者',
          address: '优胜北路第三小学，湖南 长沙，410000',
          brief: '针对传统的无线传感器网络电源电路在电流能量的存储与分配方面存在的不足，提出了无线传感器网络电源电路优化改进方法。首先，构建电源电路优化配置模型，获取网络节点约束平衡功率指标；其次，结合网络电源开关种类，设计网络电源电路拓扑结构；再次，对传感器中所有的电源网络进行标号处理，采用双锂电池供电，设计传感器网络节点管理电路；最后，根据脉冲宽度与脉冲频率的特点，共同优化改进开关电源的调制模式。',
          keywords: ['无线传感器', '网络', '电源电路', '电源效率'],
          content: [
            {
              chapter: '一、项目背景',
              text: '目前，越来越多的行业应用无线传感器网络技术，使网络电源电路的节点功能不断增加。无线传感器网络电源电路的工作原理包括电源管理系统中能量流动原理、功率跟踪原理及充电原理。电源电路中的能量流动控制主要通过管理开关元件的导通与关断功能，实现能量流动方向控制与引导的目标。在电路管理中，根据无线传感器网络电源电路能量流动类型的不同，分为能量流动负载模型和电源模型。在电源管理电路中包括两种负载，分别为电池和电路节点电路的输出能量在为铅酸电池充电的同时，还能为超级电容充电，保证了无线传感器负载电路的稳定运行。'
            },
            {
              chapter: '二、设计网络电源电路拓扑结构',
              text: '在开关电源技术快速发展的趋势下，网络电源开关的种类越来越多，电路的拓扑结构也越来越复杂。采用 Buck-Boost 拓扑结构，再结合隔离变压器的调节控制作用，生成电源电路中常用的变换器。开关稳压电源与开关降压电源串联，将电源电压进行有功转换，控制晶体管的导通与关断时间，从而调节输出电压。该电路用于无线传感器网络的电源电路，其中包括电容和负载。'
            },
            {
              chapter: '三、仿真实验',
              text: '本次实验选择具有无线接入功能的网关抓包工具与具有无线传感器网络节点的设备，在单片机开发的 C 语言集成开发环境下，硬件配置为 3.20GHz的 CPU 和 4.00 GB 内存的 PC 机，软件配置为Windows7SP1 操作系统，运行环境为 Visual Stu‐dio2010。利用NS2网络仿真软件进行无线传感器网络仿真，实现无线传感器自动生成与可视化操作。实验采用集成电路充电管理芯片，型号为ML2496，具有铅酸电池充电管理的功能。'
            },
            {
              chapter: '四、结语',
              text: '本文提出的无线传感器网络电源电路优化改进方法，能够提供稳定的电源电压输出，其设计指标满足无线传感器基本性能指标要求。经过实验证明，本文设计的优化改进方法整体运行性能较好，电源的运行效率更加具有优势。但是，本文在无线传感器网络稳压模块方面的研究仍然存在一定的不足，网络稳压模块仅可接收 3 种传感器类型，在未来的研究中，应当进一步改进。'
            },
          ]
        },
        {
          id: '1',
          time: '2023/8/6',
          kind: '物理',
          item: '电路',
          title: '一般家庭电路的连接分析',
          author: '蛄蛹者',
          address: '优胜北路第三小学，湖南 长沙，410000',
          brief: '针对传统的无线传感器网络电源电路在电流能量的存储与分配方面存在的不足，提出了无线传感器网络电源电路优化改进方法。首先，构建电源电路优化配置模型，获取网络节点约束平衡功率指标；其次，结合网络电源开关种类，设计网络电源电路拓扑结构；再次，对传感器中所有的电源网络进行标号处理，采用双锂电池供电，设计传感器网络节点管理电路；最后，根据脉冲宽度与脉冲频率的特点，共同优化改进开关电源的调制模式。',
          keywords: ['无线传感器', '网络', '电源电路', '电源效率'],
          content: [
            {
              chapter: '一、项目背景',
              text: '目前，越来越多的行业应用无线传感器网络技术，使网络电源电路的节点功能不断增加。无线传感器网络电源电路的工作原理包括电源管理系统中能量流动原理、功率跟踪原理及充电原理。电源电路中的能量流动控制主要通过管理开关元件的导通与关断功能，实现能量流动方向控制与引导的目标。在电路管理中，根据无线传感器网络电源电路能量流动类型的不同，分为能量流动负载模型和电源模型。在电源管理电路中包括两种负载，分别为电池和电路节点电路的输出能量在为铅酸电池充电的同时，还能为超级电容充电，保证了无线传感器负载电路的稳定运行。'
            },
            {
              chapter: '二、设计网络电源电路拓扑结构',
              text: '在开关电源技术快速发展的趋势下，网络电源开关的种类越来越多，电路的拓扑结构也越来越复杂。采用 Buck-Boost 拓扑结构，再结合隔离变压器的调节控制作用，生成电源电路中常用的变换器。开关稳压电源与开关降压电源串联，将电源电压进行有功转换，控制晶体管的导通与关断时间，从而调节输出电压。该电路用于无线传感器网络的电源电路，其中包括电容和负载。'
            },
            {
              chapter: '三、仿真实验',
              text: '本次实验选择具有无线接入功能的网关抓包工具与具有无线传感器网络节点的设备，在单片机开发的 C 语言集成开发环境下，硬件配置为 3.20GHz的 CPU 和 4.00 GB 内存的 PC 机，软件配置为Windows7SP1 操作系统，运行环境为 Visual Stu‐dio2010。利用NS2网络仿真软件进行无线传感器网络仿真，实现无线传感器自动生成与可视化操作。实验采用集成电路充电管理芯片，型号为ML2496，具有铅酸电池充电管理的功能。'
            },
            {
              chapter: '四、结语',
              text: '本文提出的无线传感器网络电源电路优化改进方法，能够提供稳定的电源电压输出，其设计指标满足无线传感器基本性能指标要求。经过实验证明，本文设计的优化改进方法整体运行性能较好，电源的运行效率更加具有优势。但是，本文在无线传感器网络稳压模块方面的研究仍然存在一定的不足，网络稳压模块仅可接收 3 种传感器类型，在未来的研究中，应当进一步改进。'
            },
          ]
        },
        {
          id: '1',
          time: '2023/8/6',
          kind: '物理',
          item: '电路',
          title: '一般家庭电路的连接分析',
          author: '蛄蛹者',
          address: '优胜北路第三小学，湖南 长沙，410000',
          brief: '针对传统的无线传感器网络电源电路在电流能量的存储与分配方面存在的不足，提出了无线传感器网络电源电路优化改进方法。首先，构建电源电路优化配置模型，获取网络节点约束平衡功率指标；其次，结合网络电源开关种类，设计网络电源电路拓扑结构；再次，对传感器中所有的电源网络进行标号处理，采用双锂电池供电，设计传感器网络节点管理电路；最后，根据脉冲宽度与脉冲频率的特点，共同优化改进开关电源的调制模式。',
          keywords: ['无线传感器', '网络', '电源电路', '电源效率'],
          content: [
            {
              chapter: '一、项目背景',
              text: '目前，越来越多的行业应用无线传感器网络技术，使网络电源电路的节点功能不断增加。无线传感器网络电源电路的工作原理包括电源管理系统中能量流动原理、功率跟踪原理及充电原理。电源电路中的能量流动控制主要通过管理开关元件的导通与关断功能，实现能量流动方向控制与引导的目标。在电路管理中，根据无线传感器网络电源电路能量流动类型的不同，分为能量流动负载模型和电源模型。在电源管理电路中包括两种负载，分别为电池和电路节点电路的输出能量在为铅酸电池充电的同时，还能为超级电容充电，保证了无线传感器负载电路的稳定运行。'
            },
            {
              chapter: '二、设计网络电源电路拓扑结构',
              text: '在开关电源技术快速发展的趋势下，网络电源开关的种类越来越多，电路的拓扑结构也越来越复杂。采用 Buck-Boost 拓扑结构，再结合隔离变压器的调节控制作用，生成电源电路中常用的变换器。开关稳压电源与开关降压电源串联，将电源电压进行有功转换，控制晶体管的导通与关断时间，从而调节输出电压。该电路用于无线传感器网络的电源电路，其中包括电容和负载。'
            },
            {
              chapter: '三、仿真实验',
              text: '本次实验选择具有无线接入功能的网关抓包工具与具有无线传感器网络节点的设备，在单片机开发的 C 语言集成开发环境下，硬件配置为 3.20GHz的 CPU 和 4.00 GB 内存的 PC 机，软件配置为Windows7SP1 操作系统，运行环境为 Visual Stu‐dio2010。利用NS2网络仿真软件进行无线传感器网络仿真，实现无线传感器自动生成与可视化操作。实验采用集成电路充电管理芯片，型号为ML2496，具有铅酸电池充电管理的功能。'
            },
            {
              chapter: '四、结语',
              text: '本文提出的无线传感器网络电源电路优化改进方法，能够提供稳定的电源电压输出，其设计指标满足无线传感器基本性能指标要求。经过实验证明，本文设计的优化改进方法整体运行性能较好，电源的运行效率更加具有优势。但是，本文在无线传感器网络稳压模块方面的研究仍然存在一定的不足，网络稳压模块仅可接收 3 种传感器类型，在未来的研究中，应当进一步改进。'
            },
          ]
        },
      ],
      kindList: ['全部', '编程', '材料', '物理', '化学'],
      selectedKind: 0,
      //感兴趣的知识点
      kindItemList: [
        {
          kindId: 1,
          kindName: "编程",
          items: [
            {
              itemId: 1,
              itemName: "排序算法",
              isSelected: true,
            },
            {
              itemId: 2,
              itemName: "链表",
              isSelected: false,
            },
            {
              itemId: 3,
              itemName: "数组",
              isSelected: true,
            },
            {
              itemId: 4,
              itemName: "对象",
              isSelected: false,
            }
          ],
        },
        {
          kindId: 2,
          kindName: "材料",
          items: [
            {
              itemId: 1,
              itemName: "排序算法",
              isSelected: false,
            },
            {
              itemId: 2,
              itemName: "链表",
              isSelected: false,
            },
            {
              itemId: 3,
              itemName: "数组",
              isSelected: false,
            },
            {
              itemId: 4,
              itemName: "对象",
              isSelected: false,
            },
          ],
        },
        {
          kindId: 3,
          kindName: "物理",
          items: [
            {
              itemId: 1,
              itemName: "排序算法",
              isSelected: false,
            },
            {
              itemId: 2,
              itemName: "链表",
              isSelected: false,
            },
            {
              itemId: 3,
              itemName: "数组",
              isSelected: false,
            },
            {
              itemId: 4,
              itemName: "对象",
              isSelected: false,
            },
          ],
        },
        {
          kindId: 4,
          kindName: "化学",
          items: [
            {
              itemId: 1,
              itemName: "排序算法",
              isSelected: false,
            },
            {
              itemId: 2,
              itemName: "链表",
              isSelected: false,
            },
            {
              itemId: 3,
              itemName: "数组",
              isSelected: false,
            },
            {
              itemId: 4,
              itemName: "对象",
              isSelected: false,
            },
          ],
        },
      ],
    };
  },
  components: {Top},
  mounted() {
  },
  methods: {
    ready() {
    },
    // 翻页
    handlePageChange(val: number) {
      this.paginationConfig.currentPage = val;
      console.log("当前页面数为：" + val);
      // this.getThesis();
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
    },
    interestItemClick(kindIndex: number, itemIndex: number) {
      let isSelected = this.kindItemList[kindIndex].items[itemIndex].isSelected;
      this.kindItemList[kindIndex].items[itemIndex].isSelected = !isSelected;
    },
    //修改用户个人信息
    userinfoEditClick() {
      ElMessage({
        message: '个人信息修改成功！',
        type: 'success',
      })
    },
    //修改感兴趣的知识点
    interestEditClick() {
      ElMessage({
        message: '感兴趣的知识点修改成功！',
        type: 'success',
      })
    },

  },
});
</script>

<style lang="scss" scoped>
@import "../../assets/style/css/user/selfCenter.scss";
</style>
