const menu = {
    list() {
        return [{
            "backMenu": [{
                "child": [{
                    "allButtons": ["新增", "查看", "修改", "删除"],
                    "appFrontIcon": "cuIcon-list",
                    "buttons": ["新增", "查看", "修改", "删除"],
                    "menu": "活动地区",
                    "menuJump": "列表",
                    "tableName": "huodongdiqu"
                }], "menu": "活动地区管理"
            }, {
                "child": [{
                    "allButtons": ["新增", "查看", "修改", "删除"],
                    "appFrontIcon": "cuIcon-present",
                    "buttons": ["新增", "查看", "修改", "删除"],
                    "menu": "活动类型",
                    "menuJump": "列表",
                    "tableName": "huodongleixing"
                }], "menu": "活动类型管理"
            }, {
                "child": [{
                    "allButtons": ["新增", "查看", "修改", "删除", "报名活动"],
                    "appFrontIcon": "cuIcon-flashlightopen",
                    "buttons": ["新增", "查看", "修改", "删除"],
                    "menu": "活动信息",
                    "menuJump": "列表",
                    "tableName": "huodongxinxi"
                }], "menu": "活动信息管理"
            }, {
                "child": [{
                    "allButtons": ["新增", "查看", "修改", "删除", "报名活动"],
                    "appFrontIcon": "cuIcon-flashlightopen",
                    "buttons": ["新增", "查看", "修改", "删除"],
                    "menu": "报名信息",
                    "menuJump": "列表",
                    "tableName": "baomingxinxi"
                }], "menu": "报名信息管理"
            },
                {
                    "child": [{
                        "allButtons": ["新增", "查看", "修改", "删除"],
                        "appFrontIcon": "cuIcon-present",
                        "buttons": ["新增", "查看", "修改", "删除"],
                        "menu": "用户",
                        "menuJump": "列表",
                        "tableName": "yonghu"
                    }], "menu": "用户管理"
                }, {
                    "child": [{
                        "allButtons": ["新增", "查看", "修改", "删除"],
                        "appFrontIcon": "cuIcon-newshot",
                        "buttons": ["查看", "修改", "删除"],
                        "menu": "攻略游记",
                        "menuJump": "列表",
                        "tableName": "yonghufabu"
                    }], "menu": "攻略游记管理"
                }, {
                    "child": [{
                        "allButtons": ["新增", "查看", "修改", "删除"],
                        "appFrontIcon": "cuIcon-group",
                        "buttons": ["查看", "修改", "删除"],
                        "menu": "圈子交流",
                        "tableName": "forum"
                    }], "menu": "圈子交流"
                }, {
                    "child": [{
                        "allButtons": ["新增", "查看", "修改", "删除"],
                        "appFrontIcon": "cuIcon-shop",
                        "buttons": ["查看", "修改"],
                        "menu": "轮播图管理",
                        "tableName": "config"
                    }, {
                        "allButtons": ["新增", "查看", "修改", "删除"],
                        "appFrontIcon": "cuIcon-news",
                        "buttons": ["新增", "查看", "修改", "删除"],
                        "menu": "公告资讯",
                        "tableName": "news"
                    }], "menu": "系统管理"
                }],
            "frontMenu": [],
            "hasBackLogin": "是",
            "hasBackRegister": "否",
            "hasFrontLogin": "否",
            "hasFrontRegister": "否",
            "roleName": "管理员",
            "tableName": "users"
        }, {
            "backMenu": [{
                "child": [{
                    "allButtons": ["新增", "查看", "修改", "删除", "报名活动"],
                    "appFrontIcon": "cuIcon-flashlightopen",
                    "buttons": ["查看", "报名活动"],
                    "menu": "活动信息",
                    "menuJump": "列表",
                    "tableName": "huodongxinxi"
                }], "menu": "活动信息管理"
            }, {
                "child": [{
                    "allButtons": ["新增", "查看", "修改", "删除"],
                    "appFrontIcon": "cuIcon-newshot",
                    "buttons": ["新增", "查看", "修改", "删除"],
                    "menu": "攻略游记",
                    "menuJump": "列表",
                    "tableName": "yonghufabu"
                }], "menu": "攻略游记管理"
            }, {
                "child": [{
                    "allButtons": ["新增", "查看", "修改", "删除", "支付"],
                    "appFrontIcon": "cuIcon-explore",
                    "buttons": ["查看", "支付"],
                    "menu": "订单信息",
                    "menuJump": "列表",
                    "tableName": "dingdanxinxi"
                }], "menu": "订单信息管理"
            }, {
                "child": [{
                    "allButtons": ["新增", "查看", "修改", "删除"],
                    "appFrontIcon": "cuIcon-favor",
                    "buttons": ["查看", "删除"],
                    "menu": "我的收藏",
                    "menuJump": "1",
                    "tableName": "storeup"
                }], "menu": "我的收藏管理"
            }],
            "frontMenu": [],
            "hasBackLogin": "否",
            "hasBackRegister": "否",
            "hasFrontLogin": "是",
            "hasFrontRegister": "是",
            "roleName": "用户",
            "tableName": "yonghu"
        }]
    }
}
export default menu;
