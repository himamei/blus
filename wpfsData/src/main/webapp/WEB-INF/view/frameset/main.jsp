<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	request.setAttribute("path", path);
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("basePath", basePath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="zh-CN" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <meta name="description" content="决策支持系统, 数据分析, 数据统计, 报表">
    <meta name="author" content="">
    <title>DDS - 决策支持系统</title>
    <link href="<%=basePath %>bootstrap3.3.5/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>jquery-easyui-1.4.4/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>jquery-easyui-1.4.4/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>jquery-easyui-1.4.4/demo/demo.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/style.css">
    
    
    <script type="text/javascript" src="<%=basePath %>jquery-easyui-1.4.4/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>

</head>
<body class="easyui-layout">
    <div data-options="region:'north'" style="height:52px;background-color:#E0ECFF">
        <div style="padding:15px 0;">
        	<div class="logo">
	    		<span>DSS - 决策支持系统</span>
	    	</div> 
	    	<div class="topright">   
                <ul>
                    <li><span>${sessionScope.user.userName }/${sessionScope.user.realName }</span></li>
                    <li><a href="#" onclick="openPwd()">修改密码</a></li>
                    <li><span><img src="<%=basePath %>images/help.png" title="帮助" class="helpimg"/></span><a href="#" onclick="showHelp();">帮助</a></li>
                    <li><a href="<%=basePath %>system/toLoginOut.do" target="_parent">退出</a></li>
                </ul>
            </div>

        </div>
        

    </div>
    <div data-options="region:'west',split:true,title:'管理面板'" style="width:300px;">
        <div id="menu" class="easyui-accordion" 
        data-options="fit:true,border:false,animate:true,plain:true">
        </div>
    </div>
    <div data-options="region:'center'">
        <div id="admin-tabs" class="easyui-tabs" data-options="fit:true,border:false,plain:true">
            <div title="About" style="padding:10px">

                <div id="main22" style="height:400px"></div>
                <div id="main33" style="height:400px"></div>
                <div id="main11" style="height:400px"></div>

            </div>
        </div>
    </div>


    <div id="pwddlg" class="easyui-dialog" style="width:400px;height:280px;padding:30px 30px"  closed="true" buttons="#dlg-buttons">
        <form id="fm" method="post" novalidate>
            <input name="id" id="id" type="hidden" value="${sessionScope.user.id}"/>
            <div class="fitem">
                原始密码
                <input name="oldPassword" id="oldPassword" class="easyui-textbox" type="password" required="true"/>
            </div>
            <div class="fitem">
                新 密码： <input id="password" name="password" validType="length[4,32]" class="easyui-textbox"
                           required="true" type="password"/><br/>

            </div>
            <div class="fitem">
                确认密码：<input id="password2" type="password" name="repassword" id="repassword" required="true" class="easyui-textbox"
                            validType="equalTo['#password']" invalidMessage="两次输入密码不匹配"/>
            </div>
        </form>
    </div>
    <div id="dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="savePwd()"  style="width:90px">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"  onclick="javascript:$('#pwddlg').dialog('close')" style="width:90px">取消</a>
    </div>

    <div id="helpdlg" class="easyui-dialog" style="width:400px;height:280px;padding:30px 30px"  closed="true" buttons="#helpdlg-buttons">
        <ul>
            <li>如有问题请发送邮件给我们：
                <a href="mailto:tech-data@haodf.com"><span>数据分析部</span></a>
            </li>
        </ul>
    </div>
    <div id="helpdlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok"  onclick="javascript:$('#helpdlg').dialog('close')" style="width:90px">关闭</a>
    </div>
    
<script type="text/javascript">

$(document).ready(function () {
	      $.ajax({
	         type: 'GET',
	          dataType: "json",
	         url: "<%=basePath %>system/getMenuListById.do?id=1",
	         success: function (data) {
	             $.each(data, function (i, n) {
	                 $('#menu').accordion('add', {
	                     title: n.text,
	                     //click:GetSmallMenu(n.MenuID,n.MenuName),
	                     //iconCls: 'icon-menu-' + n.MenuImg.replace(new RegExp('.png'), ''),
	                     selected: false,
	                     content: '<div style="padding:10px;" name="' + n.text + '"><ul id="report_tree_'+n.id+'"></ul></div>'
	                });
	                 
	                 $('#report_tree_'+n.id).tree({
	                     checkbox: false,   
	                     url: '<%=basePath %>system/getMenuListById.do?id=' + n.id,   
	                     onBeforeExpand:function(node,param){ 
	                     	var urlStr = "<%=basePath %>system/getMenuListById.do?id=" + node.id;
	                         $('#report_tree_'+n.id).tree('options').url = urlStr;
	                     },               
	                     onClick:function(node){
	                    	 if(node.isLeaf == 1){
	                    		 if(node.url != '' && node.url != 'null' && node.url != null){
	                    			 if(node.url.substr(0,5) == "BIRT:"){
	                    				 addTab(node.text, node.url.substr(5));
	                    			 }else{
	                    				 addTab(node.text, '<%=basePath %>'+node.url);
	                    			 }
		                         }
	                    	 }
	                     } 
	                });
	            });
	         }
	     });    
	     $('#menu').accordion({
	         autoHeight:false,
	         navigator:true
	     });
	 });
	 
function addTab(title, href, icon) {
    var tab = $('#admin-tabs');
    if (tab.tabs('exists', title)) {//如果tab已经存在,则选中并刷新该tab
        tab.tabs('select', title);
        // refreshTab({tabTitle: title, url: href});
    } else {
        if (href) {
            var content = '<iframe scrolling="no" frameborder="0"  src="' + href + '" style="width:100%;height:100%;"></iframe>';
        } else {
            var content = '未实现';
        }
        tab.tabs('add',{});
        var t = tab.tabs('getSelected');
        tab.tabs('update', {
            tab: t,
            options: {
                title: title,
                content: '<iframe scrolling="auto" frameborder="0"  src="'+href+'" style="width:100%;height:100%;"></iframe>',
                closable: true,
                selected:true
            }
        });
    }
}

    /**
     *修改密码弹出框
    */
    function openPwd() {
        $('#pwddlg').dialog('open').dialog('center').dialog('setTitle', '密码修改');
        $('#fm').form('clear');
    }

    /**
     * 密码确认
     */
    $.extend($.fn.validatebox.defaults.rules, {
        /*必须和某个字段相等*/
        equalTo: {
            validator:function(value,param){
                return $(param[0]).val() == value;
            },
            message:'字段不匹配'
        }

    });

    /**
     *保存修改的密码
     */
    function savePwd(){
        var old = $('#oldPassword').val();
        var news = $('#password').val();
        console.info(old+"||"+news);
        if(old == news){
            $.messager.alert('提示', '新密码不能为原始密码！', 'info');
            return false;
        }

        //先判断原始密码是否正确
        $.ajax({
            type: "post",
            url: "<%=basePath %>user/isExistPwd.do",
            data : $('#fm').serialize(),
            dataType: "json",
            success: function (data) {
                if (data.success) {
                    submitSave();//调用修改密码方法
                } else {
                    $.messager.alert('提示', data.errorMsg, 'info');
                    return false;
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(errorThrown);
                return false;
            }
        });

    }
    function submitSave(){
        //ajax提交form
        $.ajax({
            type: "post",
            url: '<%=basePath %>user/updatePwd.do',
            data : $('#fm').serialize(),
            dataType: "json",
            success: function (data) {
                if (data.success) {
                    $('#pwddlg').dialog('close');        // close the dialog
                    $.messager.alert('提示', '恭喜你，密码修改成功！', 'info');
                } else {
                    $.messager.alert('提示', data.errorMsg, 'error');
                    return false;
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(errorThrown);
                return false;
            }
        });

    }


    function showHelp(){
        $('#helpdlg').dialog('open').dialog('center').dialog('setTitle', '帮助');
    }



</script>



<style type="text/css">
        #fm {
            margin: 0;
            padding: 10px 30px;
        }

        .fitem {
            margin-bottom: 5px;
        }

        .fitem label {
            display: inline-block;
            width: 80px;
        }

        .fitem input {
            width: 160px;
        }
    </style>
</body>
</html>