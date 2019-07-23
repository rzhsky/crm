<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE HTML>
<html lang="en">

<head>
    <title>404</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8">
    <!-- Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:300,400' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900' rel='stylesheet' type='text/css'>
    <!-- CSS Libs -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/css/animate.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/css/bootstrap-switch.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/css/checkbox3.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/css/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/css/dataTables.bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/css/select2.min.css">
    <!-- CSS App -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/themes/flat-blue.css">

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

<body class="flat-blue" onload="Load('${pageContext.request.contextPath}/html/index.jsp')">

<input type="hidden" value="0">
<div class="app-container">
    <div class="row content-container">
        <%@include file="top.jsp" %>
        <!-- Main Content -->
        <div class="container">
            <div class="side-body padding-top">
                <div class="col-lg-2"></div>
                <div id="ShowDiv"></div>
                <br>
                <img src="${pageContext.request.contextPath}/img/404.png" width="800">
            </div>
        </div>
    </div>
    <%@include file="footer.jsp" %>
    <div>
        <!-- Javascript Libs -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/jquery.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/Chart.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/bootstrap-switch.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath}/lib/js/jquery.matchHeight-min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath}/lib/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath}/lib/js/dataTables.bootstrap.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/select2.full.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/ace/ace.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/ace/mode-html.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/ace/theme-github.js"></script>
        <!-- Javascript -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/app.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/index.js"></script>
    </div>
</div>

</body>
</html>
