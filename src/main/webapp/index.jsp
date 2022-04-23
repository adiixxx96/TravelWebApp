<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"

    import="com.sanvalero.travelapp.domain.User"
%>

<%
    User currentUser = (User) session.getAttribute("currentUser");
    if (currentUser == null) {
        response.sendRedirect("login.jsp");
    }
%>

<html lang="es">
<head>
    <title>Home</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/ada.css">
    <script src="https://kit.fontawesome.com/cc976dc165.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;700&display=swap" rel="stylesheet">
  </head>

<body>
<jsp:include page="header.jsp" />
 <!--Carrusel con animación automática y manual de js-->
    <div class="carousel">
      <div class="arrow-left"> <!--ir a slide anterior-->
        <span class="arrow">&#x2039;</span>
      </div>
      <img id=img src="images/slider1.jpg" alt="Carousel Image"> <!--la imagen cambia con js-->
      <div class="arrow-right"> <!--ir a siguiente slide-->
        <span class="arrow">&#x203A;</span>
      </div>
      <div class="indicators">
        <span class="active"></span>
        <span></span>
        <span></span>
      </div>
      <div id="titulo">Sé un nómada, recorre el mundo</p>
    </div>
    <!--script js para la animación del carrusel-->
    <script type="text/javascript" src="js/slider.js"></script>
  </header>

    <section class="contenedor" id="ofertas">
        <h3>Ofertas que no puedes perderte</h3>
        <div class="viajes-oferta">

          <div class="viajes-oferta-bloque">
            <h4>Tailandia</h4>
            <img src="images/tailandia.jpg" alt="oferta 1">
            <p>Desde 1099€</p>
            <a class="boton" href="#">¡Reserva ya!</a>
          </div>

          <div class="viajes-oferta-bloque">
            <h4>Islandia</h4>
            <img src="images/islandia.jpg" alt="oferta 2">
            <p>Desde 999€</p>
            <a class="boton" href="#">¡Reserva ya!</a>
          </div>

          <div class="viajes-oferta-bloque">
            <h4>Perú</h4>
            <img src="images/peru.jpg" alt="oferta 3">
            <p>Desde 899€</p>
            <a class="boton" href="#">¡Reserva ya!</a>
          </div>

          <div class="viajes-oferta-bloque">
            <h4>Italia</h4>
            <img src="images/italia.jpg" alt="oferta 4">
            <p>Desde 499€</p>
            <a class="boton" href="#">¡Reserva ya!</a>
          </div>
        </div>
    </section>

    <section class="contenedor">
        <h3>¿Por qué elegir Nomads Adventures?</h3>

        <div class="beneficios">
          <div class="beneficios-contenido">
            <div class="beneficios-bloque" id="beneficio1">
              <i class="fas fa-plane"></i>
              <h4>Buscamos tu vuelo</h4>
              <p>Buscamos el vuelo que mejor se adapte a tus necesidades y ajustado a tu presupuesto</p>
              <a class="boton" href="#">Saber más</a>
            </div>
            <div class="beneficios-bloque" id="beneficio2">
              <i class="fas fa-globe-africa"></i>
              <h4>Más de 50 destinos</h4>
              <p>Cada día trabajamos para buscar nuevos destinos donde vivir aventuras increíbles.</p>
              <a class="boton" href="#">Saber más</a>
            </div>
            <div class="beneficios-bloque" id="beneficio3">
              <i class="fas fa-map-marked-alt"></i>
              <h4>Asistencia durante el viaje</h4>
              <p>No viajarás sol@. Durante todo el viaje te acompañará un coordinador experto</p>
              <a class="boton" href="#">Saber más</a>
            </div>
          </div>
        </div>
    </section>

    <section class="contenedor-negro">
      <div class="nuestros-viajes-contenedor">
        <h3><a name="nuestros-viajes">Nuestros viajes</a></h3>

        <div class="nuestros-viajes">
          <div class="nuestros-viajes-bloque">
            <img src="images/mexico.jpg" alt="mexico" href="#">
            <h4><a href="#">México</a></h4>
          </div>
          <div class="nuestros-viajes-bloque">
            <img src="images/jordania.jpg" alt="jordania" href="#">
            <h4><a href="#">Jordania</a></h4>
          </div>
          <div class="nuestros-viajes-bloque">
            <img src="images/londres.jpg" alt="londres" href="#">
            <h4><a href="#">Londres</a></h4>
          </div>
          <div class="nuestros-viajes-bloque">
            <img src="images/japon.jpg" alt="japón" href="#">
            <h4><a href="#">Japón</a></h4>
          </div>
          <div class="nuestros-viajes-bloque">
            <img src="images/nepal.jpeg" alt="nepal" href="#">
            <h4><a href="#">Nepal</a></h4>
          </div>
          <div class="nuestros-viajes-bloque">
            <img src="images/islandia.jpg" alt="islandia" href="#">
            <h4><a href="#">Islandia</a></h4>
          </div>
          <div class="nuestros-viajes-bloque">
            <img src="images/tailandia.jpg" alt="tailandia" href="#">
            <h4><a href="#">Tailandia</a></h4>
          </div>
          <div class="nuestros-viajes-bloque">
            <img src="images/peru.jpg" alt="peru" href="#">
            <h4><a href="#">Perú</a></h4>
          </div>
          <div class="nuestros-viajes-bloque">
            <img src="images/nueva york.jpg" alt="nueva york" href="#">
            <h4><a href="#">Nueva York</a></h4>
          </div>
          <div class="nuestros-viajes-bloque">
            <img src="images/costa rica.jpg" alt="costa rica" href="#">
            <h4><a href="#">Costa Rica</a></h4>
          </div>
          <div class="nuestros-viajes-bloque">
            <img src="images/italia.jpg" alt="italia" href="#">
            <h4><a href="#">Italia</a></h4>
          </div>
          <div class="nuestros-viajes-bloque">
            <img src="images/paris.jpg" alt="paris" href="#">
            <h4><a href="#">París</a></h4>
          </div>
        </div>

        <div class="buscador-viajes">
          <span class="icono"><i class="fas fa-search"></i></span>
          <input type="search" id="buscador" value="Buscar viajes">
       </div>
      </div>
    </section>

    <div style="height: 150px; overflow: hidden;" >
      <svg viewBox="0 0 500 150" preserveAspectRatio="none" style="height: 100%; width: 100%;">
        <path d="M0.00,49.99 C122.68,210.69 251.92,17.26 500.00,49.99 L500.00,0.00 L0.00,0.00 Z" style="stroke: none; fill: #333;"></path>
      </svg>
    </div>
<jsp:include page="footer.jsp" />

