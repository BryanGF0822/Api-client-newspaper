# RetoNewsPaperAPI

Este proyecto es una app iOS en SwiftUI que consume noticias cientificas desde la API de Spaceflight News. La app muestra una lista de articulos y permite ver el detalle de cada uno.

La idea principal es separar responsabilidades para que el codigo sea facil de entender, probar y mantener:
- **Vistas (SwiftUI)**: muestran la interfaz.
- **ViewModel**: maneja el estado y la logica de carga.
- **Networking**: trae los datos desde la API.
- **Modelos**: representan la informacion.
- **Tests**: validan el comportamiento sin depender de la red.

## Flujo general de la app

1. La app inicia en `RetoNewsPaperAPIApp`.
2. Se muestra `ArticleListView`.
3. `ArticleListView` crea un `ArticleViewModel`.
4. El view model llama al servicio para obtener articulos.
5. El servicio consulta la API y decodifica el JSON.
6. La lista se actualiza con los articulos.
7. Al tocar un articulo, se abre `ArticleDetailView` con el detalle.

## Estructura del proyecto

### 1) Punto de entrada
**Archivo**: `RetoNewsPaperAPI/App/RetoNewsPaperAPIApp.swift`
- Es el punto de entrada de la aplicacion.
- Crea la ventana principal y muestra `ArticleListView`.

### 2) Vistas
**Archivo**: `RetoNewsPaperAPI/Views/ArticleList/ArticleListView.swift`
- Vista principal.
- Muestra tres estados:
  - Cargando: `ProgressView`.
  - Error: texto en rojo con el mensaje.
  - Lista: `List` con los articulos.
- Usa `NavigationStack` para navegar a `ArticleDetailView`.
- Llama a `loadArticles()` al aparecer con `.task`.

**Archivo**: `RetoNewsPaperAPI/Views/ArticleDetail/ArticleDetailView.swift`
- Vista de detalle del articulo.
- Muestra la imagen con `AsyncImage` (si falla, usa imagen local).
- Renderiza titulo, fuente y resumen.

### 3) ViewModel
**Archivo**: `RetoNewsPaperAPI/ViewModels/ArticleViewModel.swift`
- Se ejecuta en el `MainActor` porque actualiza UI.
- Propiedades publicas que la vista observa:
  - `articles`: lista de articulos.
  - `isLoading`: true mientras carga.
  - `errorMessage`: mensaje de error si algo falla.
- Metodo principal: `loadArticles()`.
  - Activa `isLoading`.
  - Llama al servicio.
  - Si todo sale bien, asigna la lista.
  - Si hay error, convierte a mensaje entendible.

### 4) Networking
**Archivo**: `RetoNewsPaperAPI/Networking/ArticleServiceProtocol.swift`
- Define el contrato para traer articulos.
- Esto permite usar un servicio real o un mock en pruebas.

**Archivo**: `RetoNewsPaperAPI/Networking/ArticleService.swift`
- Implementacion real del servicio.
- Hace `URLSession` a `https://api.spaceflightnewsapi.net/v4/articles`.
- Valida status code 2xx.
- Decodifica JSON a `ArticlesResponse`.
- Convierte errores de red en `NetworkError`.

**Archivo**: `RetoNewsPaperAPI/Networking/NetworkError.swift`
- Enum con errores tipicos de red.
- Tiene descripciones legibles para mostrar en UI.

### 5) Modelos
**Archivo**: `RetoNewsPaperAPI/Models/Article.swift`
- `ArticlesResponse`: estructura que representa la respuesta principal de la API.
- `Article`: modelo de cada articulo.
- Usa `CodingKeys` para mapear `snake_case` del JSON a `camelCase` en Swift.

### 6) Mocks para previews
**Archivo**: `RetoNewsPaperAPI/Mocks/Mocks.swift`
- Contiene un `Article.mockArticle`.
- Se usa en `#Preview` para ver la UI sin depender de la red.

## Pruebas unitarias

Las pruebas se enfocan en el `ArticleViewModel` porque es donde vive la logica de estado.

**Archivo**: `RetoNewsPaperAPITests/Mocks/MockArticleService.swift`
- Mock que implementa `ArticleServiceProtocol`.
- Permite simular resultados de exito o error sin tocar la red.

**Archivo**: `RetoNewsPaperAPITests/RetoNewsPaperAPITests.swift`
- `testArticleCreation`: valida que el modelo se construye correctamente.
- `testLoadArticlesSuccess`: verifica el flujo exitoso.
- `testLoadArticlesNetworkError`: verifica error conocido de red.
- `testLoadArticlesUnknownError`: verifica error inesperado.

Estas pruebas demuestran que el view model responde bien a cada escenario.

## Como ejecutar la app

- Abrir `RetoNewsPaperAPI.xcodeproj` en Xcode.
- Seleccionar un simulador o dispositivo.
- Ejecutar con `Run` (Cmd + R).

## Como ejecutar tests

- En Xcode: `Product > Test` (Cmd + U).
- En terminal (opcional):
  ```bash
  xcodebuild test -scheme RetoNewsPaperAPI -destination 'platform=iOS Simulator,name=iPhone 15'
  ```

## Resumen didactico

Si lo piensas como un flujo simple:

1. **Vista** pide datos al **ViewModel**.
2. **ViewModel** solicita datos al **Servicio**.
3. **Servicio** consulta la **API** y devuelve modelos.
4. **ViewModel** actualiza estado.
5. **Vista** se actualiza automaticamente.

Este patron ayuda a mantener el codigo claro: la vista muestra, el view model decide, y el servicio trae datos.
