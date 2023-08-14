<template>
  <!--  顶部导航栏-->
<!--  <Top/>-->

  <div class="container">
    <div class="main">
      <!--左侧公告list-->
      <div class="descriptionList">
        <div class="desc">
          <div class="pretty-radio-div">
            <label class="div">
              <input type="radio" id="check1" name="desc" checked="checked" @click="checkedItem=1">
              <div class="checkmark"></div>
            </label>
          </div>
          <label for="check1" :class="checkedItem===1?'checked':''" @click="checkedItem=1">系统描述</label>
        </div>
        <div class="desc">
          <div class="pretty-radio-div">
            <label class="div">
              <input type="radio" id="check2" name="desc" @click="checkedItem=2">
              <div class="checkmark"></div>
            </label>
          </div>
          <label for="check2" :class="checkedItem===2?'checked':''" @click="checkedItem=2">编程</label>
        </div>
        <div class="desc">
          <div class="pretty-radio-div">
            <label class="div">
              <input type="radio" id="check3" name="desc">
              <div class="checkmark"></div>
            </label>
          </div>
          <label for="check3" :class="checkedItem===3?'checked':''" @click="checkedItem=3">材料</label>
        </div>
        <div class="desc">
          <div class="pretty-radio-div">
            <label class="div">
              <input type="radio" id="check4" name="desc">
              <div class="checkmark"></div>
            </label>
          </div>
          <label for="check4" :class="checkedItem===4?'checked':''" @click="checkedItem=4">物理</label>
        </div>
        <div class="desc">
          <div class="pretty-radio-div">
            <label class="div">
              <input type="radio" id="check5" name="desc">
              <div class="checkmark"></div>
            </label>
          </div>
          <label for="check5" :class="checkedItem===5?'checked':''" @click="checkedItem=5">化学</label>
        </div>
      </div>

      <div class="details">
        <div class="check1" v-if="checkedItem===1">
          <div class="cube-container">
            <div class="cube">
              <div class="face front">
                <el-icon size="40px">
                  <Cpu/>
                </el-icon>
                <p class="tag-text">AI协助</p>
              </div>
              <div class="face back">
                <el-icon size="40px">
                  <VideoPlay/>
                </el-icon>
                <p class="tag-text">配套游戏</p>
              </div>
              <div class="face right"><el-icon size="40px">
                <ChromeFilled/>
              </el-icon>
                <p class="tag-text">支持联机</p></div>
              <div class="face left"><el-icon size="40px">
                <DocumentChecked/>
              </el-icon>
                <p class="tag-text">巩固练习</p></div>
              <div class="face top"><el-icon size="40px">
                <Document/>
              </el-icon>
                <p class="tag-text">生成论文</p></div>
              <div class="face bottom"><el-icon size="40px">
                <DataAnalysis/>
              </el-icon>
                <p class="tag-text">数据可视</p></div>
            </div>
          </div>

        </div>

        <div class="check2" v-if="checkedItem===2">
          <div class="code-editor">
            <div class="header">
              <span class="title">CSS</span>
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" class="icon"><g stroke-width="0" id="SVGRepo_bgCarrier"></g><g stroke-linejoin="round" stroke-linecap="round" id="SVGRepo_tracerCarrier"></g><g id="SVGRepo_iconCarrier"> <path stroke-linecap="round" stroke-width="2" stroke="#4C4F5A" d="M6 6L18 18"></path> <path stroke-linecap="round" stroke-width="2" stroke="#4C4F5A" d="M18 6L6 18"></path> </g></svg>
            </div>
            <div class="editor-content">
              <code class="code">
                <p><span class="color-0">.code-editor </span> <span>{</span></p>

                <p class="property">
                  <span class="color-2">max-width</span><span>:</span>
                  <span class="color-1">300px</span>;
                </p>
                <p class="property">
                  <span class="color-2">background-color</span><span>:</span>
                  <span class="color-preview-1"></span><span class="">#1d1e22</span>;
                </p>
                <p class="property">
                  <span class="color-2"> box-shadow</span><span>:</span>
                  <span class="color-1">0px 4px 30px  <span class="color-preview-2"></span><span class="color-3">rgba(</span>0, 0, 0, 0.5<span class="color-3">)</span></span>;
                </p>
                <p class="property">
                  <span class="color-2">border-radius</span><span>:</span>
                  <span class="color-1">8px</span>;
                </p>
                <span>}</span>
              </code>
            </div>
          </div>
        </div>

        <div class="check3" v-if="checkedItem===3">
          <h2>材料</h2>
        </div>

        <div class="check4" v-if="checkedItem===4">
          <h2>物理</h2>
        </div>

        <div class="check5" v-if="checkedItem===5">
          <h2>化学</h2>
        </div>


      </div>

      <div class="pretty-button-div">
        <router-link to="/knowledge/index">
          <button>进入首页</button>
        </router-link>
        <router-link to="/user/login">
          <button>登录/注册</button>
        </router-link>
        <router-link to="/game/main ">
          <button>游戏界面</button>
        </router-link>
      </div>


    </div>
  </div>
</template>

<script lang="ts">

import Top from "../components/top.vue";

export default {
  name: "HomeView",
  components: {Top},
  data() {
    return {
      checkedItem: 1,

    }
  }
}
</script>

<style scoped lang="scss">
@import "../assets/style/css/homeview.scss";
</style>
