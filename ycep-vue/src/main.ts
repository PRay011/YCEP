import './assets/main.css'
import 'element-plus/dist/index.css'
import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import * as ElementPlusIconsVue from '@element-plus/icons-vue'
import VueAxios from 'vue-axios'
import axios from 'axios'

const app = createApp(App)
for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
    app.component(key, component)
}
app.use(VueAxios, axios);
app.use(router)
app.config.globalProperties.$imgHost = 'https://image.tdsmy.cn/ycep/'
// app.config.globalProperties.$imgHost = 'http://localhost:8081/static/'

app.mount('#app')

// 跳转后返回顶部
router.afterEach((to, from, next) => {
    window.scrollTo(0, 0);
})

// 首页引导插件
import intro from 'intro.js' // introjs库
import 'intro.js/introjs.css' // introjs默认css样式
// introjs还提供了多种主题，可以通过以下方式引入
import 'intro.js/themes/introjs-modern.css' // introjs主题

// 把intro.js加入到vue的prototype中，方便使用，就可以直接通过this.$intro()来调用了
app.config.globalProperties.$intro = intro





