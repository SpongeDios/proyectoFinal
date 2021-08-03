<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link rel="shortcut icon" href="/archivos/logos/iconoSuperMaestro.png" type="image/x'icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link href="/css/login.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/navbar.css">
    <title>Iniciar Sesión</title>
    <script src="/js/backbutton.js"></script>
</head>
<body>
<div class="container">
    <header>
        <nav class="navbar p-2">
            <a class="link-light" href="javascript: history.go(-1)"> ◄ Volver atrás</a>
        </nav>
    </header>
    <br>
    <div class="row">
        <div class="col">
            <h3>Login</h3>
            <form method="post" action="/login">
                <p> <c:out value="${error}"/> </p>
                <p>
                    <label for="email">Email</label>
                    <input class="form-control" type="text" id="email" name="email"/>
                </p>
                <p>
                    <label for="password">Contraseña</label>
                    <input class="form-control" type="password" id="password" name="password"/>
                </p>
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <input class="btn btn-light me-md-2" type="submit" value="Iniciar Sesión!"/>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>

