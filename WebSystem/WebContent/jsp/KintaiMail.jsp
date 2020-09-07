
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>

<%@ page import="sample.pr.main.LoginForm"%>
<%@ page import="sample.pr.main.KintaiMailForm"%>
<%@ page import="sample.pr.main.MainForm"%>
<%@ page import="sample.ap.DbAction"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<html lang="ja">
<html:html>
<head>
<link rel="stylesheet" type="text/css"
	href="/WebSystem/css/KintaiMail.css">
<link rel="stylesheet" type="text/css" href="/WebSystem/css/style.css">
</head>
<body>
	<html:form action="/KintaiMailAction">
		<%
			String Email = "kintai@procd-k.co.jp";
					String Employee_no = "";
					String name = "";
					DbAction dba = new DbAction();
					LoginForm s = (LoginForm) session.getAttribute("form");
					KintaiMailForm Form = new KintaiMailForm();
					String CC = Form.getCC();
					String depart = Form.getDepart();
					String division = Form.getDivision();
					String bcc = Form.getBcc();
					String spotcode = Form.getSpotcode();
					String span = Form.getSpan();
					String ptime = Form.getPtime();
					String remark = Form.getRemark();
					String perm = Form.getPerm();
					try {
						Employee_no = s.getEmployee_no();
						name = s.getEmployee_name();
					} catch (Exception e) {
					}
		%>
		<div>
			<center>
				<h1>勤怠連絡画面</h1>
			</center>
		</div>

		<p style="margin-left: -44%;">
		<p align="center" style="margin-left: -45%">
			宛先:<%=Email%></p>

		<div align="center" class="depert">
			CC:
			<html:select property="CC" styleId="CC" name="KintaiMailForm"
				style="font-size:15px;width:60%">
				<html:option value="" style="text-align:center;">選択</html:option>
				<html:option value="1">第一技術部</html:option>
				<html:option value="2">第二技術部</html:option>
				<html:option value="3">第三技術部</html:option>
				<html:option value="4">第四技術部</html:option>
				<html:option value="5">第五技術部</html:option>
				<html:option value="6">ソリューション技術部</html:option>
			</html:select>
		</div>
		<p align="center" class="BCC">
				BCC:<html:text property="bcc" size="20" maxlength="40" style="font-size: 15px; width: 60%" value="<%=bcc%>" />
		</p>

		<div align="center" class="depert2"
			style="margin-top: 50px; width: 40%; margin-left: 10%;">
			所属部署:
			<html:select property="depart" styleId="depart" name="KintaiMailForm"
				style="font-size:15px; width:60%;">
				<html:option value="" style="text-align:center;">選択</html:option>
				<html:option value="1">第一技術部</html:option>
				<html:option value="2">第二技術部</html:option>
				<html:option value="3">第三技術部</html:option>
				<html:option value="4">第四技術部</html:option>
				<html:option value="5">第五技術部</html:option>
				<html:option value="6">ソリューション技術部</html:option>
			</html:select>
		</div>

		<p align="center" style="margin-left: -60%;">
			社員番号：<%=Employee_no%>
		</p>
		<p align="center" class="BCC" style="margin-left: -55%;">
			氏名：<%=name%>
		</p>
		<p align="center" class="code" style="margin-left: -42%">
			現場コード：<html:text property="spotcode" size="20" maxlength="6" style="width: 17%" value="<%=spotcode%>" />
		</p>
		<div align="center" class="depert2"
			style="width: 40%; margin-left: 10%">
			届出区分:
			<html:select property="division" styleId="division" name="KintaiMailForm"
				style="font-size:15px; width:60%;">
				<html:option value="" style="text-align:center;">選択</html:option>
				<html:option value="1">1</html:option>
				<html:option value="2">2</html:option>
				<html:option value="3">4</html:option>
				<html:option value="4">5</html:option>
				<html:option value="5">6</html:option>
				<html:option value="6">7</html:option>
				<html:option value="7">8</html:option>
				<html:option value="8">9</html:option>
				<html:option value="9">A</html:option>
				<html:option value="10">B</html:option>
			</html:select>
		</div>
		<p align="center" class="code" style="margin-left: -43%">
			対象日付/期間：<input type="text" name="namae" size="43" maxlength="20"
				style="width: 17%" placeholder="例 YYYYMMDD">
		</p>
		<p align="center" class="code" style="margin-left: -43%">
			出勤予定時刻：<html:text property="ptime" size="43" maxlength="5" style="width: 17%" value="<%=ptime%>" />
		</p>
		<p style="margin-left: 17.5%;">備考:</p>
		<div style="margin-left: 21%;">
			<html:textarea property="remark" rows="10" cols="100" value="<%=remark%>"></html:textarea>
		</div>

		<p align="center" class="code" style="margin-left: -39%">
			許可:<html:text property="perm" size="43" maxlength="4" style="width: 17%" value="<%=perm%>" />
		</p>

		<div>
			<html:submit property="button" styleClass="btn" value="送信"
				styleId="kintaimail" style="margin-top:10;" />
		</div>
		<div>
			<html:submit property="button" styleClass="btn" value="戻る"
				styleId="KintaiMain" style="margin-top:10;" />
		</div>





	</html:form>
</body>
</html:html>