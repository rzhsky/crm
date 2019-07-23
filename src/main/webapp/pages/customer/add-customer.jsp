<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>添加客户</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
		<link rel="stylesheet" href="../../static/css/font.css">
		<link rel="stylesheet" href="../../static/css/weadmin.css">
	</head>

	<body>
		<div class="weadmin-body">
			<form class="layui-form">
				<div class="layui-form-item">
					<label for="L_company" class="layui-form-label">
		                <span class="we-red">*</span>公司
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="L_company" name="company" lay-verify="required|company" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label for="L_name" class="layui-form-label">
						<span class="we-red">*</span>负责人
					</label>
					<div class="layui-input-inline">
						<input type="text" id="L_name" name="name" lay-verify="required|name" autocomplete="" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
				    <label for="L_sex" class="layui-form-label">性别</label>
				    <div class="layui-input-block" id="L_sex">
				      <input type="radio" name="sex" value="0" title="男" checked>
				      <input type="radio" name="sex" value="1" title="女">
				    </div>
				</div>
				<div class="layui-form-item">
					<label for="L_department" class="layui-form-label">
						<span class="we-red">*</span>部门
					</label>
					<div class="layui-input-inline">
						<input type="text" id="L_department" name="department" lay-verify="required|department" autocomplete="" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label for="L_position" class="layui-form-label">
		                <span class="we-red">*</span>职位
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="L_position" name="position" lay-verify="required|position" autocomplete="" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label for="L_birthday" class="layui-form-label">
		                <span class="we-red">*</span>生日
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="L_birthday" name="birthday" lay-verify="required|birthday"  autocomplete="" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label for="L_tel" class="layui-form-label">
						<span class="we-red">*</span>固话
					</label>
					<div class="layui-input-inline">
						<input type="text" id="L_tel" name="tel" lay-verify="required|tel"  autocomplete="" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label for="L_email" class="layui-form-label">
						<span class="we-red">*</span>邮箱
					</label>
					<div class="layui-input-inline">
						<input type="text" id="L_email" name="email" lay-verify="required|email"  autocomplete="" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label for="L_qq" class="layui-form-label">
						<span class="we-red">*</span>QQ
					</label>
					<div class="layui-input-inline">
						<input type="text" id="L_qq" name="qq" lay-verify="required|qq"  autocomplete="" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label for="L_mob" class="layui-form-label">
						<span class="we-red">*</span>电话
					</label>
					<div class="layui-input-inline">
						<input type="text" id="L_mob" name="mob" lay-verify="required|mob"  autocomplete="" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label for="L_address" class="layui-form-label">
						<span class="we-red">*</span>地址
					</label>
					<div class="layui-input-inline">
						<input type="text" id="L_address" name="address" lay-verify="required|address"  autocomplete="" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label for="L_remark" class="layui-form-label">
						<span class="we-red">*</span>备注
					</label>
					<div class="layui-input-inline">
						<input type="text" id="L_remark" name="remark" lay-verify="required|remark"  autocomplete="" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label for="L_remark" class="layui-form-label">
					</label>
					<button class="layui-btn" lay-filter="add" lay-submit="">确定</button>
				</div>
			</form>
		</div>
		<script src="../../lib/layui/layui.js" charset="utf-8"></script>
		
		<script>
			layui.extend({
				admin: '{/}../../static/js/admin'
			});
			layui.use(['form', 'jquery','util','admin', 'layer'], function() {
				var form = layui.form,
					$ = layui.jquery,
					util = layui.util,
					admin = layui.admin,
					layer = layui.layer;
				form.render()//表单数据渲染
				//自定义验证规则
				form.verify({
                    mob: function(value) {
						if(value.length !=11) {
							return '电话号码必须11位';
						}
					},
                    birthday: [/^[(\u4e00-\u9fa5)|(0-9)]+$/, '生日格式为xx月xx日']
				});


				//失去焦点时判断值为空不验证，一旦填写必须验证
				$('input[name="email"]').blur(function(){
					//这里是失去焦点时的事件
					if($('input[name="email"]').val()){
						$('input[name="email"]').attr('lay-verify','email');
					}else{
						$('input[name="email"]').removeAttr('lay-verify');
					}
				});

				//监听提交
				form.on('submit(add)', function(data) {
					console.log(data.field);
					var f = data.field;
					console.log(f.name);
					console.log(f.sex);
					//var sex = $('input:radio[name="sex"]:checked').val();

					$.ajax({
						url:'/customer/add',
						method:'post',
						dataType:'json',
						data:data.field,
						success:function (data) {
							console.log(data)
							if(data==1){
							    layer.alert("添加成功",{icon:6},function () {
                                    let index = parent.layer.getFrameIndex(window.name);
                                    parent.layer.close(index);
                                })
							}else {
                                layer.alert("添加失败",{icon:6},function () {
                                    let index = parent.layer.getFrameIndex(window.name);
                                    parent.layer.close(index);
								})
							}
                        }
					})
					return false;
				});

			});
		</script>
	</body>

</html>