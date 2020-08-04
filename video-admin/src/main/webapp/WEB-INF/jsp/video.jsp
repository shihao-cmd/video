<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>视频管理</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script src="layui/layui.all.js"></script>
    <link rel="stylesheet" href="layui/css/layui.css">

    <style type="text/css">
        th {
            text-align: center;
        }
    </style>
    <%--<script type="text/javascript">
        function showAddPage() {
            location.href = "${pageContext.request.contextPath}/video/addVideo";
        }

        $(function () {
            console.log("测试");
            $("#btn").click(function () {
                if (deleteNum > 0) {

                    Confirm.show('溫馨提示', '您確定要刪除这' + deleteNum + '条记录嗎？', {
                        'Delete': {
                            'primary': true,
                            'callback': function () {
                                //不是ajax，模拟提交
                                $("#form2").submit();
                                //如果是一个正常表单的提交，按钮必须是type=submit,并且必须在form表单里面
                            }
                        }
                    });

                } else {
                    alert("您暂未选择任何数据，请选择您要删除的数据！");
                }

            });

        });

        function delVideoById(obj, id, name) {

            Confirm.show('溫馨提示', '您確定要刪除' + name + '嗎？', {
                'Delete': {
                    'primary': true,
                    'callback': function () {
                        //此处需要调用ajax
                        var params = {
                            "id": id
                        };
                        $.post("${pageContext.request.contextPath}/video/videoDel", params, function (data) {
                            if (data == 'success') {
                                Confirm.show('处理结果', '恭喜您删除成功');
                                //请用js删除掉那条记录
                                $(obj).parent().parent().remove();
                            } else {
                                Confirm.show('处理结果', '操作失败');
                            }
                        });

                    }
                }
            });

            //阻止事件默认行为   a  href  onclick
            //先执行onclick  后跳转
            return false;
        }

        var deleteNum = 0;

        function selectAll(obj) {
            //dom  jquery
            var value = obj.checked;
            //alert(value);
            var arr = document.getElementsByName("ids");
            for (var i = 0; i < arr.length; i++) {
                arr[i].checked = value;
            }
            if (value) {
                deleteNum = arr.length;
            } else {
                deleteNum = 0;
            }

            $("#delNum").text(deleteNum);

        }

        function selectOne(obj) {
            if (obj.checked) {
                deleteNum += 1;
            } else {
                deleteNum -= 1;
            }

            if (deleteNum == 0) {
                document.getElementById("checkAllId").checked = false;
            }

            var arr = document.getElementsByName("ids");
            if (deleteNum == arr.length) {
                document.getElementById("checkAllId").checked = true;
            }

            $("#delNum").text(deleteNum);
        }

    </script>--%>
</head>
<body>
<div class="layui-row" style="padding-top: 15px;padding-bottom: 15px; background-color: #d2d2d2;">
    <div class="container">
        <h2>视频管理</h2>
    </div>
</div>

<div class="layui-form">
    <div class="layui-form-item">
        <div class="layui-inline">
            <div class="layui-input-inline">
                <button class="layui-btn layui-btn-radius layui-btn-normal" lay-submit lay-filter="insertVideo">添加</button>
                <button class="layui-btn" lay-submit lay-filter="delVideoByIds">批量删除</button>
            </div>
        </div>
        <div class="layui-inline">
            <div class="layui-input-inline">
                <input id="videoTitle" class="layui-input" type="text" name="title" placeholder="名称" autocomplete="off" value="${QueryVo.title}">
            </div>
            <div class="layui-input-inline">
                <select name="speakerId" id="chooseSpeaker" lay-filter="chooseSpeaker">
                    <option value="">全部老师</option>
                </select>
            </div>
            <div class="layui-input-inline">
                <select name="courseId" id="chooseCourse" lay-filter="chooseCourse">
                    <option value="">全部课程</option>
                </select>
            </div>
            <div class="layui-inline">
                <button class="layui-btn" lay-submit lay-filter="search">查询</button>
            </div>
        </div>
    </div>
</div>

<table id="speakerTable" lay-filter="speakerTable"></table>

<%--编辑（弹出层）--%>
<script id="layerUpdateVideo" type="text/html">
    <form class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">编号：</label>
            <div class="layui-input-inline">
                <input type="text" name="id" id="id" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">名称：</label>
            <div class="layui-input-inline">
                <input type="text" name="title" id="title" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">介绍：</label>
            <div class="layui-input-inline">
                <input type="text" name="detail" id="detail" autocomplete="off" class="layui-input layui-textarea">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">讲师：</label>
            <div class="layui-input-inline">
<%--                    <input type="text" name="speaker" id="speaker" autocomplete="off" class="layui-input">--%>
                <select name="speakerId" id="chooseUpdateSpeaker" lay-filter="updateVideo"  lay-verify="required">

                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">时长：</label>
            <div class="layui-input-inline">
                <input type="text" name="time" id="time" autocomplete="off" readonly class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">播放次数：</label>
            <div class="layui-input-inline">
                <input type="text" name="playNum" id="playNum" autocomplete="off" readonly class="layui-input">
            </div>
        </div>
    </form>
</script>

<%--新增弹出层--%>
<script id="layerInsertVideo" type="text/html">
    <form class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">名称：</label>
            <div class="layui-input-inline">
                <input type="text" name="title" id="titleInsertVideo" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">课程：</label>
            <div class="layui-input-inline">
                <select name="courseId" id="InsertVideoCourse" lay-filter="InsertVideoCourse"  lay-verify="required">
                    <option value="">请选择课程类目</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">介绍：</label>
            <div class="layui-input-inline">
                <input type="text" name="detail" id="detailInsertVideo" autocomplete="off" class="layui-input layui-textarea">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">讲师：</label>
            <div class="layui-input-inline">
                <%--                    <input type="text" name="speaker" id="speaker" autocomplete="off" class="layui-input">--%>
                <select name="speakerId" id="InsertVideoSpeaker" lay-filter="InsertVideoSpeaker"  lay-verify="required">
                    <option value="">请选择讲师</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-inline">
                <button type="button" name="vdUrl" class="layui-btn" id="VideoURL">
                    <i class="layui-icon">&#xe67c;</i>上传视频
                </button>
                <input type="hidden" name="videoUrl" id="InsertVideoURL" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-inline">
                <button type="button" name="imUrl" class="layui-btn" id="VideoImgURL">
                    <i class="layui-icon">&#xe67c;</i>上传图片
                </button>
                <input type="hidden" name="imageUrl" lay-verify="required" id="InsertVideoImgURL"  autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">时长：</label>
            <div class="layui-input-inline">
                <input type="text" name="time" id="timeInsertVideo" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
    </form>
</script>
</body>

<script type="text/html" id="updateSpeaker">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
</script>
<script type="text/html" id="deleteSpeaker">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<%-- 表头上 的数据操作--%>
<script type="text/javascript">
    var InsertVideoSpeakerId=0;
    var InsertVideoCourseId=0;
    layui.use(['form','table','upload','layer'],function () {
        var form = layui.form;
        var table = layui.table;
        var upload = layui.upload;
        var layer = layui.layer;
        var ids = [];


        <c:forEach items="${sessionScope.Speaker}" var="speaker">
            <c:if test="${speaker.id != queryVo.speakerId}">
                <%--document.getElementById("chooseSpeaker").append('<option value="' + ${speaker.id} + '">' + '${speaker.speakerName}' + '</option>');--%>
                $("#chooseSpeaker").append('<option value="' + ${speaker.id} + '">' + '${speaker.speakerName}' + '</option>');
            </c:if>
            <c:if test="${speaker.id == queryVo.speakerId}">
                <%--document.getElementById("chooseSpeaker").append('<option value="' + ${speaker.id} + '"selected>' + '${speaker.speakerName}' + '</option>');--%>
                $("#chooseSpeaker").append('<option value="' + ${speaker.id} + '" selected>' + '${speaker.speakerName}' + '</option>');
            </c:if>
        </c:forEach>
        <c:forEach items="${sessionScope.Course}" var="course">
            <c:if test="${course.id != queryVo.courseId}">
                <%--document.getElementById("chooseCourse").append('<option value="' + ${course.id} + '">' + ${course.speakerTitle} + '</option>');--%>
                $("#chooseCourse").append('<option value="' + ${course.id} + '">' + '${course.courseTitle}' + '</option>');
            </c:if>
            <c:if test="${course.id == queryVo.courseId}">
                <%--document.getElementById("chooseCourse").append('<option value="' + ${course.id} + '"selected>' + '${course.courseTitle}' + '</option>');--%>
                $("#chooseCourse").append('<option value="' + ${course.id} + '" selected>' +  '${course.courseTitle}' + '</option>');
            </c:if>
        </c:forEach>
        form.render();
        //  查询
        form.on('submit(search)', function(data){
            var queryVo = data.field;
            console.log(data.field);
                table.reload('tableVideoTool', {
                    url: 'selectVideoSearch'
                    ,page:{
                        curr: 1
                    }
                    , where: queryVo
                }, 'data');
            table.render();
        });

        // 批量删除
        table.on('checkbox(speakerTable)', function (obj) {
            if (obj.checked) {
                ids.push(obj.data.id);
            } else {
                let indexOf = ids.indexOf(obj.data.id);
                ids.splice(indexOf,1);
                console.log(ids);
            }
            form.on('submit(delVideoByIds)',function () {
                console.log(ids);
                $.ajax({
                    type:"post"
                    ,dataType:"json"
                    ,url:"deleteVideoByIds"
                    ,traditional:true
                    ,data:{ids:ids}
                    ,success:function (res) {
                        if (0 == res) {
                            table.reload('tableVideoTool', {
                                url: 'videoList'
                                ,page:{
                                    curr: 1
                                }
                                , where: {ids:ids}
                            }, 'data');
                            table.render();
                        }
                    }
                });
            })
        });

        // 新增
        form.on('submit(insertVideo)',function () {
            layer.open({
                type: 1
                ,content: $('#layerInsertVideo').html()
                ,id:'layerInsertVideoLayer'
                ,area: ['800px', '600px']
                ,success: function(layero, index){
                    <c:forEach items="${sessionScope.Speaker}" var="speaker">
                        $("#InsertVideoSpeaker").append('<option value="' + ${speaker.id} + '">' + '${speaker.speakerName}' + '</option>');
                    </c:forEach>
                    <c:forEach items="${sessionScope.Course}" var="course">
                        $("#InsertVideoCourse").append('<option value="' + ${course.id} + '">' + '${course.courseTitle}' + '</option>');
                    </c:forEach>
                    form.render();
                    form.on('select(InsertVideoSpeaker)', function(data){
                        InsertVideoSpeakerId = data.value;
                        form.render("select");
                        console.log(InsertVideoSpeakerId);
                    });
                    form.on('select(InsertVideoCourse)', function(data){
                        InsertVideoCourseId = data.value;
                        form.render("select");
                        console.log(InsertVideoCourseId);
                    });
                    //上传视频
                    upload.render({
                        elem: '#VideoURL' //绑定元素
                        ,url: 'fileUpload' //上传接口
                        ,accept: "video"
                        ,done: function(res){
                            console.log(res.urlPath);
                            $("#InsertVideoURL").val(res.urlPath);
                            console.log($("#InsertVideoURL").val());
                        }
                        ,error: function(){
                            //请求异常回调
                        }
                    });
                    // 上传图片
                    upload.render({
                        elem: '#VideoImgURL' //绑定元素
                        ,url: 'fileUpload' //上传接口
                        ,accept: "images"
                        ,done: function(res){
                            console.log(res.urlPath);
                            $("#InsertVideoImgURL").val(res.urlPath);
                            console.log($("#InsertVideoImgURL").val());
                        }
                        ,error: function(){
                            //请求异常回调
                        }
                    });
                }
                ,btn: ['提交', '取消']
                ,btn1: function(index, layero){
                    console.log(InsertVideoSpeakerId);
                    console.log(InsertVideoCourseId);
                    $.ajax({
                        type: "post"
                        ,dataType: "json"
                        ,url: "insertVideo"
                        ,data: {
                            "title": $("#titleInsertVideo").val()
                            ,"detail": $("#detailInsertVideo").val()
                            ,"speakerId": InsertVideoSpeakerId
                            ,"courseId": InsertVideoCourseId
                            ,"time":$("#timeInsertVideo").val()
                            ,"videoUrl":$("#InsertVideoURL").val()
                            ,"imageUrl":$("#InsertVideoImgURL").val()
                        }
                        ,success: function (res) {
                            if (0 == res) {
                                table.reload('speakerTable', {
                                    url : 'videoList'
                                    ,page: {
                                        curr: 1 //重新从第 1 页开始
                                    }
                                    ,where: {}
                                }, 'data');
                                table.render();
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
        });

    });
</script>
<%--<script>
    function deleteVideoByIds() {
        console.log("del");
        layui.use(['form','table'],function () {
            var form = layui.form;
            var table = layui.table;

            table.on('checkbox(speakerTable)', function (obj) {
                console.log(obj.checked); //当前是否选中状态
                console.log(obj.data); //选中行的相关数据
                console.log(obj.type); //如果触发的是全选，则为：all，如果触发的是单选，则为：one
            });
        })
    }
</script>--%>


<script>
    var chooseUpdateSpeakerId = 0;
    layui.use(["table","form","element","layer"],function() {
        var table = layui.table;
        var form = layui.form;
        var element = layui.element;
        var layer = layui.layer;

        table.render({
            elem: '#speakerTable'
            ,id:"tableVideoTool"
            ,height: 312
            ,defaultToolbar: ['filter']
            ,url: 'videoList' //数据接口
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
                {field: 'id', type: "checkbox", fixed: "left", width:40}
                ,{field: "numbers", type: "numbers", title: '序号', width:80, sort: true}
                ,{field: 'title', title: '名称', width:150}
                ,{field: 'detail', title: '介绍'}
                ,{field: 'speakerName', title: '讲师', templet:function (res) {
                        return res.speaker.speakerName;
                    }, width:80}
                ,{field: 'time', title: '时长', width:80}
                ,{field: 'playNum', title: '播放次数', width: 100, sort: true}
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
                    ,content: $('#layerUpdateVideo').html()
                    ,id:'layerUpdateVideoLayer'
                    ,area: ['800px', '600px']
                    ,success: function(layero, index){
                        $("#id").val(data.id);
                        $("#title").val(data.title);
                        $("#detail").val(data.detail);
                        // $("#chooseUpdateSpeaker").find("option[value="+data.speaker.id+"]").prop("selected",true);
                        $("#time").val(data.time);
                        $("#playNum").val(data.playNum);

                        <c:forEach items="${sessionScope.Speaker}" var="speaker">
                            $("#chooseUpdateSpeaker").append('<option value="' + ${speaker.id} + '">' + '${speaker.speakerName}' + '</option>');
                        </c:forEach>
                        $("#chooseUpdateSpeaker").find("option[value="+data.speaker.id+"]").prop("selected",true);
                        form.render("select");
                        form.on('select(updateVideo)', function(data){
                            chooseUpdateSpeakerId = data.value;
                            console.log(data.value); //复选框value值，也可以通过data.elem.value得到
                            form.render("select");
                        });

                    }
                    ,btn: ['提交', '取消']
                    ,btn1: function(index, layero){

                        console.log(chooseUpdateSpeakerId);
                        $.ajax({
                            type: "post"
                            ,dataType: "json"
                            ,url: "layerUpdateVideo"
                            ,data: {
                                "id": $("#id").val()
                                ,"title": $("#title").val()
                                ,"detail": $("#detail").val()
                                ,"speakerId": chooseUpdateSpeakerId
                            }
                            ,success: function (res) {
                                if (res == 0) {
                                    table.reload('speakerTable', {
                                        url : 'videoList'
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
                        ,url: 'deleteVideoById'
                        ,data: {id:id}
                        ,success: function (res) {
                            if (res == 0) {
                                console.log("del");
                                table.reload('speakerTable', {
                                    url: 'videoList'
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
