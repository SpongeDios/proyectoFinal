<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Title</title>
</head>
<body class="container">
<h1>Publicaciones de la Comuna</h1>
<ul>
    <c:forEach var="publicacion" items="${publicacionPorComuna}">
        <li><c:out value="${publicacion.title}"/></li>
    </c:forEach>
</ul>
</body>
</html>
