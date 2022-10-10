<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="short icon" href="./images/logo.jpg">
<title>My Shop - Home</title>
<%@include file="component/componentFile.jsp" %>
<style type="text/css">
html {
  scroll-behavior: smooth;
}
#home{
	
}
</style>
</head>
<body>
<%@include file="component/navbar.jsp" %>

<!-- Home page start from here -->

<%@include file="./Home.jsp" %>

<!-- Home page start from end -->

<!-- ProductCollection page start from here -->

<%@include file="./ProductCollection.jsp" %>

<!-- ProductCollection page start from end -->
 
<!-- cloth page start from here -->
<%@include file="./Cloths.jsp" %>
<!-- cloth page end from here -->

</body>
</html>