<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				<a href="javascript:;">首页</a> <a href="javascript:;">合同管理</a>
				<a href="javascript:;"> <cite>合同列表</cite></a>
			</span>
    <a class="layui-btn layui-btn-sm" style="margin-top:3px;float:right"
       href="javascript:location.replace(location.href);"
       title="刷新">
        <i class="layui-icon layui-icon-refresh"></i>
    </a>
</div>

<div class="weadmin-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 we-search">
            合同搜索：
            <div class="layui-inline">
                <input class="layui-input" placeholder="合同名称" name="contractName" id="conname">
            </div>
            <div class="layui-inline">
                <input class="layui-input" placeholder="客户名称" name="customerName" id="cusname">
            </div>
            <div class="layui-inline">
                <input class="layui-input" placeholder="签约人姓名" name="employeeName" id="emp">
            </div>
            <button class="layui-btn" lay-submit="" lay-filter="search">
                <i class="layui-icon layui-icon-search"></i>
            </button>
        </form>
    </div>
    <table class="layui-hide" id="datas" lay-filter="test"></table>
</div>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-danger" data-type="getCheckData" onclick="deleteAll()">
            <i class="layui-icon layui-icon-delete"></i>批量删除
        </button>
        <button class="layui-btn" onclick="WeAdminShow('添加合同','add-contract.jsp',600,400)">
            <i class="layui-icon layui-icon-add-circle-fine"></i>添加
        </button>
    </div>
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit" title="编辑"
       href="javascript:;">编辑
        <i class="layui-icon">&#xe642;</i>
    </a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" title="删除" onclick="deleteContract(this)" href="javascript:;">
        删除<i class="layui-icon">&#xe640;</i>
    </a>
    <%--<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>--%>
</script>

<!--<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>-->
<script src="../../lib/layui/layui.js" charset="utf-8"></script>
<script src="../../static/js/eleDel.js" type="text/javascript" charset="utf-8"></script>


<script>
    layui.use('table', function () {
        var table = layui.table,
            form = layui.form,
            $ = layui.jquery;
        //展示已知数据
        table.render({
            elem: '#datas'
            , toolbar: '#toolbarDemo'
            , url: '/contract/all'
            , title: '用户数据表'
            , height: 500
            , cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                , {field: 'id', title: '合同id', sort: true, fixed: 'left'}
                , {field: 'name', title: '合同名称'}
                , {field: 'createdate', title: '创建时间', totalRow: true}
                , {field: 'content', title: '合同内容'}
                , {field: 'customer', title: '客户姓名', totalRow: true, templet: "#name"}
                , {field: 'amount', title: '合同金额'}
                , {field: 'employee', title: '签约人姓名', templet: "#empname"}
                , {field: 'remark', title: '备注'}
                , {fixed: 'right', title: '操作', align: 'center', toolbar: '#barDemo'}
            ]]
            , even: true
            , page: true
            // , id: 'testReload'
        });

        form.on('submit(search)',function(obj){
            table.reload('datas',{
                url: "/searchContract",
                where: obj.field
            });
            return false
        });

        window.deleteContract = function (obj, id) {
            layer.confirm('确定删除？', function (index) {
                var id = $(obj).parents("tr").children(":eq(1)").text();
                console.log(id);
                $.ajax({
                    method: "post",
                    url: "/contract/" + id,
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
                    url: "/contractAll",
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
                })
            })

        }

        table.on('tool(test)', function (obj) {
            var data = obj.data;
            if (obj.event === 'edit') {
                Edit("编辑", "./edit-contract.jsp", data)
            }
        });

        window.Edit = function (title, url, data, w, h) {
            if (title == null || title === '') {
                title = false;
            }
            if (url == null || url === '') {
                url = "404.jsp";
            }
            if (w == null || w === '') {
                w = ($(window).width() * 0.9);
            }
            if (h == null || h === '') {
                h = ($(window).height() - 50);
            }
            layer.open({
                type: 2,
                area: [w + 'px', h + 'px'],
                fix: false, //不固定
                maxmin: true,
                shadeClose: true,
                shade: 0.4,
                title: title,
                content: url,
                success: function (layero, index) {
                    //向iframe页的id=house的元素传值  //参考 https://yq.aliyun.com/ziliao/133150
                    var body = layer.getChildFrame('body', index);
                    body.contents().find("#id").val(data.id);
                    body.contents().find("#name").val(data.name);
                    body.contents().find("#createdate").val(data.createdate);
                    body.contents().find("#content").val(data.content);
                    body.contents().find("#customername").val(data.customer.id);
                    body.contents().find("#amount").val(data.amount);
                    body.contents().find("#employeename").val(data.employee.id);
                    body.contents().find("#remark").val(data.remark);

                },
                error: function (layero, index) {
                    alert("出现错误");
                },

                end: function () {
                    table.reload('datas', { //表格的id
                        url: '/contract/all'
                    });
                }
            });
        };
    });
</script>
<script type="text/html" id="name">
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
