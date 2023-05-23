# Challenge

Este proyecto es una aplicacion de Recetas, consume la API creada en  [Mockable](https://demo3228707.mockable.io/recipes)  y muestra una lista de recetas mediante un TableView, cuándo es seleccionando uno específico, muestra un detalle con más información sobre la receta, dentro de este detalle se visualizar un boton que te redirige a un mapa, donde se visualiza la ubicacion o lugar de origen de la receta seleccionada.


## Requisitos de ejecucion

-   Xcode 14.1 or later
-   iOS 14.0 or later
-   OS X v13.3.1 
-   Cocoapods

Clonar el repositorio y ejecutar lo siguiente:

 ``` text 
 pod install
``` 

## Proyecto

Arquitectura y librerias que se utilizaron:

- Swift
- MVVM
- Alamofire
- MKMapView
- XCTest

Diseño en [Figma](https://www.figma.com/file/H28GF9GYigWX292eGKWjBR/Recipes-App?type=design&node-id=0-1).


## JSON 
Response para consumir el REST/JSON

    [
      {
        "name": "",
        "image": "",
        "description": "",
        "coordinates": {
          "latitude": -12.0990381,
          "longitude": -77.0225307
        }
      },
      {
        "name": "",
        "image": "",
        "description": "",
        "coordinates": {
          "latitude": -12.0990381,
          "longitude": -77.0225307
        }
      }
    ]

## Imagenes  
  
<p align="center">      
 <img width="230" height="450" alt="challenge" src="https://drive.google.com/uc?export=view&id=1fWx1fp3eq_swv_9OIQdtv-fW2A6o5rDm"/>    
 <img width="230" height="450" alt="challenge" src="https://drive.google.com/uc?export=view&id=1PmSR5kum3loKyvwW29T1QfU0hIJKk4lo"/> 
 <img width="230" height="450" alt="challenge" src="https://drive.google.com/uc?export=view&id=1uqhhHbY5YsGNvEJFekqTtU61qH78MXlW"/> 
 </p>
