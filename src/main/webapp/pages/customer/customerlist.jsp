<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>客户列表</title>
		<meta name="renderer" content="webkit" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0" />
		<link rel="stylesheet" href="../../static/css/font.css" />
		<link rel="stylesheet" href="../../static/css/weadmin.css" />
		<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
		<!--[if lt IE 9]>
		  <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
		  <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
	</head>

	<body>
		<div class="weadmin-nav">
			<span class="layui-breadcrumb">
				<a href="javascript:;">首页</a> <a href="javascript:;">客户管理</a>
				<a href="javascript:;"> <cite>客户列表</cite></a>
			</span>
			<a class="layui-btn layui-btn-sm" style="margin-top:3px;float:right" href="javascript:location.replace(location.href);"
			 title="刷新">
				<i class="layui-icon layui-icon-refresh"></i>
				<!-- <i class="layui-icon" style="line-height:30px">&#x1002;</i> -->
			</a>
		</div>

		<%--<div class="weadmin-body">--%>
			<div class="layui-row">
				<form class="layui-form layui-col-md12 we-search">
					客户搜索：
					<div class="layui-inline">
						<input class="layui-input" placeholder="开始日" name="start" id="start" />
					</div>
					<div class="layui-inline">
						<input class="layui-input" placeholder="截止日" name="end" id="end" />
					</div>
					<div class="layui-inline">
						<input type="text" name="username" placeholder="请输入用户名" autocomplete="off" class="layui-input" />
					</div>
					<button class="layui-btn" lay-submit="" lay-filter="sreach">
						<i class="layui-icon layui-icon-search"></i>
					</button>
				</form>
			</div>
		<%--</div>--%>

		<table class="layui-hide" id="datas"></table>

		<script type="text/html" id="toolbarDemo">
			<div class="layui-btn-container">
				<button class="layui-btn layui-btn-danger" onclick="delAll()">
					<i class="layui-icon layui-icon-delete"></i>批量删除
				</button>
				<button class="layui-btn" onclick="WeAdminShow('添加用户','./add.jsp',600,400)">
					<i class="layui-icon layui-icon-add-circle-fine"></i>添加
				</button>
			</div>
		</script>

		<script type="text/html" id="barDemo">
			<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
			<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
		</script>

		<!--<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>-->
		<script src="../../lib/layui/layui.js" charset="utf-8"></script>
		<script src="../../static/js/eleDel.js" type="text/javascript" charset="utf-8"></script>


		<script>
            layui.use('table', function(){
                var table = layui.table;

                //展示已知数据
                table.render({
                    elem: '#datas'
                    ,toolbar: '#toolbarDemo'
					,url:'/customer/all'
					,title:'用户数据表'
                    ,cols: [[ //标题栏
						{type:'checkbox',fixed:'left'}
						,{field: 'id', title: 'ID', width: 80, sort: true,fixed:'left'}
                        ,{field: 'company', title: '公司', width: 120}
                        ,{field: 'name', title: '负责人',width:100}
                        ,{field: 'sex',
							title: '性别',
							templet:function (d) {
                            if (d.sex=='0'){
                                return '男'
							} else {
                                return '女'
							}
                            }
						}
                        ,{field: 'department', title: '部门',width:100}
                        ,{field: 'position', title: '职位',width:100}
                        ,{field: 'birthday', title: '生日',width:100}
                        ,{field: 'tel', title: '固话',width:100}
                        ,{field: 'email', title: '邮箱', minWidth: 150}
                        ,{field: 'qq', title: 'QQ', width: 120}
                        ,{field: 'mob', title: '电话', width: 120}
                        ,{field: 'address', title: '地址'}
                        ,{field: 'remark', title: '备注'}
                        ,{field: 'right', title: '操作', width:120,toolbar: '#barDemo',fixed: 'right'}
                    ]]
                    //,skin: 'line' //表格风格
                    ,even: true
                    ,page: true
                    //,limits: [5, 7, 10]
                    //,limit: 5 //每页默认显示的数量
                });
                //头工具栏事件
                table.on('toolbar(datas)', function(obj){
                    var checkStatus = table.checkStatus(obj.config.id);
                    switch(obj.event){
                        case 'getCheckData':
                            var data = checkStatus.data;
                            layer.alert(JSON.stringify(data));
                            break;
                        case 'getCheckLength':
                            var data = checkStatus.data;
                            layer.msg('选中了：'+ data.length + ' 个');
                            break;
                        case 'isAll':
                            layer.msg(checkStatus.isAll ? '全选': '未全选');
                            break;
                    };
                });

                //监听行工具事件
                table.on('tool(datas)', function(obj){
                    var data = obj.data;
                    //console.log(obj)
                    if(obj.event === 'del'){
                        layer.confirm('真的删除行么', function(index){
                            obj.del();
                            layer.close(index);
                        });
                    } else if(obj.event === 'edit'){
                        layer.prompt({
                            formType: 2
                            ,value: data.email
                        }, function(value, index){
                            obj.update({
                                email: value
                            });
                            layer.close(index);
                        });
                    }
                });
            });
		</script>
	</body>
</html>
