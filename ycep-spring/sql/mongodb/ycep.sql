/*
 Navicat Premium Data Transfer

 Source Server         : MongoDB
 Source Server Type    : MongoDB
 Source Server Version : 60008 (6.0.8)
 Source Host           : localhost:27017
 Source Schema         : ycep

 Target Server Type    : MongoDB
 Target Server Version : 60008 (6.0.8)
 File Encoding         : 65001

 Date: 06/08/2023 09:25:42
*/


// ----------------------------
// Collection structure for game
// ----------------------------
db.getCollection("game").drop();
db.createCollection("game");

// ----------------------------
// Documents of game
// ----------------------------

// ----------------------------
// Collection structure for knowledge
// ----------------------------
db.getCollection("knowledge").drop();
db.createCollection("knowledge");

// ----------------------------
// Documents of knowledge
// ----------------------------
db.getCollection("knowledge").insert([ {
    _id: 1,
    title: "电路设计",
    author: "张晓明",
    desc: "你有想过吗？灯泡是怎么亮起来的呢？",
    content: [
        {
            text: "第一步，了解火线、零线、地线",
            imgSrc: "http://dummyimage.com/400x400"
        },
        {
            text: "第二步，设计电路",
            imgSrc: "http://dummyimage.com/400x400"
        },
        {
            text: "第三步，连接电路和灯泡",
            imgSrc: "http://dummyimage.com/400x400"
        },
        {
            text: "第四步，通电",
            imgSrc: "http://dummyimage.com/400x400"
        },
        {
            text: "第五步，打开开关",
            imgSrc: "http://dummyimage.com/400x400"
        }
    ],
    videoSrc: "abc"
} ]);

// ----------------------------
// Collection structure for paper
// ----------------------------
db.getCollection("paper").drop();
db.createCollection("paper");

// ----------------------------
// Documents of paper
// ----------------------------
