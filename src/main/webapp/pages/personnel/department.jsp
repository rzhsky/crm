<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>部门管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="../../static/css/font.css">
    <link rel="stylesheet" href="../../static/css/weadmin.css">
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="weadmin-nav">
			<span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">人事管理</a>
        <a>
          <cite>部门管理</cite></a>
      </span>
    <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right"
       href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="weadmin-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 we-search">
            <div class="layui-inline">
                <input type="text" name="deptname" placeholder="部门名称" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-inline">
                <input type="text" name="empname" placeholder="负责人名称" autocomplete="off" class="layui-input">
            </div>
            <button class="layui-btn" lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>
    <table id="dept" lay-filter="test"></table>
</div>
<script src="../../lib/layui/layui.js" charset="utf-8"></script>
<script src="../../static/js/personnel.js" type="text/javascript" charset="utf-8"></script>
<script src="../../static/js/eleDel.js" type="text/javascript" charset="utf-8"></script>
<script>
    layui.use('table', function () {
        let table = layui.table,
            $ = layui.jquery,
            form = layui.form;

        //第一个实例
        table.render({
            elem: '#dept',
            height: 525,
            toolbar: '#toolbarDemo',
            url: '/department', //数据接口
            cellMinWidth: 80,
            page: true,//开启分页
            cols: [[ //表头
                {type: 'checkbox', fixed: 'left'},
                {field: 'id', title: 'ID', sort: true},
                {field: 'deptname', title: '部门名称', sort: true},
                {field: 'parentname', title: '上一级部门', templet: "#parentname"},
                {field: 'empname', title: '负责人名称', templet: "#empname"},
                {field: 'phone', title: '联系电话', templet: "#phone"},
                {field: 'addr', title: '联系地址', sort: true, templet: "#addr"},
                {field: 'deptdesc', title: '部门描述'},
                {field: 'operator', title: '操作', templet: '#operateTpl', fixed: 'right'},
            ]]
        });

        table.on('tool(test)', function (obj) {
            let data = obj.data;
            if (obj.event === 'edit') {
                Edit("编辑", "./edit-department.jsp", data)
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
                    let body = layer.getChildFrame('body', index);
                    body.contents().find("#id").val(data.id);
                    body.contents().find("#deptname").val(data.deptname);
                    body.contents().find("#parentname").val(data.parent.id);

                    body.contents().find("#empname").val(data.employee.id);
                    body.contents().find("#deptdesc").val(data.deptdesc);
                },
                error: function (layero, index) {
                    alert("出现错误");
                }
            });
        };
    });
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
<script type="text/html" id="phone">
    {{#
    var fn = function(item){
    var str = '';

    str = item.phone;
    return str;
    };
    }}
    <div>{{ fn(d.employee) }}</div>
</script>
<script type="text/html" id="parentname">
    {{#
    var fn = function(item){
    var str = '';

    str = item.deptname;
    return str;
    };
    }}
    <div>{{ fn(d.parent) }}</div>
</script>
<script type="text/html" id="addr">
    {{#
    var fn = function(item){
    var str = '';

    str = item.addr;
    return str;
    };
    }}
    <div>{{ fn(d.employee) }}</div>
</script>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-danger" onclick="delChoose('dept', '/department/batchdel')"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn" onclick="Add('添加部门','./add-department.jsp')"><i
                class="layui-icon"></i>添加
        </button>
    </div>
</script>

<script type="text/html" id="operateTpl">
    <a title="编辑" href="javascript:;" lay-event="edit">
        <i class="layui-icon">&#xe642;</i>
    </a>
    <a title="删除" onclick="del(this, '/department', 'dept', '/department', '该部门拥有员工，不能删除！', '该部门拥有子部门，不能删除！')" href="javascript:;">
        <i class="layui-icon">&#xe640;</i>
    </a>
</script>
</body>

</html>