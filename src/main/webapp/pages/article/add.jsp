<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<!--
	作者：github.com/WangEn
	时间：2018-02-02
	描述：添加文章类别
-->  
  <head>
    <meta charset="UTF-8">
    <title>添加分类-WeAdmin Frame型后台管理系统-WeAdmin 1.0</title>
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
              <label for="categoryWeight" class="layui-form-label">栏目权重</label>
              <div class="layui-input-inline">
                  <input type="text" id="weight" name="weight" autocomplete="off" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="categoryName" class="layui-form-label">栏目名称</label>
              <div class="layui-input-inline">
                  <input type="text" id="categoryName" name="categoryName" autocomplete="off" class="layui-input">
              </div>
          </div>


          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="we-red">*</span>父级栏目
              </label>
              <div class="layui-input-inline">
                  <select name="contrller">
                    <option>支付方式</option>
                    <option>支付宝</option>
                    <option>微信</option>
                    <option>货到付款</option>
                  </select>
              </div>
          </div>
      </form>
    </div>
	<script src="../../lib/layui/layui.js" charset="utf-8"></script>
    <script>
        layui.use(['form','layer'], function(){
          	var form = layui.form,
          		layer = layui.layer;

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