(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["pages-index-index"],{"0d9b":function(e,r,i){"use strict";var t=i("4ea4");Object.defineProperty(r,"__esModule",{value:!0}),r.default=void 0,i("ac4d"),i("8a81"),i("55dd"),i("ac6a"),i("96cf");var o=t(i("3b8d")),a=t(i("2971"));i("651d");var d=t(i("b704")),n={components:{uniIcons:d.default},data:function(){return{rows:2,column:5,iconArr:["cuIcon-same","cuIcon-deliver","cuIcon-evaluate","cuIcon-shop","cuIcon-ticket","cuIcon-cascades","cuIcon-discover","cuIcon-question","cuIcon-pic","cuIcon-filter","cuIcon-footprint","cuIcon-pulldown","cuIcon-pullup","cuIcon-moreandroid","cuIcon-refund","cuIcon-qrcode","cuIcon-remind","cuIcon-profile","cuIcon-home","cuIcon-message","cuIcon-link","cuIcon-lock","cuIcon-unlock","cuIcon-vip","cuIcon-weibo","cuIcon-activity","cuIcon-friendadd","cuIcon-friendfamous","cuIcon-friend","cuIcon-goods","cuIcon-selection"],role:"",menuList:[],swiperMenuList:[],user:{},tableName:"",btnColor:["#409eff","#67c23a","#909399","#e6a23c","#f56c6c","#356c6c","#351c6c","#f093a9","#a7c23a","#104eff","#10441f","#a21233","#503319"],queryList:[{queryName:"活动地区"}],queryIndex:0,searchForm:{huodongxinxihuodongdiqu:""},CustomBar:"0",autoplaySwiper:!0,intervalSwiper:5e3,swiperList:[],huodongxinxilist:[],homeyonghufabulist:[],news:[]}},computed:{baseUrl:function(){return this.$base.url}},onLoad:function(){var e=(0,o.default)(regeneratorRuntime.mark((function e(){var r,i,t,o=this;return regeneratorRuntime.wrap((function(e){while(1)switch(e.prev=e.next){case 0:return this.role=uni.getStorageSync("role"),r=uni.getStorageSync("nowTable"),e.next=4,this.$api.session(r);case 4:i=e.sent,this.user=i.data,this.tableName=r,t=a.default.list(),this.menuList=t,this.menuList.forEach((function(e,r){o.role==e.roleName&&e.frontMenu.forEach((function(e,r){e.child[0].buttons.indexOf("查看")>-1&&o.swiperMenuList.push(e)}))}));case 10:case"end":return e.stop()}}),e,this)})));function r(){return e.apply(this,arguments)}return r}(),onShow:function(){var e=(0,o.default)(regeneratorRuntime.mark((function e(){var r,i,t,o,a,d,n,l;return regeneratorRuntime.wrap((function(e){while(1)switch(e.prev=e.next){case 0:return this.btnColor=this.btnColor.sort((function(){return.5-Math.random()})),r=[],e.next=4,this.$api.page("config",{page:1,limit:5});case 4:for(i=e.sent,t=!0,o=!1,a=void 0,e.prev=8,d=i.data.list[Symbol.iterator]();!(t=(n=d.next()).done);t=!0)l=n.value,l.name.indexOf("picture")>=0&&l.value&&""!=l.value&&null!=l.value&&r.push({img:l.value,title:l.name});e.next=16;break;case 12:e.prev=12,e.t0=e["catch"](8),o=!0,a=e.t0;case 16:e.prev=16,e.prev=17,t||null==d.return||d.return();case 19:if(e.prev=19,!o){e.next=22;break}throw a;case 22:return e.finish(19);case 23:return e.finish(16);case 24:return r&&(this.swiperList=r),e.next=27,this.$api.list("news",{page:1,limit:6});case 27:if(i=e.sent,this.news=i.data.list,null===uni.getStorageSync("userid")){e.next=35;break}return e.next=32,this.$api.recommend2("huodongxinxi",{page:1,limit:6});case 32:i=e.sent,e.next=38;break;case 35:return e.next=37,this.$api.recommend("huodongxinxi",{page:1,limit:6});case 37:i=e.sent;case 38:return this.huodongxinxilist=i.data.list,e.next=41,this.$api.list("yonghufabu",{page:1,limit:4});case 41:i=e.sent,this.homeyonghufabulist=i.data.list;case 43:case"end":return e.stop()}}),e,this,[[8,12,16,24],[17,,19,23]])})));function r(){return e.apply(this,arguments)}return r}(),methods:{queryChange:function(e){this.queryIndex=e.detail.value,this.searchForm.huodongxinxihuodongdiqu=""},onSwiperTap:function(e){},onNewsDetailTap:function(e){this.$utils.jump("../news-detail/news-detail?id=".concat(e))},onDetailTap:function(e,r){this.$utils.jump("../".concat(e,"/detail?id=").concat(r))},onPageTap:function(e){0==this.queryIndex&&(uni.setStorageSync("indexQueryCondition",this.searchForm.huodongxinxihuodongdiqu),this.searchForm.huodongxinxihuodongdiqu=""),uni.navigateTo({url:"../".concat(e,"/list"),fail:function(){uni.switchTab({url:"../".concat(e,"/list")})}})},onPageTap2:function(e){uni.setStorageSync("useridTag",0),uni.navigateTo({url:e,fail:function(){uni.switchTab({url:e})}})}}};r.default=n},8065:function(e,r,i){var t=i("24fb");r=t(!1),r.push([e.i,'uni-page-body[data-v-47a6b202]{background:#f8f8f8}.uni-padding-wrap[data-v-47a6b202]:after{position:fixed;top:0;right:0;left:0;bottom:0;content:"";background-attachment:fixed;background-size:cover;background-position:50%}uni-view[data-v-47a6b202]{\n\t\t/* font-family: \'\\5FAE\\8F6F\\96C5\\9ED1\'; */font-size:%?30?%}.header[data-v-47a6b202]{background:#eee;padding:0 0 %?300?% 0;margin-bottom:%?20?%;position:relative}.ssbox[data-v-47a6b202]{background:hsla(0,0%,100%,.35);width:%?530?%;border-radius:%?60?%;padding:%?10?% %?15?%;box-sizing:border-box}.ss_input[data-v-47a6b202]{border:none;width:%?450?%;font-size:%?30?%;color:#fff;background:none;height:%?45?%;line-break:%?45?%}.headerb[data-v-47a6b202]{position:absolute;left:0;width:100%;box-sizing:border-box}.headerb uni-image[data-v-47a6b202]{width:100%;position:relative;z-index:10}.headerb .swiper[data-v-47a6b202]{height:%?300?%}.swiper[data-v-47a6b202] .uni-swiper-dot{width:%?16?%;height:%?16?%;broder-radius:50%}.notice[data-v-47a6b202]{position:relative;z-index:5;padding:0 %?50?%}.noticem[data-v-47a6b202]{background:#fff;padding:%?55?% %?30?% %?15?%;border-radius:%?10?%;margin-top:%?-45?%}.noticer[data-v-47a6b202]{width:%?480?%;height:%?50?%}.noticer .swiper-item[data-v-47a6b202]{white-space:nowrap;text-overflow:ellipsis;overflow:hidden;height:%?50?%;line-height:%?50?%;font-size:%?24?%}.list[data-v-47a6b202]{padding:%?20?% %?20?% %?20?%}.listm[data-v-47a6b202]{background:#fff;border-radius:%?15?%;box-shadow:0 0 %?2?% rgba(0,0,0,.1);margin-bottom:%?20?%;padding:%?30?%}.listmpic[data-v-47a6b202]{border-radius:%?10?%;width:%?166?%;margin-right:%?20?%}.listmr[data-v-47a6b202]{\n\t\t/* width: 460upx; */display:inline-block;-webkit-box-flex:1;-webkit-flex:1;flex:1;display:-webkit-box;display:-webkit-flex;display:flex;-webkit-box-pack:justify;-webkit-justify-content:space-between;justify-content:space-between;-webkit-box-orient:vertical;-webkit-box-direction:normal;-webkit-flex-direction:column;flex-direction:column}\n\n\t\n\n\t\n\n\t\n\n\t\n\n\t.uni-product-list[data-v-47a6b202]{display:-webkit-box;display:-webkit-flex;display:flex;width:100%;-webkit-flex-wrap:wrap;flex-wrap:wrap;-webkit-box-orient:horizontal;-webkit-box-direction:normal;-webkit-flex-direction:row;flex-direction:row;margin-top:0;padding:0 %?14?%;box-sizing:border-box}.uni-product-list.active[data-v-47a6b202]{padding:0 %?12?%}.uni-product[data-v-47a6b202]{padding:%?10?%;margin:%?10?%;width:%?341?%;box-sizing:border-box;display:-webkit-box;display:-webkit-flex;display:flex;-webkit-box-orient:vertical;-webkit-box-direction:normal;-webkit-flex-direction:column;flex-direction:column;background:#fff}.uni-product-list.active .uni-product[data-v-47a6b202]{width:%?222?%}.image-view[data-v-47a6b202]{height:%?321?%;width:%?321?%;\n\t\t/* margin: 12upx 0; */display:-webkit-box;display:-webkit-flex;display:flex;-webkit-box-align:center;-webkit-align-items:center;align-items:center;overflow:hidden}.uni-product-list.active .image-view[data-v-47a6b202]{height:%?202?%;width:%?202?%;overflow:hidden}.uni-product-image[data-v-47a6b202]{height:100%;width:100%;margin:0 auto;display:block}.uni-product-title[data-v-47a6b202]{width:100%;word-break:break-all;display:-webkit-box;overflow:hidden;line-height:1.5;text-overflow:ellipsis;-webkit-box-orient:vertical;-webkit-line-clamp:1}.uni-product-price[data-v-47a6b202]{width:100%;margin-top:%?10?%;font-size:%?28?%;line-height:1.5;position:relative}.uni-product-price-original[data-v-47a6b202]{color:#e80080}.uni-product-price-favour[data-v-47a6b202]{color:#888;text-decoration:line-through;margin-left:%?10?%}.uni-product-tip[data-v-47a6b202]{position:absolute;right:%?10?%;background-color:#f33;color:#fff;padding:0 %?10?%;border-radius:%?5?%}.header-title[data-v-47a6b202]{display:-webkit-box;display:-webkit-flex;display:flex;-webkit-box-align:center;-webkit-align-items:center;align-items:center;text-align:center;-webkit-box-pack:justify;-webkit-justify-content:space-between;justify-content:space-between;padding:0 %?40?%}.listBox>.title[data-v-47a6b202]{display:-webkit-box;display:-webkit-flex;display:flex;-webkit-flex-wrap:wrap;flex-wrap:wrap}.listBox .list-box .box[data-v-47a6b202]{position:relative}.listBox .list-box .box .title[data-v-47a6b202]{position:absolute;left:0;bottom:0;z-index:1}.listBox .style1[data-v-47a6b202]{display:-webkit-box;display:-webkit-flex;display:flex;-webkit-box-pack:justify;-webkit-justify-content:space-between;justify-content:space-between;-webkit-flex-wrap:wrap;flex-wrap:wrap}.listBox .style2[data-v-47a6b202]{display:-webkit-box;display:-webkit-flex;display:flex;-webkit-box-pack:justify;-webkit-justify-content:space-between;justify-content:space-between;-webkit-flex-wrap:wrap;flex-wrap:wrap}.listBox .style3 .list-item[data-v-47a6b202]{display:-webkit-box;display:-webkit-flex;display:flex}.listBox .style4 .list-item[data-v-47a6b202]{display:-webkit-box;display:-webkit-flex;display:flex;-webkit-flex-wrap:wrap;flex-wrap:wrap}.listBox .style6 .list-item[data-v-47a6b202]{display:-webkit-box;display:-webkit-flex;display:flex;-webkit-flex-wrap:wrap;flex-wrap:wrap}.listBox .style6 .list-item .list-item-body[data-v-47a6b202]{display:-webkit-box;display:-webkit-flex;display:flex;-webkit-flex-wrap:wrap;flex-wrap:wrap}.listBox .style7 .list-item[data-v-47a6b202]{display:-webkit-box;display:-webkit-flex;display:flex;-webkit-flex-wrap:wrap;flex-wrap:wrap}.listBox .style8 .list-item[data-v-47a6b202]{display:-webkit-box;display:-webkit-flex;display:flex;-webkit-flex-wrap:wrap;flex-wrap:wrap}.listBox .style9 .list-item[data-v-47a6b202]{display:-webkit-box;display:-webkit-flex;display:flex;-webkit-flex-wrap:wrap;flex-wrap:wrap}.listBox .idea[data-v-47a6b202]{display:-webkit-box;display:-webkit-flex;display:flex;-webkit-flex-wrap:wrap;flex-wrap:wrap}.listBox .idea .box[data-v-47a6b202]{display:-webkit-box;display:-webkit-flex;display:flex;-webkit-box-pack:center;-webkit-justify-content:center;justify-content:center;-webkit-box-align:center;-webkit-align-items:center;align-items:center;background-repeat:no-repeat;background-size:100% 100%}.listBox .recommendIdea .box1[data-v-47a6b202]{margin:0 2%;padding:0;width:0;height:%?160?%;font-size:%?28?%;color:#fff;border-radius:0;border-width:0;border-style:solid;border-color:#ccc;background-color:rgba(0,0,0,.3);box-shadow:0 0 %?12?% transparent}.listBox .recommendIdea .box2[data-v-47a6b202]{margin:0 2%;padding:0;width:0;height:%?160?%;font-size:%?28?%;color:#fff;border-radius:0;border-width:0;border-style:solid;border-color:#ccc;background-color:rgba(0,0,0,.3);box-shadow:0 0 %?12?% transparent}.listBox .recommendIdea .box3[data-v-47a6b202]{margin:0 2%;padding:0;width:0;height:%?160?%;font-size:%?28?%;color:#fff;border-radius:0;border-width:0;border-style:solid;border-color:#ccc;background-color:rgba(0,0,0,.3);box-shadow:0 0 %?12?% transparent}.listBox .recommendIdea .box4[data-v-47a6b202]{margin:0 2%;padding:0;width:0;height:%?160?%;font-size:%?28?%;color:#fff;border-radius:0;border-width:0;border-style:solid;border-color:#ccc;background-color:rgba(0,0,0,.3);box-shadow:0 0 %?12?% transparent}.listBox .listIdea .box4[data-v-47a6b202]{margin:0 2%;padding:0;width:0;height:%?160?%;font-size:%?28?%;color:#fff;border-radius:0;border-width:0;border-style:solid;border-color:#ccc;background-color:rgba(0,0,0,.3);box-shadow:0 0 %?12?% transparent}.listBox .listIdea .box1[data-v-47a6b202]{margin:0 2%;padding:0;width:0;height:%?200?%;font-size:%?28?%;color:#fff;border-radius:0;border-width:0;border-style:solid;border-color:#ccc;background-color:rgba(0,0,0,.3);box-shadow:0 0 %?12?% transparent}.listBox .listIdea .box2[data-v-47a6b202]{margin:0 2%;padding:0;width:0;height:%?160?%;font-size:%?28?%;color:#fff;border-radius:0;border-width:0;border-style:solid;border-color:#ccc;background-color:rgba(0,0,0,.3);box-shadow:0 0 %?12?% transparent}.listBox .listIdea .box3[data-v-47a6b202]{margin:0 2%;padding:0;width:0;height:%?160?%;font-size:%?28?%;color:#fff;border-radius:0;border-width:0;border-style:solid;border-color:#ccc;background-color:rgba(0,0,0,.3);box-shadow:0 0 %?12?% transparent}.listBox .newsIdea .box1[data-v-47a6b202]{margin:0 2%;padding:0;width:0;height:%?160?%;font-size:%?28?%;color:#fff;border-radius:0;border-width:0;border-style:solid;border-color:#ccc;background-color:rgba(0,0,0,.3);box-shadow:0 0 %?12?% transparent}.listBox .newsIdea .box2[data-v-47a6b202]{margin:0 2%;padding:0;width:0;height:%?160?%;font-size:%?28?%;color:#fff;border-radius:0;border-width:0;border-style:solid;border-color:#ccc;background-color:rgba(0,0,0,.3);box-shadow:0 0 %?12?% transparent}.listBox .newsIdea .box3[data-v-47a6b202]{margin:0 2%;padding:0;width:0;height:%?160?%;font-size:%?28?%;color:#fff;border-radius:0;border-width:0;border-style:solid;border-color:#ccc;background-color:rgba(0,0,0,.3);box-shadow:0 0 %?12?% transparent}.listBox .newsIdea .box4[data-v-47a6b202]{margin:0 2%;padding:0;width:0;height:%?160?%;font-size:%?28?%;color:#fff;border-radius:0;border-width:0;border-style:solid;border-color:#ccc;background-color:rgba(0,0,0,.3);box-shadow:0 0 %?12?% transparent}.iconarr[data-v-47a6b202]{text-align:center;line-height:%?84?%}.news-box6 .dian[data-v-47a6b202]::before{content:"";display:block;width:%?8?%;height:%?8?%;background-color:red;position:absolute;top:%?-4?%;left:50%;-webkit-transform:translateX(-50%);transform:translateX(-50%);border-radius:100%;z-index:1}.hide1[data-v-47a6b202]{overflow:hidden;text-overflow:ellipsis;display:-webkit-box;-webkit-line-clamp:1;line-clamp:1;-webkit-box-orient:vertical}.hide2[data-v-47a6b202]{overflow:hidden;text-overflow:ellipsis;display:-webkit-box;-webkit-line-clamp:2;line-clamp:2;-webkit-box-orient:vertical}.hide4[data-v-47a6b202]{overflow:hidden;text-overflow:ellipsis;display:-webkit-box;-webkit-line-clamp:4;line-clamp:4;-webkit-box-orient:vertical}body.?%PAGE?%[data-v-47a6b202]{background:#f8f8f8}',""]),e.exports=r},8069:function(e,r,i){"use strict";i.r(r);var t=i("0d9b"),o=i.n(t);for(var a in t)"default"!==a&&function(e){i.d(r,e,(function(){return t[e]}))}(a);r["default"]=o.a},baf9:function(e,r,i){"use strict";var t,o=function(){var e=this,r=e.$createElement,i=e._self._c||r;return i("v-uni-view",{staticClass:"uni-padding-wrap"},[i("v-uni-view",{staticClass:"header"},[i("v-uni-view",{staticClass:"headerb"},[i("v-uni-swiper",{staticClass:"swiper",style:{padding:"0",boxShadow:"0 2rpx 12rpx rgba(0,0,0,0)",margin:"0",borderColor:"rgba(0,0,0,0)",backgroundColor:"rgba(255,255,255,1)",borderRadius:"20rpx",borderWidth:"0",width:"100%",borderStyle:"solid",height:"300rpx"},attrs:{"indicator-dots":!0,autoplay:e.autoplaySwiper,circular:!0,"indicator-active-color":"rgba(194, 228, 106, 1)","indicator-color":"rgba(0, 0, 0, .3)",duration:1e3,interval:e.intervalSwiper,vertical:!1}},e._l(e.swiperList,(function(r,t){return i("v-uni-swiper-item",{key:t,style:{padding:"0",boxShadow:"0 2rpx 12rpx rgba(0,0,0,0)",margin:"0",borderColor:"rgba(0,0,0,0)",backgroundColor:"rgba(255,255,255,1)",borderRadius:"0",borderWidth:"0",width:"100%",borderStyle:"solid",height:"300rpx"},on:{click:function(i){arguments[0]=i=e.$handleEvent(i),e.onSwiperTap(r)}}},[i("v-uni-image",{style:{padding:"0",boxShadow:"0 2rpx 12rpx rgba(0,0,0,0)",margin:"0",borderColor:"rgba(0,0,0,0)",backgroundColor:"rgba(255,255,255,1)",borderRadius:"0",borderWidth:"0",width:"100%",borderStyle:"solid",height:"300rpx"},attrs:{mode:"aspectFill",src:e.baseUrl+r.img}}),e._e()],1)})),1)],1)],1),i("v-uni-view",{staticClass:"cu-bar bg-white search",style:[{top:e.CustomBar+"px"}]},[e.queryList.length>1?i("v-uni-picker",{staticStyle:{"padding-left":"20upx"},attrs:{mode:"selector",range:e.queryList,"range-key":"queryName",value:e.queryIndex},on:{change:function(r){arguments[0]=r=e.$handleEvent(r),e.queryChange.apply(void 0,arguments)}}},[i("v-uni-view",[i("v-uni-image",{staticStyle:{width:"20upx",height:"33upx"},attrs:{src:"../../static/center/to.png"}})],1)],1):e._e(),0==e.queryIndex?i("v-uni-view",{staticClass:"search-form round"},[i("v-uni-text",{staticClass:"cuIcon-search"}),i("v-uni-input",{attrs:{type:"text",placeholder:"活动地区"},model:{value:e.searchForm.huodongxinxihuodongdiqu,callback:function(r){e.$set(e.searchForm,"huodongxinxihuodongdiqu",r)},expression:"searchForm.huodongxinxihuodongdiqu"}})],1):e._e(),0==e.queryIndex?i("v-uni-view",{staticClass:"action"},[i("v-uni-button",{staticClass:"cu-btn shadow-blur round",style:{width:"auto",borderRadius:"48rpx",height:"80rpx",fontSize:"28rpx",color:"#fff",backgroundColor:e.btnColor[2],borderColor:e.btnColor[2]},on:{click:function(r){arguments[0]=r=e.$handleEvent(r),e.onPageTap("huodongxinxi")}}},[e._v("搜索")])],1):e._e()],1),i("v-uni-view",{staticClass:"menu",staticStyle:{display:"flex","flex-wrap":"wrap"},style:{padding:"0 8rpx",boxShadow:"0 2rpx 12rpx rgba(0,0,0,0)",margin:"0",borderColor:"rgba(0,0,0,0)",backgroundColor:"rgba(255,255,255,1)",borderRadius:"0",borderWidth:"0",width:"100%",borderStyle:"solid",height:"auto"}},[e._l(e.menuList,(function(r){return[e._l(r.frontMenu,(function(t,o){return e.role==r.roleName?[e._l(t.child,(function(r,t){return[e._l(r.buttons,(function(t,o){return["查看"==t&&"yifahuodingdan"!=r.tableName&&"yituikuandingdan"!=r.tableName&&"yiquxiaodingdan"!=r.tableName&&"weizhifudingdan"!=r.tableName&&"yizhifudingdan"!=r.tableName&&"yiwanchengdingdan"!=r.tableName?i("v-uni-view",{key:o+"_0",staticClass:"menu-list",style:{padding:"12rpx 0",boxShadow:"0 2rpx 12rpx rgba(0,0,0,0)",margin:"10rpx 2%",borderColor:"rgba(96, 133, 0, 1)",backgroundColor:"rgba(194, 228, 106, 1)",borderRadius:"4rpx 4rpx 40rpx 40rpx",borderWidth:"4rpx",width:"16%",borderStyle:"dashed",height:"180rpx"},on:{click:function(i){arguments[0]=i=e.$handleEvent(i),e.onPageTap2("../"+r.tableName+"/list")}}},[i("v-uni-view",{staticClass:"iconarr",class:r.appFrontIcon,style:{padding:"0",boxShadow:"0 2rpx 12rpx rgba(0,0,0,0)",margin:"0px auto",borderColor:"rgba(0,0,0,0)",backgroundColor:"rgba(255, 255, 255, 1)",color:"rgba(194, 228, 106, 1)",borderRadius:"100%",borderWidth:"0",width:"84rpx",fontSize:"64rpx",borderStyle:"solid",height:"84rpx"}}),i("v-uni-view",{style:{padding:"0",boxShadow:"0 2rpx 12rpx rgba(0,0,0,0)",margin:"16rpx auto 0",borderColor:"rgba(0,0,0,0)",backgroundColor:"rgba(0,0,0,0)",color:"#fff",textAlign:"center",borderRadius:"0",borderWidth:"0",width:"100%",lineHeight:"28rpx",fontSize:"28rpx",borderStyle:"solid"}},[e._v(e._s(r.menu.split("列表")[0]))])],1):e._e()]}))]}))]:e._e()}))]}))],2),i("v-uni-view",{staticClass:"listBox recommend"},[i("v-uni-view",{staticClass:"idea recommendIdea",style:{padding:"20rpx 10rpx",boxShadow:"0 0 12rpx rgba(0,0,0,0)",margin:"20rpx 0",borderColor:"#ccc",borderRadius:"0",borderWidth:"0",background:"transparent url(http://codegen.caihongy.cn/20220228/492df9b9fb70405783a522f48279c0b7.png) no-repeat bottom",width:"100%",borderStyle:"solid",height:"auto"}},[i("v-uni-view",{staticClass:"box box1"}),i("v-uni-view",{staticClass:"box box2"}),i("v-uni-view",{staticClass:"box box3"}),i("v-uni-view",{staticClass:"box box4"})],1),i("v-uni-view",{staticClass:"title",style:{padding:"0 24rpx",boxShadow:"0 2rpx 12rpx rgba(0,0,0,0)",margin:"-120rpx 0 40rpx",borderColor:"rgba(0,0,0,0)",backgroundColor:"rgba(0, 186, 189, 0)",borderRadius:"0",borderWidth:"0",width:"100%",borderStyle:"solid",height:"auto"}},[i("v-uni-view",{style:{padding:"0",boxShadow:"0 2rpx 12rpx rgba(0,0,0,0)",margin:"0",borderColor:"red",backgroundColor:"rgba(0, 0, 0, 0)",color:"rgba(0, 0, 0, 1)",textAlign:"center",borderRadius:"0",borderWidth:"0",width:"100%",fontSize:"32rpx",lineHeight:"80rpx",borderStyle:"solid"}},[e._v("活动信息推荐")])],1),e._e(),i("v-uni-view",{staticClass:"list-box style2",style:{padding:"20rpx 8rpx",boxShadow:"0 2rpx 12rpx rgba(0,0,0,0)",margin:"0",borderColor:"rgba(0,0,0,0)",backgroundColor:"rgba(228, 228, 228, 1)",borderRadius:"0",borderWidth:"0",width:"100%",borderStyle:"solid",height:"auto"}},e._l(e.huodongxinxilist,(function(r,t){return i("v-uni-view",{key:t,staticClass:"list-item",style:{padding:"0 0 8rpx",boxShadow:"0 0px 0px rgba(0,0,0,.3)",margin:"0 0 20rpx",borderColor:"rgba(194, 228, 106, 1)",backgroundColor:"#fff",borderRadius:"20rpx 20rpx 20rpx 120rpx",borderWidth:"2rpx",width:"32%",borderStyle:"solid",height:"auto"},on:{click:function(i){arguments[0]=i=e.$handleEvent(i),e.onDetailTap("huodongxinxi",r.id)}}},[i("v-uni-image",{staticClass:"list-item-image",style:{padding:"0",boxShadow:"0 2rpx 12rpx rgba(0,0,0,0)",margin:"12rpx auto",borderColor:"rgba(194, 228, 106, 1)",backgroundColor:"rgba(0,0,0,0)",borderRadius:"20rpx 20rpx 20rpx 120rpx",borderWidth:"2rpx",width:"100%",borderStyle:"solid",height:"160rpx"},attrs:{mode:"aspectFill",src:r.huodongtupian?e.baseUrl+r.huodongtupian.split(",")[0]:""}})],1)})),1),e._e()],1),i("v-uni-view",{staticClass:"listBox news"},[i("v-uni-view",{staticClass:"idea newsIdea",style:{padding:"20rpx 10rpx",boxShadow:"0 0 12rpx rgba(0,0,0,0)",margin:"20rpx 0",borderColor:"#ccc",borderRadius:"0",borderWidth:"0",background:"transparent url(http://codegen.caihongy.cn/20220228/aad15ee37cae4e60b366d1890c2897fc.png) no-repeat bottom",width:"100%",borderStyle:"solid",height:"auto"}},[i("v-uni-view",{staticClass:"box box1"}),i("v-uni-view",{staticClass:"box box2"}),i("v-uni-view",{staticClass:"box box3"}),i("v-uni-view",{staticClass:"box box4"})],1),i("v-uni-view",{staticClass:"title",style:{padding:"0 24rpx",boxShadow:"0 2rpx 12rpx rgba(0,0,0,0)",margin:"-116rpx 0 40rpx 0",borderColor:"rgba(0,0,0,0)",backgroundColor:"rgba(0, 186, 189, 0)",borderRadius:"0",borderWidth:"0",width:"100%",borderStyle:"solid",height:"auto"}},[i("v-uni-view",{style:{padding:"0",boxShadow:"0 2rpx 12rpx rgba(0,0,0,0)",margin:"0",borderColor:"red",backgroundColor:"rgba(0, 0, 0, 0)",color:"rgba(0, 0, 0, 1)",textAlign:"center",borderRadius:"0",borderWidth:"0",width:"100%",fontSize:"32rpx",lineHeight:"80rpx",borderStyle:"solid"}},[e._v("公告资讯")]),i("v-uni-text",{style:{padding:"0",boxShadow:"0 2rpx 12rpx rgba(0,0,0,0)",margin:"-80rpx 0 0",borderColor:"rgba(0,0,0,0)",backgroundColor:"rgba(0,0,0,0)",color:"rgba(0, 0, 0, 1)",textAlign:"right",borderRadius:"0",borderWidth:"0",width:"100%",lineHeight:"80rpx",fontSize:"32rpx",borderStyle:"solid"},on:{click:function(r){arguments[0]=r=e.$handleEvent(r),e.onPageTap("news")}}},[e._v("查看更多")])],1),e._e(),i("v-uni-view",{staticClass:"news-box2",style:{padding:"20rpx",boxShadow:"0 0 12rpx rgba(0,0,0,0)",margin:"0 0 20rpx",borderColor:"red",backgroundColor:"rgba(228, 228, 228, 1)",borderRadius:"0",borderWidth:"0",width:"100%",borderStyle:"solid",height:"auto"}},[e._l(e.news,(function(r,t){return[0==t?i("v-uni-view",{key:t+"_0",staticClass:"list-item",staticStyle:{position:"relative"},style:{padding:"0",boxShadow:"0 0 12rpx rgba(255,0,0,0)",margin:"0",borderColor:"red",backgroundColor:"rgba(255,255,255,1)",borderRadius:"0",borderWidth:"0",width:"100%",borderStyle:"solid",height:"auto"},on:{click:function(i){arguments[0]=i=e.$handleEvent(i),e.onNewsDetailTap(r.id)}}},[i("v-uni-image",{staticClass:"listmpic",style:{padding:"0",boxShadow:"0 0 12rpx rgba(255,0,0,0)",margin:"0",borderColor:"rgba(194, 228, 106, 1)",backgroundColor:"rgba(255,255,255,0)",borderRadius:"20rpx",borderWidth:"4rpx",width:"100%",borderStyle:"solid",height:"200rpx"},attrs:{mode:"aspectFill",src:e.baseUrl+r.picture}}),i("v-uni-view",{staticClass:"title hide1",staticStyle:{position:"absolute",bottom:"0",left:"0"},style:{padding:"0 20rpx",boxShadow:"0 0 12rpx rgba(255,0,0,0)",margin:"0",borderColor:"red",backgroundColor:"rgba(0,0,0,.3)",color:"#fff",textAlign:"center",borderRadius:"0 0 20rpx 20rpx",borderWidth:"0",width:"100%",lineHeight:"80rpx",fontSize:"28rpx",borderStyle:"solid"}},[e._v(e._s(r.title))])],1):e._e(),t>0?i("v-uni-view",{key:t+"_1",staticClass:"list-item",style:{padding:"0 20rpx",boxShadow:"0 8rpx 0px 8rpx #608500",margin:"30rpx auto",borderColor:"#ccc",backgroundColor:"rgba(255,255,255,1)",borderRadius:"20rpx",borderWidth:"0",width:"100%",borderStyle:"solid",height:"auto"},on:{click:function(i){arguments[0]=i=e.$handleEvent(i),e.onNewsDetailTap(r.id)}}},[i("v-uni-view",{staticClass:"title hide1",style:{padding:"0",boxShadow:"0 0 12rpx rgba(255,0,0,0)",margin:"0",borderColor:"#ccc",backgroundColor:"rgba(255,0,0,0)",color:"rgba(0, 0, 0, 1)",textAlign:"left",borderRadius:"0",borderWidth:"0",width:"100%",lineHeight:"80rpx",fontSize:"28rpx",borderStyle:"solid"}},[e._v(e._s(r.title))])],1):e._e()]}))],2),e._e()],1),i("v-uni-view",{staticClass:"listBox list"},[i("v-uni-view",{staticClass:"idea listIdea",style:{padding:"20rpx 10rpx",boxShadow:"0 0 12rpx rgba(0,0,0,0)",margin:"20rpx 0",borderColor:"#ccc",borderRadius:"0",borderWidth:"0",background:"transparent url(http://codegen.caihongy.cn/20220228/7206bf015caa446f9e619856785c851a.png) no-repeat bottom",width:"100%",borderStyle:"solid",height:"auto"}},[i("v-uni-view",{staticClass:"box box1"}),i("v-uni-view",{staticClass:"box box2"}),i("v-uni-view",{staticClass:"box box3"}),i("v-uni-view",{staticClass:"box box4"})],1),i("v-uni-view",{staticClass:"title",style:{padding:"0 24rpx",boxShadow:"0 2rpx 12rpx rgba(0,0,0,0)",margin:"-112rpx 0 60rpx 0",borderColor:"rgba(0,0,0,0)",backgroundColor:"rgba(0, 186, 189, 0)",borderRadius:"0",borderWidth:"0",width:"100%",borderStyle:"solid",height:"auto"}},[i("v-uni-view",{style:{padding:"0",boxShadow:"0 2rpx 12rpx rgba(0,0,0,0)",margin:"0",borderColor:"red",backgroundColor:"rgba(0, 0, 0, 0)",color:"rgba(0, 0, 0, 1)",textAlign:"center",borderRadius:"0",borderWidth:"0",width:"50%",fontSize:"32rpx",lineHeight:"80rpx",borderStyle:"solid"}},[e._v("用户发布")]),i("v-uni-text",{style:{padding:"0",boxShadow:"0 2rpx 12rpx rgba(0,0,0,0)",margin:"-20rpx 0 0 0",borderColor:"rgba(0,0,0,0)",backgroundColor:"rgba(0,0,0,0)",color:"rgba(0, 0, 0, 1)",textAlign:"center",borderRadius:"0",borderWidth:"0",width:"50%",lineHeight:"80rpx",fontSize:"28rpx",borderStyle:"solid"},on:{click:function(r){arguments[0]=r=e.$handleEvent(r),e.onPageTap("yonghufabu")}}},[e._v("查看更多")])],1),e._e(),i("v-uni-view",{staticClass:"list-box style1",style:{padding:"20rpx 24rpx",boxShadow:"0 2rpx 12rpx rgba(0,0,0,0)",margin:"0",borderColor:"rgba(0,0,0,0)",backgroundColor:"rgba(228, 228, 228, 1)",borderRadius:"0",borderWidth:"0",width:"100%",borderStyle:"solid",height:"auto"}},e._l(e.homeyonghufabulist,(function(r,t){return i("v-uni-view",{key:t,staticClass:"list-item",style:{padding:"0 0 20rpx",boxShadow:"0 0px 0px rgba(0,0,0,.3)",margin:"0 0 20rpx",borderColor:"rgba(194, 228, 106, 1)",backgroundColor:"#fff",borderRadius:"20rpx 20rpx 200rpx 200rpx",borderWidth:"2rpx",width:"48%",borderStyle:"solid",height:"auto"},on:{click:function(i){arguments[0]=i=e.$handleEvent(i),e.onDetailTap("yonghufabu",r.id)}}},[i("v-uni-view",{staticClass:"list-item-title hide1",style:{padding:"12rpx 20rpx",boxShadow:"0 2rpx 12rpx rgba(0,0,0,0)",margin:"0 auto",borderColor:"rgba(0,0,0,0)",backgroundColor:"rgba(194, 228, 106, 1)",color:"rgba(0, 0, 0, 1)",textAlign:"center",borderRadius:"20rpx 20rpx 0 0",borderWidth:"0",width:"100%",lineHeight:"48rpx",fontSize:"28rpx",borderStyle:"solid"}},[e._v(e._s(r.biaoti))]),i("v-uni-image",{staticClass:"list-item-image",style:{padding:"0",boxShadow:"0 2rpx 12rpx rgba(0,0,0,0)",margin:"20rpx auto",borderColor:"rgba(0,0,0,0)",backgroundColor:"rgba(0,0,0,0)",borderRadius:"20rpx 20rpx 200rpx 200rpx",borderWidth:"0",width:"100%",borderStyle:"solid",height:"280rpx"},attrs:{mode:"aspectFill",src:r.tupian?e.baseUrl+r.tupian.split(",")[0]:""}})],1)})),1),e._e()],1)],1)},a=[];i.d(r,"b",(function(){return o})),i.d(r,"c",(function(){return a})),i.d(r,"a",(function(){return t}))},d321:function(e,r,i){"use strict";var t=i("da67"),o=i.n(t);o.a},da67:function(e,r,i){var t=i("8065");"string"===typeof t&&(t=[[e.i,t,""]]),t.locals&&(e.exports=t.locals);var o=i("4f06").default;o("5742697a",t,!0,{sourceMap:!1,shadowMode:!1})},f75a:function(e,r,i){"use strict";i.r(r);var t=i("baf9"),o=i("8069");for(var a in o)"default"!==a&&function(e){i.d(r,e,(function(){return o[e]}))}(a);i("d321");var d,n=i("f0c5"),l=Object(n["a"])(o["default"],t["b"],t["c"],!1,null,"47a6b202",null,!1,t["a"],d);r["default"]=l.exports}}]);