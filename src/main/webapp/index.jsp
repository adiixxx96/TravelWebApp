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
<div class="wrapper">
        <div class="slider" id="slider">
          <ul class="slides">
             <li class="slide" id="slider1">
               <a href="#">
                 <div class="caption">
                  <p id="titulo">Sé un nómada, recorre el mundo</p>
                  <p id="subtitulo">Prepara la mochila y a vivir aventuras</p>
                </div>
                 <img src="images/slider1.jpg" alt="slider 1">
               </a>
             </li>
             <li class="slide" id="slider2">
                <a href="#">
                  <div class="caption">
                    <p id="titulo">Sé un nómada, recorre el mundo</p>
                    <p id="subtitulo">Prepara la mochila y a vivir aventuras</p>
                  </div>
                  <img src="images/slider2.jpg" alt="slider 2">
               </a>
             </li>
             <li class="slide" id="slider3">
                <a href="#">
                  <div class="caption">
                    <p id="titulo">Sé un nómada, recorre el mundo</p>
                    <p id="subtitulo">Prepara la mochila y a vivir aventuras</p>
                  </div>
                  <img src="images/slider3.jpg" alt="slider 3">
               </a>
             </li>
             <li class="slide" id="slider4">
                <a href="#">
                  <div class="caption">
                    <p id="titulo">Sé un nómada, recorre el mundo</p>
                    <p id="subtitulo">Prepara la mochila y a vivir aventuras</p>
                  </div>
                  <img src="images/slider4.jpg" alt="slider 4">
               </a>
             </li>
             <li class="slide" id="slider5">
                <a href="#">
                  <div class="caption">
                    <p id="titulo">Sé un nómada, recorre el mundo</p>
                    <p id="subtitulo">Prepara la mochila y a vivir aventuras</p>
                  </div>
                  <img src="images/slider5.jpg" alt="slider 5">
               </a>
             </li>
             <li class="slide">
                <a href="#">
                  <div class="caption">
                    <p id="titulo">Sé un nómada, recorre el mundo</p>
                    <p id="subtitulo">Prepara la mochila y a vivir aventuras</p>
                  </div>
                  <img src="images/slider1.jpg" alt="slider 5">
               </a>
             </li>
          </ul>

          <ul class="slider-controler">
            <li><a href="#slider1">&bullet;</a></li>
            <li><a href="#slider2">&bullet;</a></li>
            <li><a href="#slider3">&bullet;</a></li>
            <li><a href="#slider4">&bullet;</a></li>
            <li><a href="#slider5">&bullet;</a></li>
          </ul>
        </div>
      </div>
    </header>

    <section class="contenedor">
        <h3>¿Por qué elegir Nomads Adventures?</h3>

        <div class="beneficios">
          <div class="beneficios-contenido">
            <div class="beneficios-bloque" id="beneficio1">
              <i class="fas fa-plane"></i>
              <h4>Buscamos tu vuelo</h4>
              <p>Buscamos el vuelo que mejor se adapte a tus necesidades y ajustado a tu presupuesto</p>
              <a class="boton" id="open1">Saber más</a>
            </div>
            <div class="beneficios-bloque" id="beneficio2">
              <i class="fas fa-globe-africa"></i>
              <h4>Más de 50 destinos</h4>
              <p>Cada día trabajamos para buscar nuevos destinos donde vivir aventuras increíbles.</p>
              <a class="boton" id="open2">Saber más</a>
            </div>
            <div class="beneficios-bloque" id="beneficio3">
              <i class="fas fa-map-marked-alt"></i>
              <h4>Asistencia durante el viaje</h4>
              <p>No viajarás sol@. Durante todo el viaje te acompañará un coordinador experto</p>
              <a class="boton" id="open3">Saber más</a>
            </div>
          </div>
        </div>
    </section>

    <!-- Modales de javascript -->
    <!-- Modal del bloque 1 de beneficios-->
        <div class="modal-container" id="modal1">
          <div class="modal">
            <button class="close-btn" id="close1"> <!--botón para ejecutar cierre-->
              <i class="fa fa-times"></i>
            </button>
            <div class="modal-header">
              <h3>Vuelos</h3>
            </div>
            <div class="modal-content">
              <p>No estás obligado a coger un vuelo concreto.
                Te ayudamos a buscar el vuelo según tu ciudad de origen y los horarios que mejor se ajusten.
                Si nos dices tu presupuesto, intentaremos ofrecerte un vuelo lo más ajustado posible.
              </p>
              <br>
              <p>¿Quieres alargar tu viaje y volar unos días antes o quedarte más tiempo?
                No hay ningún problema, así puedes aprovechar al máximo el destino.
                Buscamos también vuelos según las fechas de cada viajero.
              </p>
                </div>
            </div>
          </div>
          <!--script js para abrir y cerrar el modal-->
          <script src="js/modal.js"></script>

            <!-- Modal del bloque 2 de beneficios-->
            <div class="modal-container" id="modal2">
              <div class="modal">
                <button class="close-btn" id="close2"> <!--botón para ejecutar cierre-->
                  <i class="fa fa-times"></i>
                </button>
                <div class="modal-header">
                  <h3>Destinos</h3>
                </div>
                <div class="modal-content">
                  <p>En nuestra web puedes consultar todos nuestros destinos y los viajes confirmados para cada destino.
                    Nuestros destinos e itinerarios buscan aprovechar al máximo las infraestructuras y la cultura local del país de destino.
                  </p>
                  <br>
                  <p>¿Tienes dudas sobre qué destino elegir?
                    Puedes preguntarnos y te aconsejaremos lo mejor posible.
                    Además, nuestros viajes se clasifican en "moods": aventura, relax, cultura e historia,... para ayudarte a tomar una decisión.
                  </p>
                    </div>
                </div>
              </div>
            <!--script js para abrir y cerrar el modal-->
            <script src="js/modal2.js"></script>

         <!-- Modal del bloque 3 de beneficios-->
        <div class="modal-container" id="modal3">
          <div class="modal">
            <button class="close-btn" id="close3"> <!--botón para ejecutar cierre-->
              <i class="fa fa-times"></i>
            </button>
            <div class="modal-header">
              <h3>Coordinador</h3>
            </div>
            <div class="modal-content">
              <p>Nos aseguramos de que los viajeros tengan la mejor experiencia y no se tengan que preocupar por nada durante el viaje.
                Durante todo el viaje estaréis acompañados de un coordinador o coordinadora.
              </p>
              <br>
              <p>¿Quién es un coordinador?
                Es un viajero experto que se encargará de toda la logística, planficiación y gestión del viaje.
                Será un compañero más que ayudará a que sea una experiencia inolvidable.
              </p>
                </div>
            </div>
          </div>
          <!--script js para abrir y cerrar el modal-->
          <script src="js/modal3.js"></script>

<jsp:include page="footer.jsp" />

