<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>再入室画面</title>
</head>
<body>

	<h2>再入室画面</h2>

	<div>
		再入室処理
		<html:form action="/InsertAccess">
			<html:submit styleClass="send" property="button" value="再入室"/>
		</html:form>
	</div>

	<button type="button" onclick="history.back()">戻る</button>




</body>
</html>