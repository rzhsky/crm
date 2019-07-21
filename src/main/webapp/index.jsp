<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>CRM后台管理系统</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="static/css/font.css">
    <link rel="stylesheet" href="static/css/weadmin.css">
    <script type="text/javascript" src="lib/layui/layui.js" charset="utf-8"></script>

</head>

<body>
<!-- 顶部开始 -->
<div class="container">
    <div class="logo">
        <a href="./index.jsp">CRM管理系统</a>
    </div>
    <div class="left_open">
        <!-- <i title="展开左侧栏" class="iconfont">&#xe699;</i> -->
        <i title="展开左侧栏" class="layui-icon layui-icon-shrink-right"></i>

    </div>
    <ul class="layui-nav left fast-add" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;">+新增</a>
            <dl class="layui-nav-child">
                <!-- 二级菜单 -->
                <dd>
                    <a onclick="WeAdminShow('资讯','https://www.baidu.com/')"><i class="layui-icon layui-icon-list"></i>资讯</a>
                </dd>
                <dd>
                    <a onclick="WeAdminShow('图片','http://www.baidu.com')"><i
                            class="layui-icon layui-icon-picture-fine"></i>图片</a>
                </dd>
                <dd>
                    <a onclick="WeAdminShow('用户','https://www.baidu.com/')"><i class="layui-icon layui-icon-user"></i>用户</a>
                </dd>
            </dl>
        </li>
    </ul>
    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;">Admin</a>
            <dl class="layui-nav-child">
                <!-- 二级菜单 -->
                <dd>
                    <a onclick="WeAdminShow('个人信息','http://www.baidu.com')">个人信息</a>
                </dd>
                <dd>
                    <a onclick="WeAdminShow('切换帐号','./login.jsp')">切换帐号</a>
                </dd>
                <dd>
                    <a class="loginout" href="login.jsp">退出</a>
                </dd>
            </dl>
        </li>
        <li class="layui-nav-item to-index">
            <a href="/">前台首页</a>
        </li>
    </ul>

</div>
<!-- 顶部结束 -->
<!-- 中部开始 -->
<!-- 左侧菜单开始 -->
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6b8;</i>
                    <cite>客户管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="./pages/member/list.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>客户管理</cite>

                        </a>
                    </li>
                    <li>
                        <a _href="./pages/member/del.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>客户管理</cite>

                        </a>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont">&#xe70b;</i>
                            <cite>会员管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i>
                        </a>
                        <ul class="sub-menu">
                            <li>
                                <a _href="./pages/member/addInput.jsp">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>输入框操作</cite>
                                </a>
                            </li>
                            <li>
                                <a _href="./pages/404.jsp">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>三级菜单演示</cite>
                                </a>
                            </li>
                            <li>
                                <a _href="./pages/404.jsp">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>导航菜单演示</cite>
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe705;</i>
                    <cite>合同管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="./pages/article/list.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>文章列表</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="./pages/article/category.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>分类管理</cite>
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe756;</i>
                    <cite>财务管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="./pages/article/list.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>文章列表</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="./pages/article/category.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>分类管理</cite>
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe723;</i>
                    <cite>产品管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="./pages/order/list.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>订单列表</cite>
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe726;</i>
                    <cite>人事管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="./pages/admin/department.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>部门管理</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="./pages/admin/position.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>职务管理</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="./pages/admin/employee.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>员工管理</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="./pages/admin/rule.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>权限管理</cite>
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</div>
<!-- <div class="x-slide_left"></div> -->
<!-- 左侧菜单结束 -->
<!-- 右侧主体开始 -->
<div class="page-content">
    <div class="layui-tab tab" lay-filter="wenav_tab" id="WeTabTip" lay-allowclose="true">
        <ul class="layui-tab-title" id="tabName">
            <li>我的桌面</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <iframe src='./pages/welcome.jsp' frameborder="0" scrolling="yes" class="weIframe"></iframe>
            </div>
        </div>
    </div>
</div>
<div class="page-content-bg"></div>
<!-- 右侧主体结束 -->
<!-- 中部结束 -->
<!-- 底部开始 -->
<div class="footer">
    <div class="copyright">Copyright ©2018 WeAdmin v1.0 All Rights Reserved</div>
</div>
<!-- 底部结束 -->
<script type="text/javascript">
    //			layui扩展模块的两种加载方式-示例
    //		    layui.extend({
    //			  admin: '{/}../../static/js/admin' // {/}的意思即代表采用自有路径，即不跟随 base 路径
    //			});
    //			//使用拓展模块
    //			layui.use('admin', function(){
    //			  var admin = layui.admin;
    //			});
    layui.config({
        base: './static/js/'
        , version: '101100'
    }).use('admin');
    layui.use(['jquery', 'admin'], function () {
        var $ = layui.jquery;
        $(function () {
            var login = JSON.parse(localStorage.getItem("login"));
            if (login) {
                if (login === 0) {
                    window.location.href = 'login.jsp';
                    return false;
                } else {
                    return false;
                }
            } else {
                window.location.href = 'login.jsp';
                return false;
            }
        });
    });

</script>
</body>
<!--Tab菜单右键弹出菜单-->
<ul class="rightMenu" id="rightMenu">
    <li data-type="fresh">刷新</li>
    <li data-type="current">关闭当前</li>
    <li data-type="other">关闭其它</li>
    <li data-type="all">关闭所有</li>
</ul>

</html>