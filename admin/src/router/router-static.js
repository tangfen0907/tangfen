import Vue from 'vue';
//配置路由
import VueRouter from 'vue-router'

Vue.use(VueRouter);
//1.创建组件
import Index from '@/views/index'
import Home from '@/views/home'
import Login from '@/views/login'
import NotFound from '@/views/404'
import UpdatePassword from '@/views/update-password'
import map from '@/views/map'
import register from '@/views/register'
import center from '@/views/center'
import forum from '@/views/modules/forum/list'
import news from '@/views/modules/news/list'
import huodongdiqu from '@/views/modules/huodongdiqu/list'
import yonghufabu from '@/views/modules/yonghufabu/list'
import yonghu from '@/views/modules/yonghu/list'
import dingdanxinxi from '@/views/modules/dingdanxinxi/list'
import huodongxinxi from '@/views/modules/huodongxinxi/list'
import storeup from '@/views/modules/storeup/list'
import config from '@/views/modules/config/list'
import huodongleixing from '@/views/modules/huodongleixing/list'
import baomingxinxi from '@/views/modules/baomingxinxi/list'

//2.配置路由   注意：名字
const routes = [{
    path: '/index',
    name: '首页',
    component: Index,
    children: [{
        // 这里不设置值，是把main作为默认页面
        path: '/',
        name: '首页',
        component: Home,
        meta: {icon: '', title: 'center'}
    }, {
        path: '/updatePassword',
        name: '修改密码',
        component: UpdatePassword,
        meta: {icon: '', title: 'updatePassword'}
    },
         {
            path: '/center',
            name: '个人信息',
            component: center,
            meta: {icon: '', title: 'center'}
        }
        , {
            path: '/forum',
            name: '圈子交流',
            component: forum
        }
        , {
            path: '/news',
            name: '公告资讯',
            component: news
        }
        , {
            path: '/huodongdiqu',
            name: '活动地区',
            component: huodongdiqu
        }
        , {
            path: '/yonghufabu',
            name: '用户发布',
            component: yonghufabu
        }
        , {
            path: '/yonghu',
            name: '用户',
            component: yonghu
        }
        , {
            path: '/dingdanxinxi',
            name: '订单信息',
            component: dingdanxinxi
        }
        , {
            path: '/huodongxinxi',
            name: '活动信息',
            component: huodongxinxi
        },{
            path: '/baomingxinxi',
            name: '报名信息',
            component: baomingxinxi

        } , {
            path: '/storeup',
            name: '我的收藏',
            component: storeup
        }
        , {
            path: '/config',
            name: '轮播图管理',
            component: config
        }
        , {
            path: '/huodongleixing',
            name: '活动类型',
            component: huodongleixing
        }
    ]
},
    {
        path: '/login',
        name: 'login',
        component: Login,
        meta: {icon: '', title: 'login'}
    },
    {
        path: '/register',
        name: 'register',
        component: register,
        meta: {icon: '', title: 'register'}
    },
    {
        path: '/map',
        name: 'map',
        component: map,
        meta: {icon: '', title: 'map'}
    },
    {
        path: '/',
        name: '首页',
        redirect: '/index'
    }, /*默认跳转路由*/
    {
        path: '*',
        component: NotFound
    }
]
//3.实例化VueRouter  注意：名字
const router = new VueRouter({
    mode: 'hash',
    /*hash模式改为history*/
    routes // （缩写）相当于 routes: routes
})

export default router;
