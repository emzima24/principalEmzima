# Proyecto Saucedemo (automatización Cypress y JS nativamente de forma asincrónica)  
Los controladores de las páginas de la web app fueron diseñadas como en el ejemplo [proyecto saucedemo](https://github.com/emzima24/principalEmzima/tree/main/principalEmzima/pythonAutomatizacion/saucedemoproject)  

1. Login (clase Login) 
2. Catalogo (clase Catalogue) Hereda la clase Login.
3. Descripcion (clase Description) Hereda la clase Catalogue.
4. Carro (clase Cart) Hereda la clase Description.
5. Information (clase Checkout_Information) Hereda la clase Cart.
6. Checkout (clase Checkout_Overview) Hereda la clase Checkout_Information.
7. Completada (clase Checkout_Complete) Hereda la clase Checkout_Overview, Description de la cual sobre escribe una clase.

## Sobre el archivo cypress.config.js  
Contiene configuracions importates como:
* chromeWebSecurity: Configura para mantener todas o ignorar algunas de las políticas de seguridad de chrome
* watchForFileChanges: Configura para que los cambios en los archivos del proyecto afecten directamente o se deban ejecutar manualmente luego del cambio para observar como afectó 
* baseUrl: Establece el endpoint del proyecto si fuese uno o al menos el de partida
* specPattern: Configura las extensiones que considerará para la ejecución de las pruebas en las carpetas inidcadas
* supportFile: Configura la ruta relativa al archivo de soporte si se usa alguno o false en caso contrario
* testIsolation: Configura el aislamiento de estado entre las pruebas para que no se afecten entre si
* setupNodeEvents: Configura entornos en nuestro caso en particular la integración con Cucumber.

## Sobre el archivo package.json
Contiene:

* Define las dependencias automáticamente en la medida que vamos instalandolas, pero se pueden cambiar si es necesario o no se realizó de forma automática

## Sobre la carpeta fixture
Contiene las fixtures que pueden ser necearias para todas las ejecuciones:

* Users: contiene usario y password para el login en la app
* Productos: contiene los etiquetas necesarias para cada una de las cards relativas a los productos. Apuntan al add tu card (id_add_cart), al titulo (xpath_title) y a la imagen (xpath_image) aunque usando los selectores de Cypress

## Sobre el archivo functionProducts.js
Contiene:

* La funcion que permite obtener del archivo productos.json que esta en la fixture el identificador según el usuario suministre el nombre el producto. Los atributos dependen de si es el add tu card, al titulo  o a la imagen.

## Sobre las pruebas
Existen dos tipos de pruebas:

### Pruebas internas:
Mediante la carpeta **testPOO** los archivos **test*.cy.js** se hacen las pruebas la programación por páginas de la web app. Solo prueban la implementación de cypress para administrar las páginas y asi configurar las pruebas. Tienen asserts según se van necesitando.  
   
Para ejecutar algún archivo: **npx cypress open**   
Luego: **E2E Testing**  
Luego: **seleccionar el browser**  
Y al final escoger la carpeta **testPOO** y luego el archivo **test*.cy.js** directo que se quiera probar que refiere a pruebas especificas de cada pagina de la web app

### Pruebas a con Cucumber
Mediante la carpeta **features** con el archivo ***.features** deseado. Se prueban las features que el escenario define segun el contexto de behave(Gherkin). No incluye capturas de imagenes y ni creación de informes  

Para ejecutar algún archivo: **npx cypress open**   
Luego: **E2E Testing**  
Luego: **seleccionar el browser**  
Y al final escoger la carpeta **feaures** y luego el archivo ***.feature** directo que se quiera probar que refiere a pruebas especificas planificada en Cucumber

### Terminar de ejecutar Cypress
Ctrl+C