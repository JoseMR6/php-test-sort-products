# Desarrollo de un Endpoint para Ordenación Automática de Productos (PHP)

## Herramientas elegidas

He decidido utilizar PHP porque es el lenguaje de programación backend que más fresco tengo.

**Versión**: PHP 8.1.2-1ubuntu2.19

**Instalación en Ubuntu**:

```
sudo apt install php8.1-cli
sudo apt install curl
```

**Iniciar servidor en Ubuntu**:

```
cd rutaCarpetaPruebaTecnica
php -S localhost:8000
```


## Endpoint

**Función**: sortProducts

**Ruta dentro del servidor**: /sort-products 

**Descripción**:

Ordena una lista de productos según ventas y stocks proporcionados.

**Entrada (Json con)**:

- salesWeight: Peso de las ventas en la ordenación.
- stockWeight: Peso de los artículos restantes en la ordenación.
- productSales: Lista de ids de productos con sus ventas.
- productStock: Lista de ids de productos con sus artículos restantes.

(Ambas listas deben tener la misma cantidad de elementos y los mismos ids de productos)

**Salida**: Lista de ids ordenados en formato Json.

**Ejemplo en terminal con curl**:

(Cambiar puerto si se usa el mismo)

```
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
```

**Resultado esperado del Ejemplo**: `["2","4","3","1"]`


## Pruebas

Dentro de la carpeta con el código y este README también hay un script tests.sh para ejecutar varias pruebas de forma automática mediante la terminal de ubuntu, utilizando comandos similares a los del ejemplo. Estas pruebas compararan los resultados de la ejecución con los resultados esperados e indicaran si coinciden.

**Preparación del Script (dar permisos)**:

```
chmod +x tests.sh
```

**Ejecutar tests**:

```
./tests.sh
```
