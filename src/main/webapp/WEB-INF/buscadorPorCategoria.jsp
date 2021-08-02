<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link rel="shortcut icon" href="/archivos/logos/iconoSuperMaestro.png" type="image/x'icon">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Title</title>
    <link rel="stylesheet" href="/css/publicacionEnBuscador.css" type="text/css">
    <script src="/js/backbutton.js"></script>
</head>
<body>
<div class="container">
    <c:forEach var="publicacion" items="${publicacionesPorCategoria}">
        <div class="row border d-flex justify-content-center p-3">
            <ul class="list-group col">
                <li class="list-group-item">Nombre: <c:out value="${publicacion.user.firstName} ${publicacion.user.lastName}"/></li>
                <li class="list-group-item">Titulo: <c:out value="${publicacion.title}"/></li>
                <li class="list-group-item">Descripcion: <c:out value="${publicacion.description}"/></li>
                <li class="list-group-item">Direccion: <c:out value="${publicacion.user.address.comuna.region.nameRegion} ${publicacion.user.address.comuna.nameComuna} ${publicacion.user.address.nameCalle}"/></li>
                <li class="list-group-item">Price: <c:out value="${publicacion.price}"/></li>
                <li class="list-group-item">Visitar publicación: <a href="/publicaciones/${publicacion.id}">Link</a> </li>
            </ul>
            <div class="mapouter col"><div class="gmap_canvas"><iframe width="100%" height="300" id="gmap_canvas" src="https://maps.google.com/maps?q=${publicacion.user.address.comuna.region.nameRegion}%20${publicacion.user.address.comuna.nameComuna}%20${publicacion.user.address.nameCalle}&t=&z=13&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe><a href="https://123movies-to.org"></a><br><style>.mapouter{position:relative;text-align:right;height:300px;width:100%;}</style><a href="https://www.embedgooglemap.net"></a><style>.gmap_canvas {overflow:hidden;background:none!important;height:300px;width:100%;}</style></div></div>
        </div>
    </c:forEach>
</div>
</body>
</html>
