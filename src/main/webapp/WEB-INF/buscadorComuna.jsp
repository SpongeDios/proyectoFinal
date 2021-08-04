<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <link rel="shortcut icon" href="/archivos/logos/iconoSuperMaestro.png" type="image/x'icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <title>Buscador por Comuna</title>
    <script src="/js/backbutton.js"></script>
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
