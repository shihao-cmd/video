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
    <title>课程管理</title>
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
        <h2>课程管理</h2>
    </div>
</div>

<%--新增--%>
<div class="layui-form">
    <div class="layui-form-item">
        <div class="layui-inline">
            <div class="layui-input-inline">
                <button class="layui-btn layui-btn-radius layui-btn-normal" lay-submit lay-filter="insertCourse">添加</button>
            </div>
        </div>
    </div>
</div>

<table id="courseTable" lay-filter="courseTable"></table>
<script type="text/html" id="updateCourse">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
</script>
<script type="text/html" id="deleteCourse">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<%--编辑（弹出层）--%>
<script id="layerUpdateCourse" type="text/html">
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
                <input type="text" name="courseTitle" id="courseTitle" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">课程：</label>
            <div class="layui-input-inline">
                <select name="subjectSelect" lay-filter="subjectSelect" id="subjectSelect">

                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">简介：</label>
            <div class="layui-input-inline">
                <input type="text" name="courseDesc" id="courseDesc" autocomplete="off" class="layui-textarea">
            </div>
        </div>
    </form>
</script>

<%--新增弹出层--%>
<script id="layerInsertCourse" type="text/html">
    <form class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">名称：</label>
            <div class="layui-input-inline">
                <input type="text" name="insertCourseTitle" id="insertCourseTitle" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">课程：</label>
            <div class="layui-input-inline">
                <select name="insertSubjectSelect" lay-filter="insertSubjectSelect" id="insertSubjectSelect">

                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">简介：</label>
            <div class="layui-input-inline">
                <input type="text" name="insertCourseDesc" id="insertCourseDesc" autocomplete="off" class="layui-textarea">
            </div>
        </div>
    </form>
</script>

</body>

<%--新增--%>
<script>
    var insertSubjectSelect;
    layui.use(['form','table','upload','layer'],function () {
        var form = layui.form;
        var table = layui.table;
        var upload = layui.upload;
        var layer = layui.layer;

        // 新增
        form.on('submit(insertCourse)',function () {
            layer.open({
                type: 1
                ,content: $('#layerInsertCourse').html()
                ,area: ['800px', '600px']
                ,btn: ['提交', '取消']
                ,id:'layerInsertCourseLayer'
                ,success: function(layero, index){
                    <c:forEach items="${sessionScope.Subject}" var="subject">
                        <%--document.getElementById("insertSubjectSelect").append('<option value="' + ${subject.id} + '">' + '${subject.subjectName}' + '</option>');--%>
                        $("#insertSubjectSelect").append('<option value="' + ${subject.id} + '">' + '${subject.subjectName}' + '</option>');
                    </c:forEach>
                    form.render();
                    form.on('select(insertSubjectSelect)', function(data){
                        insertSubjectSelect = data.value;
                        form.render("select");
                        console.log(insertSubjectSelect);
                    });
                }
                ,btn1: function(index, layero){
                    $.ajax({
                        type: "post"
                        ,dataType: "json"
                        ,url: "insertCourse"
                        ,data: {
                            "courseTitle": $("#insertCourseTitle").val()
                            ,"subjectId": insertSubjectSelect
                            ,"courseDesc": $("#insertCourseDesc").val()

                        }
                        ,success: function (res) {
                            if (0 == res) {
                                table.reload('tableCourseTool', {
                                    url : 'courseList'
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
    var chooseUpdateCourseId = 0;
    layui.use(["table","form","element","layer"],function() {
        var table = layui.table;
        var form = layui.form;
        var element = layui.element;
        var layer = layui.layer;

        table.render({
            elem: '#courseTable'
            ,id:"tableCourseTool"
            ,height: 312
            ,defaultToolbar: ['filter']
            ,url: 'courseList' //数据接口
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
                ,{field: 'courseTitle', title: '名称', width:80}
                ,{field: 'subjectName', title: '课程', width:150,templet:function (res) {
                        return res.subject.subjectName;
                    }}
                ,{field: 'courseDesc', title: '简介'}
                ,{field: 'updateCourse',title: '编辑', width:80, templet:'#updateCourse'}
                ,{field: 'deleteCourse',title: '删除', width:80, templet:'#deleteCourse'}
            ]]
            ,limit:5
            ,limits:[5,10]
            ,first:'首页'
            ,last:'尾页'
        });

        table.on('tool(courseTable)',function (obj) {
            if (obj.event == "edit") {
                var data = obj.data;
                console.log(data);

                layer.open({
                    type: 1
                    ,content: $('#layerUpdateCourse').html()
                    ,id:'layerUpdateCourseLayer'
                    ,area: ['800px', '600px']
                    ,success: function(layero, index){
                        $("#id").val(data.id);
                        $("#courseTitle").val(data.courseTitle);
                        $("#courseDesc").val(data.courseDesc);
                        console.log(data.subject.subjectName);
                        <c:forEach items="${sessionScope.Subject}" var="subject">
                            <%--document.getElementById("subjectSelect").append('<option value="' + ${subject.id} + '">' + '${subject.subjectName}' + '</option>');--%>
                            $("#subjectSelect").append('<option value="' + ${subject.id} + '">' + '${subject.subjectName}' + '</option>');
                        </c:forEach>
                            // document.getElementById("subjectSelect").find("option[value="+data.subject.subjectName+"]").prop("selected",true);
                            $("#subjectSelect").find("option[value="+ data.subject.subjectName +"]").prop("selected",true);
                        form.render("select");
                        form.on('select(subjectSelect)', function(data){
                            chooseUpdateCourseId = data.value;
                            console.log(data.value); //复选框value值，也可以通过data.elem.value得到
                            form.render("select");
                        });
                    }
                    ,btn: ['提交', '取消']
                    ,btn1: function(index, layero){

                        $.ajax({
                            type: "post"
                            ,dataType: "json"
                            ,url: "layerUpdateCourse"
                            ,data: {
                                "id": $("#id").val()
                                ,"courseTitle":$("#courseTitle").val()
                                ,"subjectId":chooseUpdateCourseId
                                ,"courseDesc":$("#courseDesc").val()
                            }
                            ,success: function (res) {
                                if (res == 0) {
                                    table.reload('tableCourseTool', {
                                        url : 'courseList'
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
                        ,url: 'deleteCourseById'
                        ,data: {id:id}
                        ,success: function (res) {
                            if (res == 0) {
                                console.log("del");
                                table.reload('tableCourseTool', {
                                    url: 'courseList'
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
