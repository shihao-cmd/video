<%--
  Created by IntelliJ IDEA.
  User: 唯源
  Date: 2020/7/31
  Time: 14:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title></title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script src="layui/layui.all.js"></script>
    <link rel="stylesheet" href="layui/css/layui.css">
</head>

<body>
<div class="layui-fluid">
    <div class="layui-row">
        <div class="layui-col-xs8 layui-col-sm8 layui-col-md8">
            <ul class="layui-nav">
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        视频管理系统
                    </a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"  onclick="toOther('VideoLists')">
                        视频管理
                    </a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"  onclick="toOther('SpeakerLists')">
                        主讲人管理
                    </a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"  onclick="toOther('CourseLists')">
                        课程管理
                    </a>
                </li>
            </ul>
        </div>
        <div class="layui-nav layui-col-xs4 layui-col-sm4 layui-col-md4">
            <ul class="layui-nav">
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                        ${session.Admin.userName}
                    </a>
                </li>
                <li class="layui-nav-item"><a href="">退出</a></li>
            </ul>
        </div>
    </div>

    <div id="main">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">内容主体区域</div>
    </div>
</div>

<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });

    function toOther(url) {
        $("#main").load(url);
    }
</script>
<script type="text/javascript">
    window.onload=function(){
        $("#main").load('VideoLists');
    }
</script>
</body>
</html>