<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>错误页面-CRM后台管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="../static/css/font.css">
    <link rel="stylesheet" href="../static/css/weadmin.css">


    <script language="javascript">
        var secs = 3; //倒计时的秒数
        var URL;

        function Load(url) {
            URL = url;
            for (var i = secs; i >= 0; i--) {
                window.setTimeout('doUpdate(' + i + ')', (secs - i) * 1000);
            }
        }

        function doUpdate(num) {
            document.getElementById('ShowDiv').innerHTML = '将在' + num + '秒后自动跳转到主页';
            if (num === 0) {
                window.location = URL;
            }
        }
    </script>
</head>

<body class="flat-blue" onload="Load('index.jsp')">
<input type="hidden" value="0">
<div class="app-container">
    <div class="row content-container">
        <!-- Main Content -->
        <div class="container">
            <div class="side-body padding-top">
                <div class="col-lg-2"></div>
                <div id="ShowDiv"></div>
                <br>
                <img src="imgs/404.png" width="800">
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="../lib/layui/layui.js" charset="utf-8"></script>


</html>