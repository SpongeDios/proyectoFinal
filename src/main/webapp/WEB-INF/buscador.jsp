<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Title</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col">

            <h1>Publicaciones de la Region</h1>
            <ul>
                <c:forEach var="publicacion" items="${publicacionPorRegion}">
                    <li><c:out value="${publicacion.title}"/></li>
                </c:forEach>
            </ul>

            <h1>Comunas de la region</h1>
            <ul>
                <c:forEach var="comuna" items="${comunasRegion}">
                    <li><a href="/${comuna.region.nameRegion}/${comuna.nameComuna}"><c:out value="${comuna.nameComuna}"/></a></li>
                </c:forEach>
            </ul>

        </div>
    </div>
</div>
</body>
</html>

