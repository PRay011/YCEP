<template>
  <!--  顶部导航栏-->
  <Top/>

  <div class="container">
    <div class="main">
      <div class="title">
        <p v-for="item in dataList[2].knowledge">{{ item }}</p>
        <div class="search">
          <div class="input-container">
            <input type="text" name="text" class="input" placeholder="搜索...">
            <span class="icon">
            <svg width="23px" height="23px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
              <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
              <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
              <g id="SVGRepo_iconCarrier">
                <path opacity="1" d="M14 5H20" stroke="#000" stroke-width="1.5" stroke-linecap="round"
                      stroke-linejoin="round"></path>
                <path opacity="1" d="M14 8H17" stroke="#000" stroke-width="1.5" stroke-linecap="round"
                      stroke-linejoin="round"></path>
                <path d="M21 11.5C21 16.75 16.75 21 11.5 21C6.25 21 2 16.75 2 11.5C2 6.25 6.25 2 11.5 2" stroke="#000"
                      stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"></path>
                <path opacity="1" d="M22 22L20 20" stroke="#000" stroke-width="3.5" stroke-linecap="round"
                      stroke-linejoin="round"></path>
              </g>
            </svg>
          </span>
          </div>
        </div>
      </div>

      <div class="body">
        <div class="left">


        </div>
        <div class="right">


        </div>

      </div>

    </div>

  </div>


</template>

<script>
import {defineComponent} from "vue";
import Top from "../../components/top.vue";

export default defineComponent({
  name: "kind",
  components: {Top},
  data() {
    return {
      kind: 0,
      dataList: [
        {
          kind: 1,
          knowledge: ['全部','数组', '算式', '排序', '追及']
        },
        {
          kind: 2,
          knowledge: ['全部','木材', '钢材', '芯片', '物联网']
        },
        {
          kind: 3,
          knowledge: ['全部','电路', '太空', '力', '电磁']
        },
        {
          kind: 4,
          knowledge: ['全部','液体', '固体', '气体', '合成']
        }
      ]
    }
  },
  mounted() {
    this.ready();
  },
  methods: {
    ready() {
      let kind = this.$route.query.kind;
      console.log(kind)
      this.kind = kind
    }
  }

})
</script>

<style scoped lang="scss">
@media (min-width: 1024px) {
  .container {
    min-height: 100vh;
    display: flex;
    align-items: center;
  }
}

.main {
  width: 100%;

  .title {
    display: flex;
    width: 85%;
    height: 80px;
    background-color: #e2e2e2;
    margin: 20px auto;

    p {
      font-size: 20px;
      color: #181818;
      margin-left: 50px;
      margin-right: 30px;
      line-height: 80px;
    }

    .search {
      margin-left: auto;
      margin-right: 50px;

      .input-container {
        line-height: 80px;
        width: 350px;
        position: relative;
      }

      .icon {
        position: absolute;
        right: 15px;
        top: calc(50% + 10px);
        transform: translateY(calc(-50% - 5px));
      }

      .input {
        width: 100%;
        height: 50px;
        padding: 10px;
        transition: .2s linear;
        border: 2.5px solid black;
        font-size: 18px;
        text-transform: uppercase;
        letter-spacing: 2px;
      }

      .input:focus {
        outline: none;
        border: 0.5px solid black;
        box-shadow: -5px -5px 0px black;
      }

      .input-container:hover > .icon {
        animation: anim 1s linear infinite;
      }

      @keyframes anim {
        0%,
        100% {
          transform: translateY(calc(-50% - 5px)) scale(1);
        }

        50% {
          transform: translateY(calc(-50% - 5px)) scale(1.1);
        }
      }
    }

  }

  .body{
    display: flex;
    margin-top: 80px;

    .left{
      width:65%;
      margin-left: 150px;
      height: 700px;
      background-color: #e2e2e2;

    }

    .right{
      margin-left: auto;
      margin-right: 150px;
      width:17%;
      height:700px;
      background-color: #a1a1a1;
    }
  }
}


</style>
