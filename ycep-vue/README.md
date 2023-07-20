# ycep-vue
## 项目运行
* npm install
* npm run dev

## 目录介绍
* api 用于存放各种接口函数参考 test.ts
* assert 存放图片、字体以及scss等样式文件，参考 test.css
* components 自定义组件，例如每个界面都需要的导航栏就在其中定义
* router 路由，用于实现页面跳转
* utils 存放公用函数，例如request就是同意封装axios请求
* views 用于存放界面，参考 test.vue

## 部分要求
* 公用函数一般用utils里面的common同意封装，界面中单独可直接写在vue文件中，少部分css样式可直接在vue界面中给出，大部分建议定义scss文件进行统一管理
* 本次vue项目采用选项式 API 进行开发，详情查看 https://cn.vuejs.org/guide/introduction.html#api-styles
* 项目可以使用element组件库，其icon以及所有组件均已自动引入，直接使用即可，使用方式详情查看element官方文档 https://element-plus.org/zh-CN/component/button.html 但是因为我们使用的是选项式编程，所以建议参考element之前的文档  https://element.eleme.cn/#/zh-CN/component/switch 

## git 使用说明
* 第一次拉取项目，以vscode为例子，在命令行中输入 
```
# 克隆项目
git clone https://github.com/PRay011/YCEP.git
# 进入前端文件
cd YCEP
# 切换到front分支
git checkout -b front origin/front
```
* 完成部分上传合并时
> 注意：上传时需要将整个文件夹上传，需要包括后端文件夹，上传ycep
```
git add .
# 本地保存
git commit -m '这里面写注释（就是你做了什么事）'
# 拉取别人上传的代码
git pull
# 这里要进行本地合并，找到文件中冲突的地方，删除不需要的，保留需要的，注意仔细
# 合并完成之后再次
git add .
git commit -m '注释'
git push
```