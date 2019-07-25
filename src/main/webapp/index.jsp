<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
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
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
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
    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">

            <table>
                <tr>
                    <td>
                        <img id="touxiang" src="upload/${employee.img}" width="40px" height="40px" style="border-radius: 50%" >
                    </td>
                    <td>
                        <a href="javascript:;">${employee.empname}</a>
                    </td>
                </tr>
            </table>


            <dl class="layui-nav-child">
                <!-- 二级菜单 -->
                <dd>
                    <a onclick="AdminShow('个人信息','./pages/admin/edit-admin.jsp')" a href="javascript:;">个人信息</a>
                </dd>
                <dd>
                    <a onclick="EditPassword('修改密码','./pages/admin/edit-password.jsp')" a href="javascript:;">修改密码</a>
                </dd>
                <dd>
                    <a class="loginout" id="loginout" onclick="loginout()" a href="javascript:;">退出</a>
                </dd>
            </dl>
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
                        <a _href="./pages/customer/customerlist.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>客户列表</cite>
                        </a>
                    </li>
                   <%-- <li>
                        <a _href="./pages/customer/list.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>客户跟进</cite>
                        </a>
                    </li>--%>
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
                        <a _href="./pages/personnel/department.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>部门管理</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="./pages/personnel/position.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>职务管理</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="./pages/personnel/employee.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>员工管理</cite>
                        </a>
                    </li>
                </ul>
            </li>

            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6b1;</i>
                    <cite>数据回收站</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont">&#xe6b1;</i>
                            <cite>人事回收站</cite>
                            <i class="iconfont nav_right">&#xe697;</i>
                        </a>
                        <ul class="sub-menu">
                            <li>
                                <a _href="./pages/recycle/department.jsp">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>部门回收</cite>
                                </a>
                            </li>
                            <li>
                                <a _href="./pages/recycle/position.jsp">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>职务回收</cite>
                                </a>
                            </li>
                            <li>
                                <a _href="./pages/recycle/employee.jsp">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>员工回收</cite>
                                </a>
                            </li>
                        </ul>
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
    <div class="copyright">Copyright ©2019 crm v1.0 All Rights Reserved</div>
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

    window.loginout=function(){
        $.get("/admin/loginout",function (data) {
            window.location.href="login.jsp";
        })

    }
/**
 * 修改个人资料
 */
    window.AdminShow = function (title, url, w, h) {
        if (title == null || title == '') {
            title = false;
        }
        ;
        if (url == null || url == '') {
            url = "401.jsp";
        }
        ;
        if (w == null || w == '') {
            w = ($(window).width() * 0.5);
        }
        ;
        if (h == null || h == '') {
            h = ($(window).height() - 50);
        }
        ;
        layer.open({
            type: 2,
            area: [w + 'px', h + 'px'],
            fix: false, //不固定
            maxmin: true,
            shadeClose: true,
            shade: 0.4,
            title: title,
            content: url
        });
    }


    /**
     * 修改密码
     * @param title
     * @param url
     * @param w
     * @param h
     * @constructor
     */
    window.EditPassword = function (title, url, w, h) {
        if (title == null || title == '') {
            title = false;
        }
        ;
        if (url == null || url == '') {
            url = "401.jsp";
        }
        ;
        if (w == null || w == '') {
            w = ($(window).width() * 0.3);
        }
        ;
        if (h == null || h == '') {
            h = ($(window).height() - 350);
        }
        ;
        layer.open({
            type: 2,
            area: [w + 'px', h + 'px'],
            fix: false, //不固定
            maxmin: true,
            shadeClose: true,
            shade: 0.4,
            title: title,
            content: url
        });
    }
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