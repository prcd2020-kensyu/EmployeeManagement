<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="sample.pr.main.MainForm"%>
<%@ page import="sample.pr.main.KintaiNotificationForm"%>
<%@ page import="sample.pr.main.KintaiNotificationAction"%>
<%@ page import="sample.pr.main.LoginForm"%>

<style>
.back {
	margin-top: 4%;
	position: relative;
}

.block {
	margin: 16px auto;
	text-align: center;
	display: block;
}

.outputmessage{
	text-align:center;
}

.block .centers {
	text-align: left;
	display: inline-block;
	padding-bottom: 10px;
}

textarea {
	resize: none;
}
</style>

<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><bean:message key="kintaiNotification.title"/></title>
<html:base />
<link rel="stylesheet" type="text/css" href="../css/style.css">
</head>

<table>
	<center>
		<h1>勤怠届作成</h1>
	</center>
</table>

<body>
 	<%
 		String message;
 		try{
 			KintaiNotificationForm kn = (KintaiNotificationForm) session.getAttribute("KNForm");
 			message =  kn.getMessage();
 			if(message == null)
 				message = "";

 		}catch(NullPointerException e){
 			message = "";
 		}

 	%>


	<html:form action="/KintaiNotificationAction">

		<div class="outputmessage"><%= message %></div>

		<div class="block">

			<div class="space"></div>

			<!-- 社員番号入力欄 -->
			<div class="centers">
				<p class="list">
				<%
				String employee_no_login="";
				String employee_no="";
				try {
					LoginForm s1 = (LoginForm) session.getAttribute("form");
					KintaiNotificationForm kn = (KintaiNotificationForm) session.getAttribute("KNForm");
					employee_no_login = s1.getEmployee_no();
					employee_no = kn.getEmployee_no();

					if (employee_no_login.equals("")) {
						employee_no = "";
					}else if(employee_no.equals("")){
						employee_no = employee_no_login;
					}
				} catch (NullPointerException e) {
					employee_no = "";
				}
				%>
					社員番号 ：
					<html:text property="employee_no" size="5" maxlength="4"
						value="<%=employee_no%>" styleId="employee_no" />
					氏名 ：
					<html:text property="syain_name" size="12" maxlength="12"
						styleId="syain_name" />
				</p>

				<p>
					所属部門 ：
					<html:select property="depart" name="KintaiNotificationForm" styleId="depart">
						<html:option value="">選択してください</html:option>
						<html:option value="1" >第1技術部</html:option >
						<html:option value="2">第2技術部</html:option>
						<html:option value="3">第3技術部</html:option>
						<html:option value="4">第4技術部</html:option>
						<html:option value="5">第5技術部</html:option>
						<html:option value="6">ソリューション技術部</html:option>
					</html:select>
				</p>

				<p>
					申請日 ：
					<html:text property="petition_ymd" size="10" maxlength="8"
						styleId="petition_ymd" />

				</p>
				<p>
					対象日 ：
					<html:text property="attendance_startday" size="10" maxlength="8"
						styleId="attendance_startday" />
					～
					<html:text property="attendance_endday" size="10" maxlength="8"
						styleId="attendance_endday" />
				</p>
				<p>
					対象時間 ：
					<html:text property="attendance_starttime" size="10" maxlength="4"
						styleId="attendance_starttime"/>
					～
					<html:text property="attendance_endtime" size="10" maxlength="4"
						styleId="attendance_endtime" />
				</p>

				<p>
					届出事由 ：
					<html:select property="notification_reason"
						name="KintaiNotificationForm" styleId="notification_reason">
						<html:option value="">選択してください</html:option>
						<html:option value="1">1：遅刻</html:option >
						<html:option value="2">2：早退</html:option>
						<html:option value="3">3：私用外出</html:option>
						<html:option value="4">4：休暇</html:option>
						<html:option value="5">5：休職</html:option>
						<html:option value="6">6：育児休業</html:option>
						<html:option value="7">7：無断欠勤</html:option>
					</html:select>
				</p>
				<p>
					休暇区分 ：
					<html:select property="vacation_division"
						name="KintaiNotificationForm" styleId="vacation_division">
						<html:option value="">選択してください</html:option>
						<html:option value="1" >1.年次有給休暇/リフ休</html:option>
						<html:option value="3">3.振替休暇</html:option>
						<html:option value="4">4.特別休暇</html:option>
						<html:option value="5">5.欠勤</html:option>
					</html:select>

				</p>

				<p>
					振替対象日：
					<html:text property="transfer_day" size="10" maxlength="8"
						styleId="transfer_day" />
				</p>

				<p>
					特休理由 ：
					<html:select property="sp_holiday_reason"
						name="KintaiNotificationForm" styleId="sp_holiday_reason">
						<html:option value="">選択してください</html:option>
						<html:option value="1">1:結婚</html:option>
						<html:option value="2">2:産前産後休業</html:option>
						<html:option value="3">3:忌引き</html:option>
						<html:option value="4">4:生理休暇</html:option>
						<html:option value="5">5:天災地変</html:option>
						<html:option value="6">6:伝染病予防</html:option>
						<html:option value="7">7:そのた</html:option>
					</html:select>
				</p>

				<p>
					欠勤理由 ：
					<html:radio property="absenteeism_reason"
						styleId="absenteeism_reason" value="1" />
					病気
					<html:radio property="absenteeism_reason"
						styleId="absenteeism_reason" value="2" />
					自己都合
					<html:radio property="absenteeism_reason"
						styleId="absenteeism_reason" value="3" />
					事故
				</p>

			</div>
			<!-- brock.centers End -->
			<br>
			<p>事由</p>
			<p>
				<html:textarea property="reason" styleId="reason" rows="6" cols="40"/>
		</div>

		<!-- エクセル出力ボタン -->
		<div class="back">
			<html:submit property="button" styleClass="btn" value="エクセル作成"
				styleId="ExcelOutput" />
			<!-- 戻るボタン -->
			<html:submit property="button" styleClass="btn" value="戻る"
				styleId="back" />
		</div>
	</html:form>
</body>
</html:html>
