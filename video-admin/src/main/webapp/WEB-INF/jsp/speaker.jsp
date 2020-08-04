<%--
  Created by IntelliJ IDEA.
  User: 唯源
  Date: 2020/7/31
  Time: 14:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>主讲人管理</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script src="layui/layui.all.js"></script>
    <link rel="stylesheet" href="layui/css/layui.css">
    <style type="text/css">
        th {
            text-align: center;
        }
    </style>
</head>
<body>
<div class="layui-row" style="padding-top: 15px;padding-bottom: 15px; background-color: #d2d2d2;">
    <div class="container">
        <h2>主讲人管理</h2>
    </div>
</div>

<%--新增--%>
<div class="layui-form">
    <div class="layui-form-item">
        <div class="layui-inline">
            <div class="layui-input-inline">
                <button class="layui-btn layui-btn-radius layui-btn-normal" lay-submit lay-filter="insertSpeaker">添加</button>
            </div>
        </div>
    </div>
</div>

<table id="speakerTable" lay-filter="speakerTable"></table>
<script type="text/html" id="updateSpeaker">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
</script>
<script type="text/html" id="deleteSpeaker">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/html" id="showSpeakerImg">
    <img src="{{d.speakerImgUrl}}" style="height: 25px"/>
</script>
<%--编辑（弹出层）--%>
<script id="layerUpdateSpeaker" type="text/html">
    <form class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">编号：</label>
            <div class="layui-input-inline">
                <input type="text" name="id" id="id" autocomplete="off" readonly class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">名称：</label>
            <div class="layui-input-inline">
                <input type="text" name="speakerName" id="speakerName" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">头像：</label>
            <div class="layui-input-inline">
                <input type="text" name="speakerImgUrl" id="speakerImgUrl" autocomplete="off" class="layui-input layui-textarea">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">职位：</label>
            <div class="layui-input-inline">
                <input type="text" name="speakerJob" id="speakerJob" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">简介：</label>
            <div class="layui-input-inline">
                <input type="text" name="speakerDesc" id="speakerDesc" autocomplete="off" class="layui-input">
            </div>
        </div>
    </form>
</script>

<%--新增弹出层--%>
<script id="layerInsertSpeaker" type="text/html">
    <form class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">名称：</label>
            <div class="layui-input-inline">
                <input type="text" name="speakerName" id="insertSpeakerName" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-inline">
                <button type="button" class="layui-btn" id="insertChooseImg">
                    <i class="layui-icon">&#xe67c;</i>选择头像
                </button>
                <input type="hidden" name="speakerImgUrl" id="insertSpeakerImgUrl" autocomplete="off">
            </div>
            <div><img src="" id="insertImg"></div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">职位：</label>
            <div class="layui-input-inline">
                <input type="text" name="speakerJob" id="insertSpeakerJob" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">简介：</label>
            <div class="layui-input-inline">
                <input type="text" name="speakerDesc" id="insertSpeakerDesc" autocomplete="off" class="layui-input">
            </div>
        </div>
    </form>
</script>

</body>

<%--新增--%>
<script>
    layui.use(['form','table','upload','layer'],function () {
        var form = layui.form;
        var table = layui.table;
        var upload = layui.upload;
        var layer = layui.layer;

        // 新增
        form.on('submit(insertSpeaker)',function () {
            layer.open({
                type: 1
                ,content: $('#layerInsertSpeaker').html()
                ,id:'layerInsertSpeakerLayer'
                ,area: ['800px', '600px']
                ,success: function(layero, index){
                    // 上传图片
                    upload.render({
                        elem: '#insertChooseImg' //绑定元素
                        , url: 'fileUpload' //上传接口
                        , accept: "images"
                        , done: function (res) {
                            console.log(res.urlPath);
                            $("#insertSpeakerImgUrl").val(res.urlPath);
                            console.log($("#insertSpeakerImgUrl").val());
                            $("#insertImg").attr("src", res.urlPath);
                            form.render();
                        }
                        ,error: function(){
                            //请求异常回调
                        }
                    });
                    form.render();
                }
                ,btn: ['提交', '取消']
                ,btn1: function(index, layero){
                    $.ajax({
                        type: "post"
                        ,dataType: "json"
                        ,url: "insertSpeaker"
                        ,data: {
                            "speakerName":$("#insertSpeakerName").val()
                            ,"speakerImgUrl":$("#insertSpeakerImgUrl").val()
                            ,"speakerJob":$("#insertSpeakerJob").val()
                            ,"speakerDesc":$("#insertSpeakerDesc").val()
                        }
                        ,success: function (res) {
                            if (0 == res) {
                                table.reload('tableSpeakerTool', {
                                    url : 'speakerList'
                                    ,page: {
                                        curr: 1 //重新从第 1 页开始
                                    }
                                    ,where: {}
                                }, 'data');
                            }
                        }
                    });
                    table.render();
                    layer.close(index);
                }
                ,btn2: function(index, layero){
                    layer.close(index);
                }
                ,cancel: function(){
                    layer.closeAll();
                }
            });
        });

    });
</script>

<script>
    layui.use(["table","form","element","layer"],function() {
        var table = layui.table;
        var form = layui.form;
        var element = layui.element;
        var layer = layui.layer;

        table.render({
            elem: '#speakerTable'
            ,id:"tableSpeakerTool"
            ,height: 312
            ,defaultToolbar: ['filter']
            ,url: 'speakerList' //数据接口
            ,page: true //开启分页
            ,parseData: function(res) { //res 即为原始返回的数据
                return {
                    "code": 0, //解析接口状态
                    "msg": res.msg, //解析提示文本
                    "count": res.count, //解析数据长度
                    "data": res.data //解析数据列表
                };
            }
            ,cols: [[ //表头
                {field: "numbers", type: "numbers", title: '序号', width:80, sort: true}
                ,{field: 'id', title: '编号', hide:'true'}
                ,{field: 'speakerName', title: '名称', width:80}
                ,{field: 'speakerImgUrl', title: '头像', width:150, templet:'#showSpeakerImg'}
                ,{field: 'speakerJob', title: '职位', width:150}
                ,{field: 'speakerDesc', title: '简介'}
                ,{field: 'updateSpeaker',title: '编辑', width:80, templet:'#updateSpeaker'}
                ,{field: 'deleteSpeaker',title: '删除', width:80, templet:'#deleteSpeaker'}
            ]]
            ,limit:5
            ,limits:[5,10]
            ,first:'首页'
            ,last:'尾页'
        });

        table.on('tool(speakerTable)',function (obj) {
            if (obj.event == "edit") {
                var data = obj.data;
                console.log(data);

                layer.open({
                    type: 1
                    ,content: $('#layerUpdateSpeaker').html()
                    ,id:'layerUpdateSpeakerLayer'
                    ,area: ['800px', '600px']
                    ,success: function(layero, index){
                        $("#id").val(data.id);
                        $("#speakerName").val(data.speakerName);
                        $("#speakerImgUrl").val(data.speakerImgUrl);
                        $("#speakerJob").val(data.speakerJob);
                        $("#speakerDesc").val(data.speakerDesc);
                    }
                    ,btn: ['提交', '取消']
                    ,btn1: function(index, layero){

                        $.ajax({
                            type: "post"
                            ,dataType: "json"
                            ,url: "layerUpdateSpeaker"
                            ,data: {
                                "id": $("#id").val()
                                ,"speakerName":$("#speakerName").val()
                                ,"speakerImgUrl":$("#speakerImgUrl").val()
                                ,"speakerJob":$("#speakerJob").val()
                                ,"speakerDesc":$("#speakerDesc").val()
                            }
                            ,success: function (res) {
                                if (res == 0) {
                                    table.reload('tableSpeakerTool', {
                                        url : 'speakerList'
                                        ,page: {
                                            curr: 1 //重新从第 1 页开始
                                        }
                                        ,where: {}
                                    }, 'data');
                                }
                            }
                        });
                        layer.close(index);
                    }
                    ,btn2: function(index, layero){
                        layer.close(index);
                    }
                    ,cancel: function(){
                        layer.closeAll();
                    }
                });
            } else if (obj.event == 'del') {
                var id = obj.data.id;
                layer.confirm('确定删除？', function(index){
                    obj.del();
                    $.ajax({
                        type: "post"
                        ,dataType: 'json'
                        ,url: 'deleteSpeakerById'
                        ,data: {id:id}
                        ,success: function (res) {
                            if (res == 0) {
                                console.log("del");
                                table.reload('tableSpeakerTool', {
                                    url: 'speakerList'
                                    ,where: {} //设定异步数据接口的额外参数
                                    //,height: 300
                                });
                            } else {
                                console.log(res);
                            }
                        }
                        ,error: function ( ) {
                            console.log("异常");
                        }
                    });
                    layer.close(index);
                });

            }
        })

    });
</script>
</html>
