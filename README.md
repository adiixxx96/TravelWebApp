# TravelWebApp
He realizado la AA sobre una una web de viajes orientada hacia el cliente para que reserve viajes. Por tanto tengo las siguientes entidades:
1. Usuarios: son los clientes potenciales o usuarios que han reservado un viaje
2. Destinos: todos los destinos a los que se puede viajar
3. Viajes: viajes hacia un destino que están programados para una fecha y tienen un precio
4. Reservas: son los viajes que ha reservado un usuario

Adjunto en las carpetas del proyecto los archivos sql con la creación de las tablas y su parametrización, ya que hay una ligera modificación respecto a las entregadas en la AA de bbdd (tuve que añadir la cláusula delete on cascade para poder eliminar usuarios que tuviesen reservas).

Para entrar a la web es necesario loguearse con alguno de los usuarios existentes o registrarse. 
Puedes loguearte con:
- usuario: santiagofaci
- contraseña: santiago1234

Detallo aquí las funcionalidades que he desarrollado de las pedidas:

Obligatorios:
  - Dar de alta: usuarios (mediante el registro) y reservas
  - Listado y vista detalle: listado de viajes, destinos y reservas. Detalle de viajes, reservas, destino y usuarios.
  - Búsqueda: búsqueda de viajes y destinos
  - Dar de baja: usuarios (mediante borrar cuenta) y reservas (cancelando la reserva)
  - Diseño: he usado bootstrap y css customizado mío
 
 Opcionales:
  - Login de usuarios
  - Repositorio github del proyecto con gitflow: https://github.com/adiixxx96/TravelWebApp
  - Modificar: se pueden modificar usuarios
  - Relaciones: un usuario puede reservar un viaje y los viajes están relacionados con la entidad destinos
  - Javascript: he usado Ajax para añadir y editar usuarios
  - Zona privada para los usuarios donde pueden editar sus datos, borrar sus datos, ver y cancerlar sus reservas

