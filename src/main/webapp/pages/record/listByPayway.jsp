<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <base
            href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}/">
    <title>用户统计页面</title>
    <script src="../../lib/layui/echarts.min.js"></script>
    <script src="../../lib/layui/layui.js" charset="utf-8"></script>
    <script src="../../lib/jquery.easyui.min.js"></script>
    <script src="../../lib/jquery.min.js"></script>
</head>
<body>
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="main" style="width: 600px;height:300px;"></div>
<script type="text/javascript">
    //使用ajax加载数据
    $.ajax({
        method:'post',
        url:'/echartsData',
        dataType:'json',
        success:function(data){
            initChat(data);
        }
    });
    function initChat(data){
        var myChart = echarts.init(document.getElementById('main'));
        option = {
            title : {
                text: '支付方式统计',
                x:'center'
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                data: data
            },
            series : [
                {
                    name: '支付方式',
                    type: 'pie',
                    radius : '55%',
                    center: ['50%', '60%'],
                    data:data,
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        },
            myChart.setOption(option);
    };
</script>
</body>
</html>