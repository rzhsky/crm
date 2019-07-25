<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>职务管理</title>
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
        <a href="">数据回收站</a>
        <a href="">人事回收站</a>
        <a>
          <cite>职务回收</cite></a>
      </span>
    <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right"
       href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="weadmin-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 we-search">
            <div class="layui-inline">
                <input type="text" name="positionname" placeholder="职务名称" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-inline">
                <input type="text" name="level" placeholder="职务等级" autocomplete="off" class="layui-input">
            </div>
            <button class="layui-btn" lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>

    <table id="position" lay-filter="test"></table>
</div>
<script src="../../lib/layui/layui.js" charset="utf-8"></script>
<script src="../../static/js/eleDel.js" type="text/javascript" charset="utf-8"></script>
<script src="../../static/js/personnel.js" type="text/javascript" charset="utf-8"></script>

<script type="text/javascript">
    layui.extend({
        admin: '{/}../../static/js/admin'
    });
    layui.use(['form', 'layer', 'admin', 'jquery', 'table'], function () {
        let form = layui.form,
            admin = layui.admin,
            layer = layui.layer,
            table = layui.table,
            $ = layui.jquery;
        form.render();

        //第一个实例
        table.render({
            elem: '#position',
            height: 525,
            toolbar: '#toolbarDemo',
            url: '/position/del', //数据接口
            cellMinWidth: 80,
            page: true,//开启分页
            cols: [[ //表头
                {type: 'checkbox', fixed: 'left'},
                {field: 'id', title: 'ID', sort: true},
                {field: 'positionname', title: '职务名称', sort: true},
                {field: 'level', title: '职务级别', templet: '#sex'},
                {field: 'createtime', title: '创建时间'},
                {field: 'deletetime', title: '删除时间', sort: true},
                {field: 'operator', title: '操作', templet: '#operateTpl', fixed: 'right'},
            ]]
        });

    });
</script>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-danger" onclick="completely_delete_Choose('position', '/position/batchredelcomp')"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn" onclick="restoreChoose('position', '/position/batchrestore')"><i class="layui-icon"></i>批量恢复
        </button>
    </div>
</script>

<script type="text/html" id="operateTpl">
    <a title="数据恢复" href="javascript:;" onclick="restore(this, '/position/restore', 'position', '/position/del')">
        <i class="layui-icon">&#xe6b2;</i>
    </a>
    <a title="彻底删除" onclick="completely_delete(this, '/position', 'position', '/position/del')" href="javascript:;">
        <i class="layui-icon">&#xe640;</i>
    </a>
</script>
</body>

</html>