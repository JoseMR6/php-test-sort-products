================================================
    Desarrollo de un Endpoint para Ordenación
        Automática de Productos (PHP)
================================================

Herramientas elegidas:
------------------------------------------------
He decidio utilizar PHP porque es el lenguaje de
programación backend que mas fresco tengo.

Version: PHP 8.1.2-1ubuntu2.19

Instalacion en Ubuntu:
    sudo apt install php8.1-cli
    sudo apt install curl

Iniciar servidor en Ubuntu:
    cd rutaCarpetaPruebaTecnica
    php -S localhost:8000

================================================

Endpoint:
------------------------------------------------
función: sortProducts

ruta dentro del servidor: /sort-products 

Descripcion:
Ordena una lista de productos segun ventas y
stocks proporcionados.

Entrada (Json con):
    salesWeight: Peso de las ventas en la ordenación.
    stockWeight: Peso de los articulos restantes en
        la ordenación.
    productSales: Lista de ids de productos con sus
        ventas.
    productStock: Lista de ids de productos con sus
        articulos restantes.
    (Ambas listas deben tener la misma cantidad de
        elementos y los mismos ids de productos.)

Salida: lista de ids ordenados en formato Json.

Ejemplo en terminal con curl 
(cambiar puerto si no usas el mismo):
curl -X POST 'http://localhost:8000/sort-products' -H 'Content-Type: application/json' -d '{
  "salesWeight": 0.5,
  "stockWeight": 0.5,
  "productSales": [
    {"productId": "1", "sales": 50000},
    {"productId": "2", "sales": 100000},
    {"productId": "3", "sales": 100000},
    {"productId": "4", "sales": 75000}
  ],
  "productStock": [
    {"productId": "1", "stock": 100000},
    {"productId": "2", "stock": 400000},
    {"productId": "3", "stock": 200000},
    {"productId": "4", "stock": 300000}
  ]
}'

Resultado esperado del Ejemplo: ["2","4","3","1"]

================================================

Pruebas:
------------------------------------------------
Dentro de la carpeta con el código y este README
también hay un script tests.sh para ejecutar varias 
pruebas de forma automática mediante la terminal
de ubuntu, utilizando comandos similares a los del
ejemplo. Estas pruebas compararan los resultados
de la ejecucion con los resultados esperados e 
indicaran si coinciden.

Preparacion del Script (dar permisos):
    chmod +x tests.sh

Ejecutar tests:
    ./tests.sh
