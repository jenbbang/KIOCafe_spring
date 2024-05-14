<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<!-- /layout/layout.jsp -->
<title>타이틀 : <sitemesh:write property='title' /></title> 
<!-- 해당되는 url의 title 내용 -->
<%@ include file="/common/head.jsp"%>
<sitemesh:write property='head' />
</head>
<body>
	<div class='mainBody'>
		<sitemesh:write property='body' />
		<!-- 해당되는 url의 body내용이 들어감 -->
		
	</div>
 
</body>
 
<footer>
		<!-- footer-->
		<%@ include file="/common/footer.jsp"%>
		<sitemesh:write property='footer' />
		<!-- //footer-->
	</footer>
</html>
