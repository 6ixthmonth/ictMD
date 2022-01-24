<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach items="${flagImgUrlList }" var="flag">
		<img src="https://flagicons.lipis.dev/flags/1x1/${flag.alphaTwoCode }.svg" alt="${flag.countryName }" style="width:40px;height:40px;border-radius:50%"><br>
	</c:forEach>
</body>
</html>