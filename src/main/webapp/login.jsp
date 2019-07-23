<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>管理员登录</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="static/css/font.css">
	<link rel="stylesheet" href="static/css/weadmin.css">
    <script src="lib/layui/layui.js" charset="utf-8"></script>

</head>
<body class="login-bg">
    
    <div class="login">
        <div class="message">CRM后台登录</div>
        <div id="darkbannerwrap"></div>
        
        <form method="post" class="layui-form" id="loginform" >
            <input name="empname" placeholder="用户名"  type="text" lay-verify="empname" class="layui-input" >
            <hr class="hr15">
            <input name="password" lay-verify="password" placeholder="密码"  type="password" class="layui-input">
            <hr class="hr15">
            <input class="login1" id="login" value="登录" lay-submit lay-filter="alogin" style="width:100%;" type="submit">
            <hr class="hr20" >
            <div></div>
        </form>
    </div>

    <script type="text/javascript">
        
        	layui.extend({
				admin: '{/}./static/js/admin'
			});
            layui.use(['form','admin'], function(){
              var form = layui.form
              	,admin = layui.admin
                  ,$ = layui.jquery;
              // layer.msg('玩命卖萌中', function(){
              //   //关闭后的操作
              //   });
                //自定义验证规则
                form.verify({
                    empname:function (value) {
                        if (value==""){
                            return "请输入用户名"
                        }
                    },
                    password:function (value) {
                        if (value==""){
                            return "请输入密码"
                        }
                    }
                })
              //监听提交
              form.on('submit(alogin)', function(data){
                  let f=data.field;
                  console.log(f.empname);
                  console.log(f.password);
                  $.post("/admin/login",data.field,function (data) {
                      if(data==='1'){
                              location.href='index.jsp'
                      }else {
                          $("#loginform")[0].reset();
                          layer.msg("用户名或密码不正确！",{icon:2,time:1000},function () {
                          })
                      }
                  })
                  return false;
              });

            });   
    </script>  
    <!-- 底部结束 -->
</body>
</html>