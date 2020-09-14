<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="sample.pr.main.RoomReservationForm"%>
<%@ page import="sample.pr.main.LoginForm"%>

<html:html>
<html lang="ja">
<link rel="stylesheet" type="text/css" href="/WebSystem/css/style.css">
<div align= "center">
	<h1>新規予約画面</h1>
</div>
<body>
	<html:form action="/ReservationConfimAction">
	<%
		String message;
		try{
			RoomReservationForm roForm = (RoomReservationForm) session.getAttribute("pForm");
			message =  roForm.getMessage();
			if(message == null)
				message = "";

		}catch(NullPointerException e){
			message = "";
		}
	%>
		<div class="block">
			<div class="space"></div>
			<br>
			<div align= "center">
					会議室名：
					<!--  input type ="text" property="room_name" value="" />-->
					<html:text property="room_name" value="" />
			</div>
			<div align= "center">
					所在地　：
					<html:text property="place" value="" />
			</div>
			<div align= "center">
					席数　　：
					<html:text property="seat" value="" />
			</div>
			<div align="center">
			<!-- 登録ボタン -->
			<html:submit property="button" styleClass="btn" value="登録"
				styleId="room"/>
			<div align="center">
			<html:submit property="button" styleClass="btn" value="戻る"
			styleId="main" />
			</div>
		</div>

	</html:form>
</body>
</html:html>