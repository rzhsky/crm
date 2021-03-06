<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>欢迎页面-CRM后台管理系统</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
		<link rel="stylesheet" href="../static/css/font.css">
		<link rel="stylesheet" href="../static/css/weadmin.css">


	</head>

	<body>
		<div class="weadmin-body">
			<blockquote class="layui-elem-quote">欢迎使用CRM管理系统</blockquote>

			<div class="layui-col-lg12 layui-collapse" style="border: none;">
				<div class="layui-col-lg6 layui-col-md12">
					<!--统计信息展示-->
					<fieldset class="layui-elem-field" style="padding: 5px;">
						<!--公告-->
						<div class="layui-card">
							<div class="layui-card-header layui-elem-quote" >公告</div>

							<div class="layui-card-body" >
								<div class="layui-carousel weadmin-notice" lay-filter="notice" lay-indicator="inside" lay-arrow="none" style="width: 100%">
									<div carousel-item="" >
										<div class="" >
											<a href="javascript:;" target="_blank" class="layui-bg-red" >2019年7月25日 客户信息更新</a>
										</div>
										<div class="" >
											<a href="javascript:;" target="_blank" class="layui-bg-blue">
												今日考勤情况：</br>
												张三迟到</br>
												王小花迟到</br>
											</a>
										</div>
										<div class="">
											<a href="javascript:;" target="_blank" class="layui-bg-green">客户提醒事项</a>
										</div>
									</div>
								</div>

							</div>
						</div>

					</fieldset>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript" src="../lib/layui/layui.js" charset="utf-8"></script>
	<script type="text/javascript">
		layui.extend({
			admin: '{/}../static/js/admin',
		});
		layui.use(['jquery', 'element','util', 'admin', 'carousel'], function() {
			var element = layui.element,
				$ = layui.jquery,
				carousel = layui.carousel,
				util = layui.util,
				admin = layui.admin;
			/*//建造实例
			carousel.render({
				elem: '.weadmin-shortcut'
				,width: '100%' //设置容器宽度
				,arrow: 'none' //始终显示箭头	
				,trigger: 'hover'
				,autoplay:false
			});*/
			
			carousel.render({
				elem: '.weadmin-notice'
				,width: '100%' //设置容器宽度
				,height:'100%'
				,arrow: 'none' //始终显示箭头	
				,trigger: 'hover'
				,autoplay:true
			});
			
			$(function(){
				setTimeAgo(2018,0,1,13,14,0,'#firstTime');
				setTimeAgo(2018,2,28,16,0,0,'#lastTime');
			});
			function setTimeAgo(y, M, d, H, m, s,id){
			    var str = util.timeAgo(new Date(y, M||0, d||1, H||0, m||0, s||0));
			    $(id).html(str);
			    console.log(str);
			 };
		});
	</script>

</html>