<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<html lang="es">
  <head>
    <title>Login</title>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">
    <!--"estilos bootstrap"--><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <meta name="theme-color" content="#7952b3">
    <link href="css/login.css" rel="stylesheet">
  </head>

 <body class="text-center">
<main class="form-signin">
  <form method="post" action="login">
    <img class="img" src="images/logo.png">
    <h1 class="h3 mb-3 fw-normal">Inicia sesión</h1>

    <div class="form-floating">
      <input type="text" name="username" class="form-control" id="floatingInput" placeholder="Usuario">
      <label for="floatingInput">Usuario</label>
    </div>
    <div class="form-floating">
      <input type="password" name="password" class="form-control" id="floatingPassword" placeholder="Contraseña">
      <label for="floatingPassword">Contraseña</label>
    </div>

    <button class="w-100 btn btn-lg btn-warning" type="submit">Acceder</button>

    <!-- Acceso a registrar un nuevo usuario -->
    <p class="mt-5 mb-3 text-muted">¿No tienes una cuenta?</p>
    <a class="btn btn-warning" href="/Travel-webapp/register.jsp" role="button">Regístrate</a>
  </form>

  </form>
</main>

  </body>
</html>