# Proyecto Saucedemo (automatización python)
Paginas de la web app
1. Login (clase Login) **Emiliano** *Listo*
2. Catalogo (clase Catalogue) **Emiliano - Ana Maria** Hereda la clase Login *Listo*
3. Descripcion (clase Description) **Milton**   
4. Carro (clase Cart) **Emiliano - Fabian** Hereda la clase Catalogue *Listo*
5. Information (clase Checkout_Information) **Emiliano - Bisset** Hereda la clase Carro *Listo* 
6. Checkout (clase Checkout_Overview)  **Franciso - Martin**
7. Completada (clase Checkout_Complete) **David - Silvea**

## Sobre el archivo configconstan.py
Contiene 3 clases 
* BrowserConfig:
    Contiene la url y la constante de tiempos de espera en segundos 
* Config:
    Define el entorno en combinación con el archivo pytest.py.  
    Se reconocen como entornos el usuario error_user (entorno 'test'), el usuario standard_user (entorno 'prod') y el usuario problem_user (entorno 'prbl'). Sólo a manera de poder cambiar de usuario y de resultado de la prueba. Y entendiendo que el contexto entorno es más que esto. E instancia el objeto para su uso
* Cards:
    Define cada uno de los productos del catalogo y contiene sus 'xpath_title' (xpath para el titulo de la tarjeta),
            'xpath_image' (xpath para la imagen de la tarjeta) y el 'id_add_cart'(id para el boton add to cart de la tarjeta)

## Sobre el archivo pytest.py
Contiene:
* Chrome_browser, fixture para definir el webdriver de chrome para su uso en todos los procesos. Apertura y cierre. 
* pytest_adoption, establece el uso de --env, opcion para cambiar el entorno con el comando de ejecucion en la terminal. Segun las siglas de cada entorno señaladas en el archivo anterior.
* set_environment predefine el  entorno como 'prod'

## Sobre el archivo pytest.py

## Sobre el archivo imports.py
Contiene todas las librerias cuyas importaciones son necesarias para este proyecto. Luego cada archivo py puede llamar a las que necesite desde imports



