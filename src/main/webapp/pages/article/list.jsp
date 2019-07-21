<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>文章列表-WeAdmin Frame型后台管理系统-WeAdmin 1.0</title>
		<meta name="Description" content="基于layUI数据表格操作"/>
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
		<style type="text/css">
			.layui-form-switch {
				width: 55px;
			}			
			.layui-form-switch em {
				width: 40px;
			}
			body{overflow-y: scroll;}
		</style>
	</head>

	<body>
		<div class="weadmin-nav">
			<span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">文章管理</a>
        <a>
          <cite>文章列表</cite></a>
      </span>
			<a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
				<i class="layui-icon" style="line-height:30px">&#x1002;</i></a>
		</div>
		<div class="weadmin-body">
			<div class="layui-row">
				<form class="layui-form layui-col-md12 we-search">
					文章搜索：
					<div class="layui-input-inline">
						<select name="cateid">
							<option>请选择分类</option>
							<option>文章</option>
							<option>会员</option>
							<option>权限</option>
						</select>
					</div>
					<div class="layui-inline">
						<input class="layui-input" placeholder="开始日" name="start" id="start">
					</div>
					<div class="layui-inline">
						<input class="layui-input" placeholder="截止日" name="end" id="end">
					</div>
					<div class="layui-inline">
						<input type="text" name="keyword" placeholder="请输入关键字" autocomplete="off" class="layui-input">
					</div>
					<button class="layui-btn" lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
				</form>
			</div>
			<div class="weadmin-block demoTable">
				<button class="layui-btn layui-btn-danger" data-type="getCheckData"><i class="layui-icon">&#xe640;</i>批量删除</button>
				<button class="layui-btn" data-type="Recommend"><i class="layui-icon">&#xe6c6;</i>推荐</button>
				<button class="layui-btn" data-type="Top"><i class="layui-icon">&#xe619;</i>置顶</button>
				<button class="layui-btn" data-type="Review"><i class="layui-icon">&#xe6b2;</i>审核</button>
				<button class="layui-btn" onclick="WeAdminShow('添加用户','./add.jsp',600,400)"><i class="layui-icon">&#xe61f;</i>添加</button>
				<span class="fr" style="line-height:40px">共有数据：88 条</span>
			</div>
			<table class="layui-hide" id="articleList"></table>


			<script type="text/html" id="recommendTpl">
				<input type="checkbox" name="zzz" lay-skin="switch" lay-text="已推荐|未推荐" {{d.recommend}}>
			</script>
			<script type="text/html" id="topTpl">
				<input type="checkbox" name="show" lay-skin="switch" lay-text="已置顶|未置顶" {{d.top}}>
			</script>
			<script type="text/html" id="reviewTpl">
			  <!-- 这里的 checked 的状态只是演示 -->
			  <input type="checkbox" name="lock" value="{{d.id}}" title="锁定" lay-filter="lockDemo" {{ d.id == 1 ? 'checked' : '' }}>
			</script>

			<script type="text/html" id="operateTpl">
				<a title="编辑" onclick="WeAdminEdit('编辑','./edit.jsp', 2, 600, 400)" href="javascript:;">
					<i class="layui-icon">&#xe642;</i>
				</a>
				<a title="查看" onclick="WeAdminShow('查看文章','./show.html',600,400)" href="javascript:;">
					<i class="layui-icon">&#xe63c;</i>
				</a>
				<a title="删除" onclick="member_del(this,'要删除的id')" href="javascript:;">
					<i class="layui-icon">&#xe640;</i>
				</a>
			</script>
			<script src="../../lib/layui/layui.js" charset="utf-8"></script>
			<script src="../../static/js/list.js" type="text/javascript" charset="utf-8"></script>

		</div>
	</body>

</html>