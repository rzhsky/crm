<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>欢迎页面-WeAdmin Frame型后台管理系统-WeAdmin 1.0</title>
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
<div class="weadmin-body">
    <form class="layui-form">
        <input type="hidden" id="parentname">
        <input type="hidden" id="empname">
        <div class="layui-form-item">
            <div class="layui-input-block">
                <input type="hidden" id="id" name="id" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="deptname" class="layui-form-label">
                <span class="we-red">*</span>部门名称
            </label>
            <div class="layui-input-block">
                <input type="text" id="deptname" name="deptname" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="parentid" class="layui-form-label">
                <span class="we-red">*</span>上一级部门
            </label>

            <div class="layui-input-block">
                <select id="parentid" name="parentid" lay-verify="">
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label for="empid" class="layui-form-label">
                <span class="we-red">*</span>负责人
            </label>

            <div class="layui-input-block">
                <select id="empid" name="empid" lay-verify="">
                </select>
            </div>
        </div>


        <div class="layui-form-item">
            <label for="deptdesc" class="layui-form-label">
                <span class="we-red">*</span>描述
            </label>
            <div class="layui-input-block">
                <textarea id="deptdesc" name="deptdesc" placeholder="请输入内容" class="layui-textarea"></textarea>
            </div>
        </div>

        <div style="width: 216px; margin: 0 auto;">
            <button class="layui-btn layui-btn-fluid" lay-filter="update" lay-submit="">修改</button>
        </div>
    </form>
</div>
<script src="../../lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">
    layui.extend({
        admin: '{/}../../static/js/admin'
    });
    layui.use(['form', 'layer', 'admin', 'table', 'layedit'], function () {
        let form = layui.form,
            admin = layui.admin,
            layer = layui.layer,
            $ = layui.jquery,
            table = layui.table,
            layedit = layui.layedit;
        let build = layedit.build('deptdesc'); //建立编辑器

        $.get("/dept/all", function (data) {
            for (let i = 0; i < data.length; i++) {
                $("#parentid").append('<option value="' + data[i].id + '">' + data[i].deptname + '</option>');
            }

            $("#parentid").val($("#parentname").val());
            form.render();
        });

        $.get("/emp", function (data) {
            for (let i = 0; i < data.length; i++) {
                console.log(data[i].id + "-" + data[i].department.deptname + '-' + data[i].empname);
                $("#empid").append('<option value="' + data[i].id + '">' + data[i].department.deptname + '-' + data[i].empname + '</option>');
            }
            $("#empid").val($("#empname").val());
            form.render();
        });

        //监听提交
        form.on('submit(update)', function (data) {
            console.log(data);
            data.field.deptdesc = layedit.getContent(build);
            $.ajax({
                url: "/department",
                method: "put",
                data: JSON.stringify(data.field),
                dataType: "json",
                contentType: "application/json",
                success: function (data) {
                    console.log(data);
                    if (data === 1) {
                        console.log("修改成功");
                        layer.alert("修改成功", {icon: 6}, function () {
                            // 获得frame索引
                            let index = parent.layer.getFrameIndex(window.name);
                            parent.layui.table.reload('dept', { //表格的id
                                url: '/department'
                            });

                            //关闭当前frame
                            parent.layer.close(index);
                        });
                    } else {
                        layer.alert("修改失败", {icon: 6}, function () {
                            // 获得frame索引
                            let index = parent.layer.getFrameIndex(window.name);
                            //关闭当前frame
                            parent.layer.close(index);
                        });
                    }
                }
            });

            return false;
        });

    });
</script>
</body>

</html>