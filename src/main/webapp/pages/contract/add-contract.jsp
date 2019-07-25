<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>添加合同</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
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
        <div class="layui-form-item">
            <label for="name" class="layui-form-label">
                <span class="we-red">*</span>合同名称
            </label>
            <div class="layui-input-inline">
                <input type="text" id="name" name="name" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="createdate" class="layui-form-label">
                <span class="we-red">*</span>创建时间
            </label>
            <div class="layui-input-inline">
                <input type="text" id="createdate" name="createdate" required="" lay-verify="time"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="content" class="layui-form-label">
                <span class="we-red">*</span>合同内容
            </label>
            <div class="layui-input-inline">
                <textarea type="text"  id="content" name="content" required="" lay-verify="required"
                          autocomplete="off" class="layui-input">
                </textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="cid" class="layui-form-label">
                <span class="we-red">*</span>客户姓名
            </label>
            <div class="layui-input-inline">
                <select id="cid" name="cid" lay-verify="">
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="amount" class="layui-form-label">
                <span class="we-red">*</span>合同金额
            </label>
            <div class="layui-input-inline">
                <input type="text" id="amount" name="amount" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="empid" class="layui-form-label">
                <span class="we-red">*</span>签约人姓名
            </label>
            <div class="layui-input-inline">
                <select id="empid" name="empid" lay-verify="">
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="remark" class="layui-form-label">
                <span class="we-red">*</span>备注
            </label>
            <div class="layui-input-inline">
                <input type="text" id="remark" name="remark" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">
            </label>
            <button  class="layui-btn" lay-filter="add" lay-submit="">
                添加
            </button>
        </div>
    </form>
</div>
<script src="../../lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">
    layui.extend({
        admin: '{/}../../static/js/admin'
    });
    layui.use(['form','layer','admin'], function(){
        var form = layui.form,
            admin = layui.admin,
            layer = layui.layer,
            $ = layui.jquery;

        form.verify({
            required: [/[\S]+/, "必填项不能为空"],
            number: function(e) {
                if (!e || isNaN(e)) return "只能填写数字"
            },
            time: [/^(\d{4})[-\/](\d{1}|0\d{1}|1[0-2])([-\/](\d{1}|0\d{1}|[1-2][0-9]|3[0-1]))*$/, "日期格式不正确"],
        });


        $.post("/employee/all",function (data) {
            for (var i = 0; i < data.length; i++) {
                $("#empid").append('<option value = " '+data[i].id+' ">'+data[i].empname+'</option>');
            }
            $("#empid").val($("#employeename").val());
            form.render();
            console.log(data);

        })

        $.post("/customer/all",function (data) {
            for (var i = 0; i < data.length; i++) {
                $("#cid").append('<option value=" '+data[i].id+'">'+data[i].department+'-'+data[i].name+'</option>');
            }
            $("#cid").val($("#customername").val());
            form.render();
            console.log(data);

        })
        //监听提交
        form.on('submit(add)', function(data){
            console.log(data);
            console.log(JSON.stringify(data));
            $.ajax({
                url:"/contract",
                method:"post",
                data: data.field,
                dataType:"json",
                success:function (data) {
                    console.log(data);
                    if(data === 1){
                        layer.alert("增加成功", {icon: 6},function () {
                            // 获得frame索引
                            var index = parent.layer.getFrameIndex(window.name);
                            parent.location.reload();
                            //关闭当前frame
                            parent.layer.close(index);
                        });
                    }else if(data === 0){
                        layer.alert("增加失败", {icon: 6},function () {
                            // 获得frame索引
                            var index = parent.layer.getFrameIndex(window.name);
                            //关闭当前frame
                            parent.layer.close(index);
                        });
                    }
                },
                error:function () {
                    alert("fcghvhbj")
                }
            });
            return false;
        });
    });
</script>
</body>

</html>