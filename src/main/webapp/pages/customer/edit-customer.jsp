<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>编辑页面</title>
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

		<div class="layui-form-item">
			<div class="layui-input-inline">
				<input type="hidden" id="id" name="id" required=""
					   autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label for="company" class="layui-form-label">
				<span class="we-red">*</span>公司
			</label>
			<div class="layui-input-inline">
				<input type="text" id="company" name="company" required="" lay-verify="required"
					   autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label for="name" class="layui-form-label">
				<span class="we-red">*</span>负责人
			</label>
			<div class="layui-input-inline">
				<input type="text" id="name" name="name" required="" lay-verify="required"
					   autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">
				<span class="we-red">*</span>性别
			</label>
			<div class="layui-input-inline">
				<input type="radio" name="sex" value="1" title="男" checked>
				<input type="radio" name="sex" value="0" title="女">
			</div>
		</div>

		<div class="layui-form-item">
			<label for="department" class="layui-form-label">
				<span class="we-red">*</span>部门
			</label>
			<div class="layui-input-inline">
				<input type="text" id="department" name="department" required="" lay-verify="required"
					   autocomplete="off" class="layui-input">
			</div>
		</div>

		<div class="layui-form-item">
			<label for="position" class="layui-form-label">
				<span class="we-red">*</span>职位
			</label>
			<div class="layui-input-inline">
				<input type="text" id="position" name="position" required="" lay-verify="required"
					   autocomplete="off" class="layui-input">
			</div>
		</div>

		<div class="layui-form-item">
			<label for="birthday" class="layui-form-label">
				<span class="we-red">*</span>生日
			</label>

			<div class="layui-input-inline">
				<input type="text" id="birthday" name="birthday" required="" lay-verify="required"
					   autocomplete="off" class="layui-input">
			</div>
		</div>

		<div class="layui-form-item">
			<label for="tel" class="layui-form-label">
				<span class="we-red">*</span>固话
			</label>
			<div class="layui-input-inline">
				<div class="layui-input-inline">
					<input type="text" id="tel" name="tel" required="" lay-verify="required"
						   autocomplete="off" class="layui-input">
				</div>
			</div>
		</div>

		<div class="layui-form-item">
			<label for="email" class="layui-form-label">
				<span class="we-red">*</span>邮箱
			</label>
			<div class="layui-input-inline">
				<input type="text" id="email" name="email" required="" lay-verify="required"
					   autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
		<label for="qq" class="layui-form-label">
			<span class="we-red">*</span>QQ
		</label>
		<div class="layui-input-inline">
			<input type="text" id="qq" name="qq" required="" lay-verify="required"
				   autocomplete="off" class="layui-input">
		</div>
	    </div>
		<div class="layui-form-item">
			<label for="mob" class="layui-form-label">
				<span class="we-red">*</span>电话
			</label>
			<div class="layui-input-inline">
				<input type="text" id="mob" name="mob" required="" lay-verify="required"
					   autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label for="address" class="layui-form-label">
				<span class="we-red">*</span>地址
			</label>
			<div class="layui-input-inline">
				<input type="text" id="address" name="address" required="" lay-verify="required"
					   autocomplete="off" class="layui-input">
			</div>
		</div>

		<div class="layui-form-item">
			<label for="remark" class="layui-form-label">
				<span class="we-red">*</span>备注
			</label>
			<div class="layui-input-inline">
				<textarea type="text" id="remark" name="remark" required="" lay-verify="required"
						  autocomplete="off" class="layui-input"></textarea>
			</div>
		</div>
		<div class="layui-form-item">
			<label for="remark" class="layui-form-label">
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
        //监听提交
        form.on('submit(update)', function (data) {
            console.log(data);
            $.ajax({
                url: "/customer/update",
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