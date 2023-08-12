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

 Date: 12/08/2023 13:19:59
*/


// ----------------------------
// Collection structure for game
// ----------------------------
db.getCollection("game").drop();
db.createCollection("game");

// ----------------------------
// Documents of game
// ----------------------------
db.getCollection("game").insert([ {
    _id: 1,
    role: [
        {
            _id: 1,
            name: "林立",
            imgSrc: "role_1.png"
        },
        {
            _id: 2,
            name: "云清",
            imgSrc: "role_2.png"
        }
    ],
    rolePlotRemoveIndex: [
        [
            8,
            9,
            10,
            11,
            12
        ],
        [
            5,
            6,
            7
        ]
    ],
    plot: [
        [
            {
                imgSrc: "1.png",
                content: [
                    {
                        text: "云清：“林立，宝石博物馆真的太美啦，咱们先去A展厅看看吧！”"
                    },
                    {
                        text: "林立：“好呀好呀！”"
                    }
                ]
            },
            {
                imgSrc: "2.png",
                content: [
                    {
                        text: "云清：“林立，你快看这颗绿宝石，看起来很特别。”"
                    },
                    {
                        text: "林立：“展柜好像旁边有简介欸！”"
                    }
                ]
            }
        ],
        [
            {
                imgSrc: "3.png",
                content: [
                    {
                        text: "白慧：“听说C展厅有号称最美宝石的‘海洋之心’，将深沉静谧之美展现得淋漓尽致，我已经迫不及待去看看啦！”"
                    },
                    {
                        text: "张宇：“真的吗？咱们一起去吧！”"
                    }
                ]
            },
            {
                imgSrc: "4.png",
                content: [
                    {
                        text: "林立：“A展厅都看过啦，云清，我们也去C展厅看看吧！”"
                    }
                ]
            },
            {
                imgSrc: "5.png",
                content: [
                    {
                        text: "整个博物馆发出：“滴嘟——滴嘟——滴嘟”的声音。"
                    },
                    {
                        text: "游客们：“怎么回事？发生什么事了？”"
                    },
                    {
                        text: "白慧：“张宇，我好害怕，C馆内怎么黑漆漆的呀？”"
                    },
                    {
                        text: "张宇：“慧慧，咱们先保持冷静......一会儿工作人员肯定会说明情况的。”"
                    },
                    {
                        text: "工作人员王璐：“各位游客请保持冷静，我们刚刚检测到C展厅宝石失窃，现在已封锁博物馆出入口，排查出入人员，请大家呆在原地配合相关工作，给大家带来不便尽情谅解。”"
                    }
                ]
            },
            {
                imgSrc: "6.png",
                content: [
                    {
                        text: "王璐（对林立）：“请问您可以陪我去供电室看看吗？”"
                    },
                    {
                        text: "林立：“没问题，我们一起去看看是不是电路出现问题了。”"
                    },
                    {
                        text: "云清：“那我也和捏你们一起去吧！”"
                    }
                ]
            },
            {
                imgSrc: "7.png",
                content: [
                    {
                        text: "林立：“云清，要不你留在大厅帮忙维持秩序，查找线索，怎么样？”"
                    },
                    {
                        text: "云清：“好，那我们分头行动！"
                    }
                ]
            },
            {
                imgSrc: "8.png",
                content: [
                    {
                        text: "工作人员王璐说：“糟糕！我忘记告诉你前段时间场馆翻新，博物馆电路图还未更新，我们只能现场绘制一幅了。”"
                    },
                    {
                        text: "林立：“好，那我们先看看房间里有没有什么可以利用的线索。”"
                    },
                    {
                        text: "工作人员王璐说：“目前只有入口、阅览室、大厅没有变化，其他房间位置不清楚，我们要确定房间位置后绘制相关线路。”"
                    }
                ]
            },
            {
                imgSrc: "9.png",
                content: [
                    {
                        text: ""
                    }
                ]
            },
            {
                imgSrc: "10.png",
                content: [
                    {
                        text: "出现一本关于电路的书，请结合之前学习知识思考"
                    }
                ]
            },
            {
                imgSrc: "11.png",
                content: [
                    {
                        text: "李明：“这博物馆咋管理的？在这里就是耽误大家时间，指不定嫌疑人早跑了。”"
                    },
                    {
                        text: "游客张宇：“我正兴致勃勃地在C展厅观赏，突然就停电了，可把大家吓了一大跳，是不是跳闸了呀？”"
                    },
                    {
                        text: "云清：“已经有人去查看了，您不要担心。”"
                    },
                    {
                        text: "白慧：“我刚去C展厅的厕所洗手，那个厕所有点奇怪，裸露的电线就随意丢在地上，万一漏电了怎么办？让大家上厕所的时候提心吊胆的。”"
                    },
                    {
                        text: "云清：“怎么会有裸露的电线呢？我和您一起去厕所看看吧。”"
                    }
                ]
            },
            {
                imgSrc: "12.png",
                content: [
                    {
                        text: "白慧和云清一同来到厕所进行查看。"
                    }
                ]
            },
            {
                imgSrc: "13.png",
                content: [
                    {
                        text: ""
                    }
                ]
            },
            {
                imgSrc: "14.png",
                content: [
                    {
                        text: ""
                    }
                ]
            },
            {
                imgSrc: "15.png",
                content: [
                    {
                        text: "断路和短路的知识点有标记重点的痕迹"
                    }
                ]
            },
            {
                imgSrc: "16.png",
                content: [
                    {
                        text: "林立、云清决定回到大厅，交换线索后一同找出嫌疑人。"
                    },
                    {
                        text: "林立：“云清，场馆翻修之后还没有新电路图，幸运的是，我学会了串联和并联的知识点，等会我给你讲解，咱们再一起绘制出完整的电路图吧。””"
                    }
                ]
            },
            {
                imgSrc: "17.png",
                content: [
                    {
                        text: ""
                    }
                ]
            },
            {
                imgSrc: "18.png",
                content: [
                    {
                        text: "云清：“请问为什么厕所会有监控呢？”"
                    },
                    {
                        text: "王璐：“最开始那里不是厕所，场馆装修后，就将原本监控的路线剪断，同时改建成了厕所。”"
                    }
                ]
            },
            {
                imgSrc: "19.png",
                content: [
                    {
                        text: "经过林立和云清的努力，C展厅恢复了用电。"
                    },
                    {
                        text: "工作人员王璐：“林立云清，我们去监控室看看吧，只要找出是谁在C展厅停电前那段时间进入C展厅旁边的厕所，就能进一步锁定嫌疑人。”"
                    },
                    {
                        text: "林立云清：“好。”"
                    }
                ]
            },
            {
                imgSrc: "20.png",
                content: [
                    {
                        text: "当工作人员带林立云清到达监控室时，博物馆突然断电，黑暗的恐惧向林丽云清以及游客们袭来。"
                    }
                ]
            },
            {
                imgSrc: "21.png",
                content: [
                    {
                        text: "“啪——”工作人员王璐打开手电筒，对着监控室兼供电室进行照明。"
                    },
                    {
                        text: "电闸：并没有断开；"
                    },
                    {
                        text: "供电箱：点击发现温度过高。工作人员摸了一下说：“供电箱好烫。”且不一会儿就冒出黑烟，云清说：“怎么有一股烧糊的味道？”"
                    },
                    {
                        text: "照到墙壁上，发现隔壁厕所传来阵阵杂声（敲击声或剪刀剪东西的声音）"
                    },
                    {
                        text: "林立：“隔壁是正是供电室的厕所，嫌疑人也许就在隔壁，我们赶快过去查看吧！”"
                    }
                ]
            },
            {
                imgSrc: "22.jpg",
                content: [
                    {
                        text: "云清：“馆内比较黑，大家小心脚下，别摔跤了。”"
                    },
                    {
                        text: "突然“啪——”的一声，好像有人重重的摔在了地上。"
                    },
                    {
                        text: "工作人员用手电筒一照，发现是游客李明狼狈地摔在地上，身旁好像有东西在闪着光......"
                    },
                    {
                        text: "林立：“云清，王姐，我先去切断厕所短接的电源。”"
                    },
                    {
                        text: "不一会儿，博物馆亮堂起来，李明旁边的确有东西闪着光。"
                    },
                    {
                        text: "工作人员向前一步。王璐：“太好啦！是宝石‘海洋之心’，这正是C展厅失窃的宝石。”"
                    },
                    {
                        text: "林立云清上前控制住李明：“老实点！警察马上就来了！”"
                    }
                ]
            },
            {
                imgSrc: "23.jpg",
                content: [
                    {
                        text: "“嘀呜——嘀呜——嘀呜”警笛声响起，李明被带走。"
                    },
                    {
                        text: "“啪啪啪——啪啪啪”“真棒！”“太好了！”游客们纷纷为找出盗窃者而欢呼，也不吝夸奖林立云清。"
                    }
                ]
            }
        ]
    ],
    choices: [
        [
            {
                _id: 1,
                name: "绿宝石",
                description: "绿碧玺：深层地质中经过百般变化而凝练成的一抹绿色，深邃绿意中隐撤的神奇能量。它象征着希望、健康以及蓬勃盎然的生命力，被称作“生命之花”。",
                imgSrc: "string"
            }
        ]
    ],
    reinforce: [
        {
            question: "string",
            choice: [
                "string",
                "string",
                "string",
                "string"
            ],
            answer: 1,
            explain: "string",
            score: 20
        },
        {
            question: "string",
            choice: [
                "string",
                "string",
                "string",
                "string"
            ],
            answer: 3,
            explain: "string",
            score: 20
        },
        {
            question: "string",
            choice: [
                "string",
                "string",
                "string",
                "string"
            ],
            answer: 2,
            explain: "string",
            score: 20
        },
        {
            question: "string",
            choice: [
                "string",
                "string",
                "string",
                "string"
            ],
            answer: 4,
            explain: "string",
            score: 20
        },
        {
            question: "string",
            choice: [
                "string",
                "string",
                "string",
                "string"
            ],
            answer: 1,
            explain: "string",
            score: 20
        }
    ]
} ]);

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
db.getCollection("paper").insert([ {
    _id: ObjectId("64d4fce0b674753a4c22d9cd"),
    account: NumberInt("3"),
    time: "2023-08-10 23:06:08",
    kind: "编程",
    item: "单元测试",
    title: "些第又后能存",
    author: "occaecat aliquip",
    address: "辽宁省黄石市日土县",
    brief: "minim deserunt cillum et laborum",
    keywords: [
        "ut",
        "Loremn"
    ],
    content: [
        "dolor ut anim",
        "elit esse aliqua",
        "do voluptate ex tempor",
        "volupta fsda"
    ],
    _class: "cn.edu.csu.ycepspring.entity.po.mongo.PaperDocument"
} ]);
