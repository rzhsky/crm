<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>资料修改页面</title>
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
    <form class="layui-form"  lay-filter="adminmsg">
        <input type="hidden" id="position">
        <input type="hidden" id="dept">

        <div class="layui-form-item">
            <div class="layui-input-inline">
                <input type="hidden" id="id" name="id" required=""
                       autocomplete="off" class="layui-input" value="${employee.id}">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="empname" class="layui-form-label" >
                <span class="we-red">*</span>员工姓名
            </label>
            <div class="layui-input-inline">
                <input type="text" id="empname" name="empname" required=""
                       autocomplete="off" class="layui-input" value="${employee.empname}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="we-red">*</span>性别
            </label>
            <div class="layui-input-inline">
                <input type="radio" name="sex" value="1"  <c:if test="${employee.sex==0}">checked="checked"</c:if> title="男"/>
                <input type="radio" name="sex" value="0" <c:if test="${employee.sex==1}">checked="checked"</c:if> title="女"/>
            </div>
        </div>

        <div class="layui-form-item">
            <label for="phone" class="layui-form-label">
                <span class="we-red">*</span>电话
            </label>
            <div class="layui-input-inline">
                <input type="tel" id="phone" name="phone" required="" lay-verify="phone"
                       autocomplete="off" class="layui-input" value="${employee.phone}">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="addr" class="layui-form-label">
                <span class="we-red">*</span>地址
            </label>
            <div class="layui-input-inline">
                <input type="text" id="addr" name="addr" required="" lay-verify="required"
                       autocomplete="off" class="layui-input" value="${employee.addr}">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="email" class="layui-form-label">
                <span class="we-red">*</span>邮箱
            </label>
            <div class="layui-input-inline">
                <input type="text" id="email" name="email" required="" lay-verify="email"
                       autocomplete="off" class="layui-input" value="${employee.email}">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="deptid" class="layui-form-label">
                <span class="we-red">*</span>部门
            </label>

            <div class="layui-input-inline">
                <select id="deptid" name="deptid" lay-verify="">
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label for="pid" class="layui-form-label">
                <span class="we-red">*</span>职位
            </label>
            <div class="layui-input-inline">
                <select id="pid" name="pid" lay-verify="">
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">修改头像</label>
            <div class="layui-input-inline uploadHeadImage">
                <div class="layui-upload-drag" id="headImg">
                    <img class="layui-upload-img headImage" src="/upload/default.jpg" id="demo1" style="width: 220px" height="200px">
                    <p id="demoText"></p>
                    <i class="layui-icon">&#xe67c;</i>
                    <p>点击上传图片，或将图片拖拽到此处</p>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-inline">
                <input type="hidden" id="img" name="img" required=""
                       autocomplete="off" class="layui-input" >
            </div>
        </div>

        <div class="layui-form-item">
            <label for="pid" class="layui-form-label">
            </label>
            <button class="layui-btn" lay-filter="update" lay-submit="">修改</button>
        </div>
    </form>
</div>
<script src="../../lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">
    layui.extend({
        admin: '{/}../../static/js/admin'
    });
    layui.use(['form', 'layer', 'admin', 'table'], function () {
        let form = layui.form,
            admin = layui.admin,
            layer = layui.layer,
            $ = layui.jquery,
            table = layui.table;

        $.get("/dept/all", function (data) {
            for (let i = 0; i < data.length; i++) {
                $("#deptid").append('<option value="' + data[i].id + '">' + data[i].deptname + '</option>');
            }

            // $("#deptid").val($("#dept").val());
            form.render();
            console.log(data);
        });

        $.get("/position/all", function (data) {
            for (let i = 0; i < data.length; i++) {
                $("#pid").append('<option value="' + data[i].id + '">' + data[i].positionname + '</option>');
            }

            $("#pid").val($("#position").val());
            form.render();
            console.log(data);
        });

        //监听提交
        form.on('submit(update)', function (data) {
            console.log(data);
            let imgname=data.field.img;
            console.log("图片路径"+imgname)
            $=layui.jquery;
            $.ajax({
                url: "/admin/update",
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
                            //关闭当前frame
                            parent.location.reload();
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

<script type="text/javascript">
    layui.use(["jquery", "upload", "form", "layer", "element"], function () {
        var $ = layui.$,
            element = layui.element,
            layer = layui.layer,
            upload = layui.upload,
            form = layui.form;
        //拖拽上传
        var uploadInst = upload.render({
            elem: '#headImg'
            , url: '/upload/headImg'
            , size: 500
            , before: function (obj) {
                obj.preview(function (index, file, result) {
                    $('#demo1').attr('src', result); //图片链接（base64）
                });
            }
            , done: function (res) {
                //如果上传失败
                if (res.code > 0) {
                    return layer.msg('上传失败');
                }
                //上传成功
                //打印后台传回的地址: 把地址放入一个隐藏的input中, 和表单一起提交到后台.
                $("#img").val(res.data.src);
               /* window.parent.uploadHeadImage(res.data.src);
                var demoText = $('#demoText');
                demoText.html('<span style="color: #8f8f8f;">上传成功!!!</span>');*/
            }
            , error: function () {
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function () {
                    uploadInst.upload();
                });
            }
        });
        element.init();
    });
</script>

</body>

</html>