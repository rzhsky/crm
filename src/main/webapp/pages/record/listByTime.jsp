<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>ECharts</title>
    <!-- 引入jquery.js -->
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <!-- 引入 echarts.js -->
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/echarts.common.min.js"></script>
    <script src="../../lib/layui/echarts.min.js"></script>
    <script src="../../lib/layui/layui.js" charset="utf-8"></script>
    <script src="../../lib/jquery.easyui.min.js"></script>
    <script src="../../lib/jquery.min.js"></script>
</head>
<body>
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="main" style="width: 600px; height: 400px;"></div>
</body>
<script type="text/javascript">
    var myChart = echarts.init(document.getElementById('main'));
    // 显示标题，图例和空的坐标轴
    myChart.setOption({
        title : {
            text : '成交量统计'
        },
        tooltip : {},
        legend : {
            data : [ '成交量' ]
        },
        xAxis : {
            data : []
        },
        yAxis : {},
        series : [ {
            name : '成交量',
            type : 'bar',
            data : []
        } ]
    });

    myChart.showLoading(); //数据加载完之前先显示一段简单的loading动画

    var names = []; //类别数组（实际用来盛放X轴坐标值）
    var nums = []; //数量数组（实际用来盛放Y坐标值）

    $.ajax({
        type : "post",
        async : true, //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
        url : "/groupByMonth",
        data : {},
        dataType : "json", //返回数据形式为json
        success : function(result) {
            //请求成功时执行该函数内容，result即为服务器返回的json对象
            if (result) {
                for (var i = 0; i < result.length; i++) {
                    names.push(result[i].name);
                }
                for (var i = 0; i < result.length; i++) {
                    nums.push(result[i].value);
                }
                myChart.hideLoading(); //隐藏加载动画
                myChart.setOption({ //加载数据图表
                    xAxis : {
                        data : names
                    },
                    series : [ {
                        // 根据名字对应到相应的系列
                        name : '数量',
                        data : nums
                    } ]
                });

            }

        },
        error : function(errorMsg) {
            //请求失败时执行该函数
            alert("图表请求数据失败!");
            myChart.hideLoading();
        }
    })
</script>
</html>