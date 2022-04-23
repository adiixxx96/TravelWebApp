<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>

<%@ page import="com.sanvalero.travelapp.dao.Database" %>
<%@ page import="com.sanvalero.travelapp.dao.UserDao" %>
<%@ page import="com.sanvalero.travelapp.domain.User" %>
<%@ page import="java.util.Optional" %>
<%@ page import="java.sql.SQLException" %>

<html lang="es">
  <head>
    <title>Register</title>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">
    <link href="css/login.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <meta name="theme-color" content="#7952b3">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  </head>

  <body class="text-center">
    <script type="text/javascript">
              $(document).ready(function() {
                  $("form").on("submit", function(event) {
                      event.preventDefault();
                      var formValue = $(this).serialize();
                      $.post("add-user", formValue, function(data) {
                          $("#result").html(data);
                      });
                  });
              });
    </script>
   <main class="form-signin">
    <form>
      <h1 class="h3 mb-3 fw-normal">Registrar usuario</h1>
      <br>
    <div class="form-floating">
       <input type="text" name="name" class="form-control" id="floatingInput" placeholder="Nombre">
       <label for="floatingInput">Nombre</label>
    </div>
    <br>
    <div class="form-floating">
       <input type="text" name="username" class="form-control" id="floatingInput" placeholder="Usuario">
       <label for="floatingInput">Usuario</label>
    </div>
    <br>
    <div class="form-floating">
       <input type="text" name="password" class="form-control" id="floatingInput" placeholder="Contraseña">
       <label for="floatingInput">Contraseña</label>
    </div>
    <br>
    <button type="submit" class="w-100 btn btn-lg btn-warning">Registrar</button>
    <a type="button" class="btn btn-link" href="login.jsp" role="button">Ir a iniciar sesión</a>
  </form>
  <div id="result"></div>
  </div>
  </main>
  </body>
</html>