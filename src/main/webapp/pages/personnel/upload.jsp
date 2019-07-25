<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>文件上传</title>
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
        <div class="layui-upload-drag" id="fileupload">
            <i class="layui-icon"></i>
            <p>点击上传，或将文件拖拽到此处</p>
        </div>
    </form>
</div>
<script src="../../lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">
    layui.extend({
        admin: '{/}../../static/js/admin'
    });
    layui.use(['form', 'layer', 'upload', 'jquery'], function () {
        let form = layui.form,
            layer = layui.layer,
            upload = layui.upload,
            $ = layui.jquery;
        //form.render();
        //自定义验证规则

        //指定允许上传的文件类型
        upload.render({
            elem: '#fileupload',
            url: '/position/upload',
            method: 'post',
            accept: 'file', //普通文件
            exts: 'xls|xlsx',
            done: function (res) {
                if (res.data === '添加成功') {
                    layer.alert("数据添加成功", {icon: 1}, function () {
                        // 获得frame索引
                        let index = parent.layer.getFrameIndex(window.name);
                        //关闭当前frame
                        parent.layui.table.reload('position', {
                            url: '/position'
                        });
                        parent.layer.close(index);
                    });
                }else {
                    layer.alert("数据格式不规范，添加失败", {icon: 2}, function () {
                        // 获得frame索引
                        let index = parent.layer.getFrameIndex(window.name);
                        //关闭当前frame
                        parent.layer.close(index);
                    });
                }
                console.log(res)
            }
        });

    });
</script>
</body>

</html>