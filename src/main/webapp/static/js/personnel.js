layui.use(['layer', 'jquery', 'table'], function () {
    let table = layui.table;
    let $ = layui.jquery;
    window.Add = function (title, url, link, table_name, w, h) {
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
            // end: function () {
            //     table.reload(table_name, { //表格的id
            //         url: link
            //     });
            // }
        });
    };

    window.delChoose = function (table_name, url) {
        let checkStatus = table.checkStatus(table_name);
        let ids = [];

        $(checkStatus.data).each(function (i, o) {
            ids.push(o.id);
        });

        if (ids.length < 1) {
            layer.msg('请选择要删除的信息', {
                icon: 3
            });
        } else {
            layer.confirm('确认要删除吗？', function () {
                //捉到所有被选中的，发异步进行删除
                $.post(url, {"_method": "PUT", "ids": ids.toString()}, function (data) {
                    if (data === '1') {
                        layer.msg('删除成功', {
                            icon: 1
                        });
                        table.reload(table_name, {});
                    } else {
                        layer.msg('删除失败', {
                            icon: 2
                        });
                    }
                })
            });
        }
    };

    window.restoreChoose = function (table_name, url) {
        let checkStatus = table.checkStatus(table_name);
        let ids = [];

        $(checkStatus.data).each(function (i, o) {
            ids.push(o.id);
        });

        if (ids.length < 1) {
            layer.msg('请选择要恢复的信息', {
                icon: 3
            });
        } else {
            layer.confirm('确认要恢复吗？', function () {
                //捉到所有被选中的，发异步进行删除
                $.post(url, {"_method": "PUT", "ids": ids.toString()}, function (data) {
                    if (data === '1') {
                        layer.msg('恢复成功', {
                            icon: 1
                        });
                        table.reload(table_name, {});
                    } else {
                        layer.msg('恢复失败', {
                            icon: 2
                        });
                    }
                })
            });
        }
    };

    window.completely_delete_Choose = function (table_name, url) {
        let checkStatus = table.checkStatus(table_name);
        let ids = [];

        $(checkStatus.data).each(function (i, o) {
            ids.push(o.id);
        });

        if (ids.length < 1) {
            layer.msg('请选择要彻底删除的信息', {
                icon: 3
            });
        } else {
            layer.confirm('确认要彻底删除吗？', function () {
                //捉到所有被选中的，发异步进行删除
                $.post(url, {"_method": "DELETE", "ids": ids.toString()}, function (data) {
                    if (data === '1') {
                        layer.msg('删除成功', {
                            icon: 1
                        });
                        table.reload(table_name, {});
                    } else {
                        layer.msg('删除失败', {
                            icon: 2
                        });
                    }
                })
            });
        }
    };

    window.del = function (obj, url, table_name, link) {
        layer.confirm('确认要删除吗？', function (index) {
            //发异步删除数据
            let id = $(obj).parents("tr").children(":eq(1)").text();

            $.ajax({
                url: url + "/" + id,
                method: "post",
                data: {_method: "PUT"},
                success: function (data) {
                    if (data === '1') {
                        table.reload(table_name, { //表格的id
                            url: link
                        });
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

    window.completely_delete = function (obj, url, table_name, link) {
        layer.confirm('确认要彻底删除吗？', function (index) {
            //发异步删除数据
            let id = $(obj).parents("tr").children(":eq(1)").text();

            $.ajax({
                url: url + "/" + id,
                method: "post",
                data: {_method: "DELETE"},
                success: function (data) {
                    if (data === '1') {
                        table.reload(table_name, { //表格的id
                            url: link
                        });
                        layer.msg('已彻底删除!', {
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

    window.restore = function (obj, url, table_name, link) {
        layer.confirm('确认要恢复该数据吗？', function (index) {
            //发异步删除数据
            let id = $(obj).parents("tr").children(":eq(1)").text();

            $.ajax({
                url: url + "/" + id,
                method: "post",
                data: {_method: "PUT"},
                success: function (data) {
                    if (data === '1') {
                        table.reload(table_name, {
                            url: link
                        });
                        layer.msg('已恢复!', {
                            icon: 1,
                            time: 1000
                        });
                    } else {
                        layer.msg('恢复失败!', {
                            icon: 2,
                            time: 1000
                        });
                    }
                }
            });

        });
    };
});