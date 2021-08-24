<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
request.setAttribute("path", path);
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setAttribute("basePath", basePath);
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->

    <!-- <meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <!-- <meta name="_csrf_header" content="${_csrf.headerName}"/>-->

    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">

    <title>Signin Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="<%=basePath %>bootstrap3.3.5/css/bootstrap.min.css" rel="stylesheet">
    <!-- <link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet"> -->
    <!-- <link href="css/signin.css" rel="stylesheet"> -->
    <link href="<%=basePath %>css/signin.css" rel="stylesheet">

</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">HDF-决策支持系统</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="/">首页 <span class="sr-only">(current)</span></a></li>
                <li><a href="#">Link</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">Dropdown <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">One more separated link</a></li>
                    </ul>
                </li>
            </ul>
            <form class="navbar-form navbar-left" role="search">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Product By Tech Center</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">联系我们 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">曲子乐, QQ:1949602</a></li>
                        <li><a href="#">汤超</a></li>
                        <li><a href="#">汪青</a></li>
                        <li><a href="#">马梅</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">Email - </a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>

<div class="container">
    <form  id="loginForm" class="form-signin" name="form" action="<%=basePath %>system/login.do" method="POST">
       <!-- 
            <div class="alert alert-danger" role="alert">
                <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                <span class="sr-only">Error:</span>
                There was an error, please try again
            </div>
 -->
        <h2 class="form-signin-heading">请登录...</h2>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="text" id="inputUsername" name="userName" class="form-control" placeholder="企业邮箱" required
               autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" name="password" class="form-control" placeholder="密码" required>
        <%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> --%>
		<div style="color: red;" id="showMsg">${ RequestScope.error}</div>
        <div class="checkbox">
            <label>
                <input type="checkbox" name="remember-me"> 记住我
            </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block"  type="submit">登录</button>
    </form>

</div>

<!-- Bootstrap core JavaScript -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="<%=basePath %>js/jquery-1.11.3.min.js"></script>
<script src="<%=basePath %>bootstrap3.3.5/js/bootstrap.min.js"></script>
<!-- <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script> -->

</body>

<script type="text/javascript">

$(function(){
    $("input[name='userName']").focus();
});
function cleardata(){
    $('#loginForm').form('clear');
}
function login(){
    if($("input[name='userName']").val()=="" || $("input[name='password']").val()==""){
        $("#showMsg").html("用户名或密码为空，请输入");
        $("input[name='userName']").focus();
   }else{
           //ajax异步提交  
          $.ajax({            
                 type:"POST",   //post提交方式默认是get
                 url:"<%=basePath %>system/login.do", 
                 data:$("#loginForm").serialize(),   //序列化               
                 error:function(request) {      // 设置表单提交出错                 
                     $("#showMsg").html(request);  //登录错误提示信息
                 } ,
                 success:function(data) {
                     document.location = "<%=basePath %>system/index.do";
                 }           
           });       
       } 
}
</script>
</html>
