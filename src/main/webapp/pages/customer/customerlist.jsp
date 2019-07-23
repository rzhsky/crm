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

		<div class="weadmin-body">
			<div class="layui-row">
				<form class="layui-form layui-col-md12 we-search layui-form-pane">
					客户搜索：
					<div class="layui-inline">
						<input id="c_name" class="layui-input" placeholder="请输入负责人" name="name">
					</div>

					<div class="layui-inline">
						<input id="c_company" class="layui-input" placeholder="请输入公司名" name="company">
					</div>
					<button class="layui-btn" lay-submit="" lay-filter="search">
						<i class="layui-icon layui-icon-search"></i>
					</button>
				</form>
			</div>
		</div>

		<table class="layui-hide" id="datas"  lay-filter="cumtable"></table>

		<script type="text/html" id="toolbarDemo">
			<div class="layui-btn-container">
				<button class="layui-btn layui-btn-danger layui-btn-sm"  onclick="delAlls('datas','/customer/delAll')">
					<i class="layui-icon layui-icon-delete"></i>批量删除
				</button>
				<button class="layui-btn  layui-btn-sm"  onclick="Add('添加用户','./add-customer.jsp',600,400)">
					<i class="layui-icon layui-icon-add-circle-fine"></i>添加
				</button>
			</div>
		</script>

        <script type="text/html" id="barDemo">
            <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="deleteCum">删除</a>
        </script>

		<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
		<script src="../../lib/layui/layui.js" charset="utf-8"></script>
		<script src="../../static/js/eleDel.js" type="text/javascript" charset="utf-8"></script>


		<script>
            layui.use('table', function(){
                var table = layui.table;
                form = layui.form;
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
                    ,even: true
                    ,page: true
                });


                //监听提交搜索表单
                form.on('submit(search)', function(obj){
                    table.reload('datas', {
                        url: '/customer/searchcum',
                        where: obj.field
                    })
                    return false;
                });

                //监听行工具事件
                table.on('tool(cumtable)', function(obj){
                    var data = obj.data;
                    console.log(obj)
                    if(obj.event === 'deleteCum'){
                        layer.confirm('确认删除客户资料吗？', function(index){
                            layer.close(index);
                            //向服务器发送删除指令，获取后端
                            $.ajax({
                                url:"/customer/"+data.id,
                                method:'post',
                                data:{_method: "PUT",'id':data.id},
                                success:function (data) {
                                    if (data === '1') {
                                        obj.del();
                                        layer.msg('已删除!', {
                                            icon: 1,
                                            time: 1000
                                        });
                                    }else {
                                        layer.msg('删除失败!', {
                                            icon: 2,
                                            time: 1000
                                        });
                                    }
                                }
                            })
                        });
                    } else if(obj.event === 'edit'){
                        Edit("编辑", "./edit-customer.jsp", data)
                    }
                });
            });

            /**
			 * 修改客户信息
			 */
            window.Edit = function (title, url, data, w, h) {
                var table = layui.table;
                if (title == null || title === '') {
                    title = false;
                }
                if (url == null || url === '') {
                    url = "401.jsp";
                }
                if (w == null || w === '') {
                    w = ($(window).width() * 0.9);
                }
                if (h == null || h === '') {
                    h = ($(window).height() - 50);
                }
                layer.open({
                    type: 2,
                    area: [w + 'px', h + 'px'],
                    fix: false, //不固定
                    maxmin: true,
                    shadeClose: true,
                    shade: 0.4,
                    title: title,
                    content: url,
                    success: function (layero, index) {
                        let body = layer.getChildFrame('body', index);
                        console.log("1111"+body);
                        body.contents().find("#id").val(data.id);
                        body.contents().find("#name").val(data.name);
                        body.contents().find("input:radio[value='" + data.sex + "']").attr('checked', 'true');
                        body.contents().find("#company").val(data.company);
                        body.contents().find("#department").val(data.department);
                        body.contents().find("#position").val(data.position);
                        body.contents().find("#birthday").val(data.birthday);
                        body.contents().find("#tel").val(data.tel);
                        body.contents().find("#email").val(data.email);
                        body.contents().find("#qq").val(data.email);
                        body.contents().find("#mob").val(data.mob);
                        body.contents().find("#address").val(data.address);
                        body.contents().find("#remark").val(data.remark);
                    },
                    error: function (layero, index) {
                        alert("出现错误");
                    },
                    end: function () {
                        table.reload('datas', { //表格的id
                            url: '/customer/all'
                        });
                    }
                });
            };
            /**
             * 添加客户
             * @param title
             * @param url
             * @param w
             * @param h
             */
            window.Add = function(title, url, w, h) {
                var table = layui.table;
                if(title == null || title == '') {
                    title = false;
                };
                if(url == null || url == '') {
                    url = "401.jsp";
                };
                if(w == null || w == '') {
                    w = ($(window).width() * 0.9);
                };
                if(h == null || h == '') {
                    h = ($(window).height() - 50);
                };
                layer.open({
                    type: 2,
                    area: [w + 'px', h + 'px'],
                    fix: false, //不固定
                    maxmin: true,
                    shadeClose: true,
                    shade: 0.4,
                    title: title,
                    content: url,
                    end:function () {
                        table.reload('datas',{
                            url:'/customer/all'
                        });
                    }
                });
            }

            /**
             * 批量删除
             */
            window.delAlls = function (tablename,url) {
                var table = layui.table;
                let data = tableCheck.getData();
                let checkStatus=table.checkStatus(tablename);
                let ids=[];

                $(checkStatus.data).each(function (i, o) {
                    ids.push(o.id);
                });
                console.log(ids.length);
                if (ids.length < 1) {
                    layer.msg('请选择要删除的信息', {
                        icon: 3
                    });
                }else{
                    layer.confirm('确认要删除吗？', function() {
                        $.post(url,{_method: "PUT",'ids':ids.toString()},function (data) {
                            //pu捉到所有被选中的，发异步进行删除
                            if (data === '1') {

                                layer.msg('删除成功!', {
                                    icon: 1,
                                    time: 1000
                                });
                                table.reload(tablename, {});
                            }else {
                                layer.msg('删除失败!', {
                                    icon: 2,
                                    time: 1000
                                });
                            }
                        })
                    });
                }
            }

		</script>
	</body>
</html>
