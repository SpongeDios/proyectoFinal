<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link rel="shortcut icon" href="archivos/logos/iconoSuperMaestro.png" type="image/x'icon">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Title</title>
    <script src="/js/backbutton.js"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <c:forEach var="publicacion" items="${publicacionesPorCategoria}">
            <c:out value="${publicacion.title}"/>
        </c:forEach>
    </div>
</div>
</body>
</html>
