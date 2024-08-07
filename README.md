INSTTANTT FLUTTER TEST
##Requerimientos técnicos para construir el proyecto.**

Flutter 3.22.2
Android version mínimo: Android 5.0 - 21 LOLLIPOP - Api # 21
IOS versión mínima 12
➢ Arquitectura.

Clean Architecture
➢ Dependencias y versiones.

  flutter_meedu: ^5.3.1
  flutter_riverpod: ^2.5.1
  sqflite: ^2.3.2
  path: ^1.9.0
  path_provider: ^2.0.0
  flutter_feather_icons: ^2.0.0+1
  animated_bottom_navigation_bar: ^1.1.0+1
  fluttertoast: ^8.2.6
  image_picker: ^1.1.2
  permission_handler: ^11.3.1
  shared_preferences: ^2.1.0

➢ Breve descripción de la aplicación.

Para poder acceder a la aplicación es necesario entrar a la pantalla de registro donde debe colocar su nombre, su correo electronico, su contrseña y repeetirla para validar que sea correcta, la contraseña debe tener minimo 10 caracteres y entr estos debe existir números letras mayusculas letras minusculas y por lo menos un caracter especial, al realizar el registro esos datos quedaran almacenados en sqlitebase de datos interna del dispositivo, con esto podra dirijirse a la pantalla de login donde con su correo y su contraseña podra ingresar a la home de la aplicación.
En la home encontrara un avatar con su inicial de nombre y abajo su nomre registrado al inicio, podra cambiar el avatar con una imagen de la galeria del dispositivo o tomando en ese instante una fotografia. en la parte superior derecha encontrara la palabra "cerrar sesión" la darle click se borraran lod datos de la base de datos y lo devolvera a la pantalla de login.
EN la Home en la parte inferior encontarra las opciones de home y de contanctos en los contactos encontrara una pantalla vacio y en la parte superior derecha un signo "+" donde podra agregar contactos a la lista y a su vez un biscador de contactos donde empezará a filtrar despues de digitar la tercera letra del contacto.

Si cierra la aplicacion y vuelve a abrirla debere redirecionarlo a la pantalla de Home con sus datos y la foto que selecciona la ultima vez.

➢ Clean Architecture

• Es un arquitectura de software diseñada por Robert C. Martin, que consiste en conjunto de capas bien definidas, las cuales están centradas en el dominio (el negocio y sus reglas).

➢ Domain

El dominio es la capa definida por el negocio, es decir, no debe estar atada a ningún concepto técnico y dentro de ella vemos las entidades y los casos de uso.

➢ Presentation

Implementa todo el software relacionado a los elementos visuales con los que el usuario final interactuará.

➢ Data

Esta capa puede contener adaptadores para conectarnos entre capas, apis y helpers,

➢ Recomendaciones

Principio de Responsabilidad Única consiste en que cada clase tendrá una única función o propósito con el propósito de mantener juntas las funcionalidades relacionadas lo que reduce el acoplamiento produciendo un código más flexible, mantenible y testeable.

Un buen código es aquel que se escribe teniendo en cuenta las siguientes consideraciones:

Llevar un control de versiones o Consultar la documentación en caso de dudas. o Se sigue la guía de estilo y nombramiento del lenguaje, framework y plataforma. o Se utilizan patrones de diseño. o Utilizar un Linter para mantener la calidad del código. o No abusar de las reducciones extremas en la sintáxis ya que reducen la legibilidad. o Seguir los principios SOLID o En el caso de Android se deben hacer pruebas en varios dispositivos con diferentes tamaños y densidades de pantalla, además de diversas marcas y versiones de OS. o Seguir buenas prácticas de programación. o En el caso de Android se deben hacer pruebas en varios dispositivos con diferentes tamaños y densidades de pantalla, además de diversas marcas y versiones de OS. o Seguir buenas prácticas de programación. o Documentar y agregar los comentarios para facilitar la lectura y compresión del código.
