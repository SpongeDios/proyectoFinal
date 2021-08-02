<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Inicio</title>
    <link href="/css/home.css" rel="stylesheet">
    <link rel="shortcut icon" href="/archivos/logos/iconoSuperMaestro.png" type="image/x'icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
</head>
    <body>
    <div class="container">
        <header>
            <nav class="navbar p-2">
                <c:if test="${user.id == null}">
                    <a class="link-light" class="btn btn-link" href="/login">Iniciar Sesión</a>
                    <a class="link-light" href="/registration">Registrarse</a>
                </c:if>
                <c:if test="${user.id != null}">
                <a class="link-light" href="/perfil/${user.id}"><img src="${user.photo}" width="50px" height="50px"> <c:out value="${user.firstName}"/> <c:out value="${user.lastName}"/></a>
                    <c:if test="${user.id != null && user.rol == 3 }">
                        <a class="link-light" href="/admin">Administrar</a>
                    </c:if>
                <a class="link-light" href="/publicaciones/add">Crear Publicación</a>
                <a class="link-light" href="/publicaciones">Publicaciones</a>
                <a class="link-light" href="/logout">Cerrar Sesión</a>
                </c:if>
            </nav>
        </header>
        <div class="row">
            <ul class="col">
                <c:forEach var="region" items="${regiones}">
                    <li><a class="link-light" href="/buscador/${region.nameRegion}"><c:out value="${region.nameRegion}"/></a></li>
                </c:forEach>
            </ul>
        </div>

        <div class="">
            <div class="d-flex justify-content-center row">
                <c:forEach var="categoria" items="${categorias}">
                    <div class="card col-4 m-1" style="width: 18rem;">
                        <div class="card-body">
                            <h5 class="card-title"><c:out value="${categoria.name}"/></h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="/buscador/categoria/${categoria.id}" class="card-link">Card link</a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <div class="row mt-5">
            <div class="col"></div>
            <form method="get" action="/buscando" class="col align-self-center">
                <label for="categoria"> Categoria </label>
                <select id="categoria" class="form-select" aria-label="Default select example" name="idCategoria">
                    <option selected></option>
                    <c:forEach var="categoria" items="${categorias}">
                        <option value="${categoria.id}"> <c:out value="${categoria.name}"/></option>
                    </c:forEach>
                </select>

                <label for="region"> Region </label>
                <select id="region" class="form-select" aria-label="Default select example" name="idRegion">
                    <option selected value=""></option>
                    <c:forEach var="region" items="${regiones}">
                        <option value="${region.id}"> <c:out value="${region.nameRegion}"/></option>
                    </c:forEach>
                </select>

                <label for="comunas"> Comunas </label>
                <select id="comunas" class="form-select" aria-label="Default select example" name="idComuna">
                    <option selected value=""></option>
                </select>

                <button class="btn btn-dark text-white w-100 mt-3" type="submit">Buscar</button>
            </form>
            <div class="col"></div>
        </div>
    </div>

    <script>
        regiones = JSON.parse('${regionesObject}');
        // console.log(regiones[1]['comunas'][2]);
        // console.log(regiones[1]['comunas'][3]);
        // console.log(regiones[1]['comunas'][4]);

    </script>
    <script src="/js/app.js"></script>
</body>
</html>
