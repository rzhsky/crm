<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>员工管理</title>
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
<div class="weadmin-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">人事管理</a>
        <a>
          <cite>员工管理</cite></a>
      </span>
    <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right"
       href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="weadmin-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 we-search layui-form-pane">
            <div class="layui-inline">
                <input id="s_name" class="layui-input" placeholder="姓名" name="empname">
            </div>

            <div class="layui-inline">
                <input id="s_phone" class="layui-input" placeholder="电话" name="phone">
            </div>
            <button class="layui-btn" lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>

    <table id="emp" lay-filter="test"></table>
</div>
<script src="../../lib/layui/layui.js" charset="utf-8"></script>
<script src="../../static/js/eleDel.js" type="text/javascript" charset="utf-8"></script>
<script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js" type="text/javascript" charset="utf-8"></script>

<script type="text/javascript">
    layui.use('table', function () {
        let table = layui.table,
            $ = layui.jquery,
            form = layui.form;

        //第一个实例
        table.render({
            elem: '#emp',
            height: 530,
            toolbar: '#toolbarDemo',
            url: '/emp/all', //数据接口
            cellMinWidth: 80,
            page: true,//开启分页
            cols: [[ //表头
                {type: 'checkbox', fixed: 'left'},
                {field: 'id', title: 'ID', sort: true},
                {field: 'empname', title: '姓名', sort: true},
                {field: 'sex', title: '性别', templet: '#sex'},
                {field: 'phone', title: '电话'},
                {field: 'addr', title: '地址'},
                {field: 'email', title: '邮箱'},
                {field: 'department', title: '部门', sort: true, templet: "#deptname"},
                {field: 'position', title: '职位', sort: true, templet: "#positionname"},
                {
                    field: 'operator',
                    title: '操作',
                    // toolbar: '<div><i class="layui-icon" lay-event="edit">&#xe642;</i><i onclick="employee_del(this)" class="layui-icon">&#xe640;</i></div>',
                    templet: '#operateTpl',
                    fixed: 'right'
                },
            ]]
        });

        window.delEmpAll = function (argument) {
            let data = tableCheck.getData();

            let checkStatus = table.checkStatus('emp');
            let ids = [];

            $(checkStatus.data).each(function (i, o) {
                ids.push(o.id);
            });

            if (ids.length < 1) {
                layer.confirm('确认要删除吗？' + data, function (index) {
                    //捉到所有被选中的，发异步进行删除
                    layer.msg('请选择要删除的信息', {
                        icon: 3
                    });
                });
            } else {
                layer.confirm('确认要删除吗？' + data, function (index) {
                    //捉到所有被选中的，发异步进行删除
                    $.get("/emp/batchdel", {"ids": ids.toString()}, function (data) {
                        if (data === '1') {
                            layer.msg('删除成功', {
                                icon: 1
                            });
                            table.reload('emp', {});
                        } else {
                            layer.msg('删除失败', {
                                icon: 2
                            });
                        }
                    })
                });
            }

            console.log("ids:" + ids);

        };

        window.employee_del = function (obj, id) {
            layer.confirm('确认要删除吗？', function (index) {
                //发异步删除数据
                let id = $(obj).parents("tr").children(":eq(1)").text();

                $.ajax({
                    url: "/emp/" + id,
                    method: "post",
                    data: {_method: "PUT", 'id': id},
                    success: function (data) {
                        if (data === '1') {
                            $(obj).parents("tr").remove();
                            layer.msg('已删除!', {
                                icon: 1,
                                time: 1000
                            });
                        } else {
                            layer.msg('删除失败!', {
                                icon: 2,
                                time: 1000
                            });
                        }
                    }
                });

            });
        };

        table.on('tool(test)', function (obj) {
            let data = obj.data;
            if (obj.event === 'edit') {
                Edit("编辑", "./edit-employee.jsp", data)
            }
        });

        form.on('submit(search)', function (obj) {
            let name = $("#s_name").val();
            let phone = $("#s_phone").val();
            // alert(JSON.stringify(obj.field));

            table.reload('emp', { //表格的id
                url: '/emp/search',
                where: obj.field
            });
            console.log(obj);
            console.log("name: " + name);
            console.log("phone: " + phone);
        });

        window.Edit = function (title, url, data, w, h) {
            if (title == null || title === '') {
                title = false;
            }
            if (url == null || url === '') {
                url = "404.jsp";
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
                    //向iframe页的id=house的元素传值  //参考 https://yq.aliyun.com/ziliao/133150
                    let body = layer.getChildFrame('body', index);
                    body.contents().find("#id").val(data.id);
                    body.contents().find("#dept").val(data.department.id);
                    body.contents().find("#position").val(data.position.id);

                    body.contents().find("#empname").val(data.empname);
                    body.contents().find("input:radio[value='" + data.sex + "']").attr('checked', 'true');//$("input:radio[value='rd2']").attr('checked','true');
                    body.contents().find("#phone").val(data.phone);
                    body.contents().find("#addr").val(data.addr);
                    body.contents().find("#email").val(data.email);
                },
                error: function (layero, index) {
                    alert("出现错误");
                },

                end: function () {
                    table.reload('emp', { //表格的id
                        url: '/emp/all'
                    });
                }
            });
        };

        window.Add = function (title, url, w, h) {
            if (title == null || title === '') {
                title = false;
            }
            if (url == null || url === '') {
                url = "404.jsp";
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
                end: function () {
                    table.reload('emp', { //表格的id
                        url: '/emp/all'
                    });
                }
            });
        }

        // window.emp_search = function () {
        //     let s_name = $("#s_name").val();
        //     let s_phone = $("#s_phone").val();
        //
        //     $.get("/emp/search", {
        //         "name": s_name,
        //         "phone": s_phone
        //     }, function (data) {
        //
        //     })
        // }

    });
</script>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-danger" onclick="delEmpAll()"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn" onclick="Add('添加员工','./add-employee.jsp')"><i class="layui-icon"></i>添加
        </button>
    </div>
</script>

<script type="text/html" id="operateTpl">
    <%--onclick="Edit(this)"--%>
    <a title="编辑" href="javascript:;" lay-event="edit">
        <i class="layui-icon">&#xe642;</i>
    </a>
    <a title="删除" onclick="employee_del(this)" href="javascript:;">
        <i class="layui-icon">&#xe640;</i>
    </a>
</script>


<script type="text/html" id="sex">
    {{#
    var fn = function(item){
    var str = '';

    if(item === 1) str = '男';
    else str = '女';
    return str;
    };
    }}
    <div>{{ fn(d.sex) }}</div>
</script>

<script type="text/html" id="deptname">
    {{#
    var fn = function(item){
    var str = '';

    str = item.deptname;
    return str;
    };
    }}
    <div>{{ fn(d.department) }}</div>
</script>

<script type="text/html" id="positionname">
    {{#
    var fn = function(item){
    var str = '';

    str = item.positionname;
    return str;
    };
    }}
    <div>{{ fn(d.position) }}</div>
</script>

<script type="text/html" id="operator">
    {{#
    var fn = function(){
    var str = '';

    return str;
    };
    }}
    <div>{{ fn() }}</div>
</script>

</body>

</html>