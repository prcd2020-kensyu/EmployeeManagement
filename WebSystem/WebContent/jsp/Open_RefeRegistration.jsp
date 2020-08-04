<%@page import="sample.pr.main.Personal_informationForm"%>
<%@page import="sample.pr.main.Personal_informationAction"%>
<%@page import="java.util.Date"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="sample.pr.main.Open_RefelenceForm"%>
<%@ page import="java.util.function.*"%>
<%@ page import="sample.pr.main.LoginForm"%>
<%@ page import="sample.ap.DbAction"%>
<%@ page import="sample.pr.main.SearchForm"%>
<%@ page import="sample.pr.main.Open_informationForm"%>

<html:html>


<head>
<link rel="stylesheet" type="text/css" href="../css/open.css">
<link rel="stylesheet" type="text/css" href="../css/style.css">


</head>
<body>
	<html:form action="/Open_informationAction">
		<%
			DbAction dba = new DbAction();
					Open_informationForm oform=new Open_informationForm();
					oform.setEmployee_no(request.getParameter("employee_no"));
					dba.getMizuki(oform);
					dba.getHire_date(oform);
					Personal_informationForm Ename=new Personal_informationForm();
					Ename.setEmployee_no(request.getParameter("employee_no"));
					dba.getEmoloyee_Name(Ename);

					String name = "";
					String pos = "";
					String djc = "";
					String tec = "";
					String hobby = "";
					String ss = "";
					String intr = "";

					// 社員名を探すために社員番号が必要
					// 社員番号を取得するために...
					// 欲しい社員番号：ユーザ検索画面で押された社員番号

						// 名前が存在する場合
						// DBから個人情報を取得する
						// 各パラメーターを設定する
						name = Ename.getEmployee_name();
						pos = oform.getPos();
						djc = oform.getDjc();
						tec = oform.getTec();
						hobby = oform.getHobby();
						ss = oform.getSs();
						intr = oform.getIntr();
		%>
		<div class='main1'>
			<div class='pic'>
				<img src="C:\Users\gakuto_yamagishi\Desktop\susi.jpg" height="200"
					width="200">
			</div>
			<div class='pro'>
				<div class='pro2'>
					<p style="margin-top: 5px;">
						名前：<%=name %>

					</p>
					<p style="margin-top: 5px; margin-left: 50px">
						役職：<%=pos %>
					</p>
				</div>
				<div class='pro2'>
					<div class='day'></div>
					入社年月日:<%=djc %>
				</div>
				<div class='pro2'>
					<div class='tec'></div>
					技術部 :<%=tec %>
				</div>
			</div>
		</div>

		<div class='main2'>
			<div class='pro3'>
				<div class='hobyy'></div>
				趣味:<%=hobby %>
			</div>
			<div class='pro3'>
				<div class='ss'></div>
				特技:<%=ss %>
			</div>
		</div>

		<div class='bottom'>
			<div class='int'>紹介文</div>
			<%=intr %>
		</div>

		<!-- 戻るボタン -->
		<html:submit property="button" styleClass="btn" value="戻る"
			styleId="main" />
			<html:submit property="button" styleClass="btn" value="検索"
			styleId="search" />

		<script type="text/javascript">
			document.getElementById('name').readOnly = true;
			document.getElementById('pos').readOnly = true;
			document.getElementById('djc').readOnly = true;
			document.getElementById('tec').readOnly = true;
			document.getElementById('hobby').readOnly = true;
			document.getElementById('ss').readOnly = true;
			document.getElementById('intr').readOnly = true;
		</script>



	</html:form>
</body>
</html:html>
