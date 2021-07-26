<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Iniciar Sesión</title>
</head>
<body>
<div class="container">
    <header>
        <a class="btn btn-link" href="/">Volver a Inicio</a>
    </header>
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
                <input class="btn btn-warning" type="submit" value="Iniciar Sesión!"/>
            </form>
        </div>
    </div>
</div>
</body>
</html>

