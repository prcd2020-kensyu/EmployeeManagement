<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="sample.pr.main.MainForm" %>

<html:html>
	<head>
		<html:base/>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<html lang="ja">
		<link rel="stylesheet" type="text/css" href="../css/main.css">
		<link rel="stylesheet" type="text/css" href="../css/style.css">
    </head>

  	<table>
  		<center><h1>パスワード変更画面</h1></center>
  	</table>

 	<body>
  		<html:form action="/PasswordAction" >
			<html:hidden property="employee_no" name="PasswordForm"/>
			<div class="block">

				<div class="space"></div>
				<br>
				<br>
				<br>
				<div>
				    <center>  古いパスワード：<html:password property="oldpassword" value= ""/></center>
				</div>
				<br>
				<div>
				    <center>新しいパスワード：<html:password property="newpassword1" value= ""/></center>
				</div>
				<br>
				<div>
				    <center>新しいパスワード：<html:password property="newpassword2" value= ""/></center>
				</div>
				<div class="space"></div>
				<br>
				<!-- 変更ボタン -->
				<html:submit property="button" styleClass="btn" value="変更" styleId="change" />
    			<!-- 戻るボタン -->
				<html:submit property="button" styleClass="btn" value="戻る" styleId="back" />

 			 </div>
   		 </html:form>
	 </body>
</html:html>
