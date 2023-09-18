# Flutter Product List App 📱

Este proyecto en Flutter se creó con el propósito de listar productos de [escuelajs API](https://api.escuelajs.co/api/v1/products). Es parte de un reto de revisión de código, con el enfoque de intentar construir la funcionalidad sin depender demasiado de librerías externas.

## 🌟 Características:

- **API Manager**: Una clase responsable de hacer llamadas HTTP para recuperar la lista de productos de la API.
- **Listado de Productos**: Una vez recuperada la lista, se presenta en una interfaz de usuario amigable y eficiente.
- **Caché de Imágenes**: Para un rendimiento óptimo, las imágenes se almacenan en caché utilizando la librería `cached_network_image`.
- **Detalles del Producto**: Al hacer clic en un producto, se muestra una pantalla de detalles con información adicional. Se usa el package carousel_slider 4.2.1 para listar las imagenes hermosas en un carrousel de niños
- **Refresh indicator**: Para actualizar la lista de productos, se usa el widget RefreshIndicator. (Se intento no usar un manejador de estados entonces use un ValueNotifier y Stateful para actualizar la lista de productos)
- **Hero Animation**: Para una experiencia de usuario más agradable y exquisita, se usa la animación hero, pero es algo muy sencillito. 
## 🚀 Cómo comenzar:

1. **Clona este repositorio**:

   ```bash
   git clone [url-del-repositorio]

![App preview](https://i.imgur.com/jPTc8KV.mp4)
