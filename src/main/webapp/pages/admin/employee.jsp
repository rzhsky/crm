<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>员工管理</title>
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
          <cite>员工管理</cite></a>
      </span>
    <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right"
       href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="weadmin-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 we-search layui-form-pane">
            <div class="layui-inline">
                <input class="layui-input" placeholder="姓名" name="empname">
            </div>

            <div class="layui-inline">
                <input class="layui-input" placeholder="电话" name="phone">
            </div>
            <button class="layui-btn" lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>
    <div class="weadmin-block">
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn" onclick="WeAdminShow('添加用户','./add-employee.jsp')"><i class="layui-icon"></i>添加
        </button>
        <span class="fr" style="line-height:40px">共有数据：88 条</span>
    </div>
    <table id="emp" lay-filter="test"></table>
    <%--<table class="layui-table">--%>
        <%--<thead>--%>
        <%--<tr>--%>
            <%--<th>--%>
                <%--<div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i--%>
                        <%--class="layui-icon">&#xe605;</i></div>--%>
            <%--</th>--%>
            <%--<th>姓名</th>--%>
            <%--<th>性别</th>--%>
            <%--<th>电话</th>--%>
            <%--<th>地址</th>--%>
            <%--<th>邮箱</th>--%>
            <%--<th>部门</th>--%>
            <%--<th>职位</th>--%>
            <%--<th>操作</th>--%>
        <%--</thead>--%>
        <%--<tbody>--%>
        <%--<tr>--%>
            <%--<td>--%>
                <%--<div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i>--%>
                <%--</div>--%>
            <%--</td>--%>
            <%--<td>1</td>--%>
            <%--<td>会员相关</td>--%>
            <%--<td>会员相关</td>--%>
            <%--<td>会员相关</td>--%>
            <%--<td>会员相关</td>--%>
            <%--<td>会员相关</td>--%>
            <%--<td class="td-manage">--%>
                <%--<a title="编辑" onclick="WeAdminShow('编辑','./edit.jsp')" href="javascript:;">--%>
                    <%--<i class="layui-icon">&#xe642;</i>--%>
                <%--</a>--%>
                <%--<a title="删除" onclick="member_del(this,'要删除的id')" href="javascript:;">--%>
                    <%--<i class="layui-icon">&#xe640;</i>--%>
                <%--</a>--%>
            <%--</td>--%>
        <%--</tr>--%>
        <%--</tbody>--%>
    <%--</table>--%>
    <%--<div class="page">--%>
        <%--<div>--%>
            <%--<a class="prev" href="">&lt;&lt;</a>--%>
            <%--<a class="num" href="">1</a>--%>
            <%--<span class="current">2</span>--%>
            <%--<a class="num" href="">3</a>--%>
            <%--<a class="num" href="">489</a>--%>
            <%--<a class="next" href="">&gt;&gt;</a>--%>
        <%--</div>--%>
    <%--</div>--%>
</div>
<script src="../../lib/layui/layui.js" charset="utf-8"></script>
<script src="../../static/js/eleDel.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
    layui.use('table', function () {
        let table = layui.table;

        //第一个实例
        table.render({
            elem: '#emp',
            height: 312,
            url: '/emp/all', //数据接口
            page: true,//开启分页
            cols: [[ //表头
                // {field: 'id', title: 'ID', width: 80, sort: true, fixed: 'left'},
                {field: 'empname', title: '姓名', width: 80},
                {field: 'sex', title: '性别', width: 80},
                {field: 'phone', title: '电话', width: 80, sort: true},
                {field: 'addr', title: '地址', width: 80},
                {field: 'email', title: '邮箱', width: 177},
                // {field: 'department.deptname', title: '部门', width: 80, sort: true},
                // {field: 'position.positionname', title: '职位', width: 80, sort: true},
                // {title: '操作', width: 80, content: '123' },
            ]]
        });

    });
</script>
</body>

</html>