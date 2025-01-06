const base = {
    get() {
        return {
            url : "http://localhost:8088/tangfen/",
            name: "tangfen",
            // 退出到首页链接
            indexUrl: 'http://localhost:8088/tangfen/front/h5/index.html'
        };
    },
    getProjectName(){
        return {
            projectName: "后台管理系统"
        } 
    }
}
export default base
