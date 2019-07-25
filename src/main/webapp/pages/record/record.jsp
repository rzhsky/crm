<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>客户列表</title>
    <meta name="renderer" content="webkit"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
    <link rel="stylesheet" href="../../static/css/font.css"/>
    <link rel="stylesheet" href="../../static/css/weadmin.css"/>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="weadmin-nav">
    <span class="layui-breadcrumb">
        <a href="javascript:;">首页</a> <a href="javascript:;">财务管理</a>
        <a href="javascript:;"> <cite>交易记录</cite></a>
    </span>
    <a class="layui-btn layui-btn-sm" style="margin-top:3px;float:right"
       href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon layui-icon-refresh"></i>
    </a>
</div>
<div class="weadmin-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 we-search">
            交易记录搜索：
            <div class="layui-inline">
                <input class="layui-input" placeholder="交款人姓名" name="cusname">
            </div>
            <div class="layui-inline">
                <input class="layui-input" placeholder="受理人姓名" name="employeename">
            </div>
            <button class="layui-btn" lay-submit="" lay-filter="search">
                <i class="layui-icon layui-icon-search"></i>
            </button>
        </form>
    </div>
    </div>
    <table class="layui-hide" id="datas" lay-filter="test"></table>
</div>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-danger" onclick="deleteAll()">
            <i class="layui-icon layui-icon-delete"></i>批量删除
        </button>
        <button class="layui-btn layui-btn-danger" onclick="WeAdminShow('按月份统计','listByTime.jsp',800,600)">
           按月统计
        </button>
        <button class="layui-btn layui-btn-danger" onclick="WeAdminShow('按支付方式统计','listByPayway.jsp',800,600)">
            支付方式统计
        </button>
    </div>
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit" title="编辑"
       href="javascript:;">编辑
        <i class="layui-icon">&#xe642;</i>
    </a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" title="删除" onclick="deleteOrder(this)" href="javascript:;">
        删除<i class="layui-icon">&#xe640;</i>
    </a>
</script>

<!--<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>-->
<script src="../../lib/layui/layui.js" charset="utf-8"></script>
<script src="../../static/js/eleDel.js" type="text/javascript" charset="utf-8"></script>

<script>
    layui.use('table', function () {
        var table = layui.table,
            form = layui.form,
            $ = layui.jquery;
        // 显示已知数据
        table.render({
            elem: '#datas'
            , toolbar: '#toolbarDemo'
            , url: '/record/all'
            , title: '用户数据表'
            , height: 500
            , cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                , {field: 'id', title: '交易记录id', sort: true, fixed: 'left'}
                , {field: 'handedmoney', title: '付款金额'}
                , {field: 'paydate', title: '成交时间', totalRow: true}
                , {field: 'paycontent', title: '备注'}
                , {field: 'payway', title: '支付方式'}
                , {field: 'orders', title: '订单编号', totalRow: true, templet: "#ordernumber"}
                , {field: 'customer', title: '交款人姓名', templet: "#customername"}
                , {field: 'employee', title: '受理人姓名', templet: "#empname"}
                , {fixed: 'right', title: '操作', align: 'center', toolbar: '#barDemo'}
            ]]
            , even: true
            , page: true
            // , id: 'testReload'
        });

        <!--单行数据的删除-->
        window.deleteOrder = function (obj, id) {
            layer.confirm('确定删除？', function (index) {
                var id = $(obj).parents("tr").children(":eq(1)").text();
                console.log(id);
                $.ajax({
                    method: "post",
                    url: "/record/" + id,
                    data: {_method: "Delete"},
                    dataType: "json",
                    success: function (data) {
                        if (data == "1") {
                            $(obj).parents("tr").remove();
                            layer.msg('删除成功', {icon: 1});
                            window.location.reload();
                        } else if (data == "0") {
                            layer.msg('删除失败', {icon: 2});
                        }
                    }
                });
            })
        };
        <!--批量删除-->
        window.deleteAll = function (argument) {
            var checkStatus = table.checkStatus('datas')
                , data = checkStatus.data;
            console.log(data);
            if (data == "") {
                layer.msg("至少选择一项", {icon: 2});
                return;
            }
            var ids = "";
            if (data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                    ids += data[i].id + ",";
                }
            }
            console.log(ids)
            layer.confirm("确定删除所选项吗？" + ids, function (index) {
                $.ajax({
                    type: "POST",
                    url: "/recordAll",
                    data: {"ids": ids},
                    success: function (data) {
                        if (data === "1") {
                            layer.msg("删除成功！", {icon: 1});
                            $(".layui-form-checked").not('.header').parents('tr').remove();
                            window.location.reload();
                        } else if (data === "0") {
                            layer.msg("删除失败！", {icon: 2});
                        }
                    }
                });
            });
        }


        <!--根据条件搜索交易记录-->
        form.on('submit(search)', function (obj) {
            table.reload('datas', {
                url: "/searchRecord",
                where: obj.field
            });
            return false
        });
    });
</script>
<script type="text/html" id="ordernumber">
    {{#
    var fn = function(item){
    var str = '';

    str = item.ordernumber;
    return str;
    };
    }}
    <div>{{ fn(d.orders) }}</div>
</script>

<script type="text/html" id="customername">
    {{#
    var fn = function(item){
    var str = '';

    str = item.name;
    return str;
    };
    }}
    <div>{{ fn(d.customer) }}</div>
</script>

<script type="text/html" id="empname">
    {{#
    var fn = function(item){
    var str = '';

    str = item.empname;
    return str;
    };
    }}
    <div>{{ fn(d.employee) }}</div>
</script>
</body>
</html>

