<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>添加职务</title>
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
              <label for="positionname" class="layui-form-label">
                  <span class="we-red">*</span>职务名称
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="positionname" name="positionname" required="" lay-verify="required"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="level" class="layui-form-label">
                  <span class="we-red">*</span>职务等级
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="level" name="level" required="" lay-verify="required"
                  autocomplete="off" class="layui-input">
              </div>
          </div>

          <div class="layui-form-item">
              <button  class="layui-btn" lay-filter="add" lay-submit="">增加</button>
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
          	layer = layui.layer;
          	form.render();
          //自定义验证规则

          //监听提交
          form.on('submit(add)', function(data){
            console.log(data);
            //发异步，把数据提交给php
            layer.alert("增加成功", {icon: 6},function () {
                // 获得frame索引
                var index = parent.layer.getFrameIndex(window.name);
                //关闭当前frame
                parent.layer.close(index);
            });
            return false;
          });
        });
    </script>
  </body>

</html>