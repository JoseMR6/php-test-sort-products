<?php
//Fichero local para pruebas sin input
const LOCAL_JSON = "./mocks/mock1.json";

//datos de las funciones de endpoint preparados para hacerlo 
//facilmente escalable para un mayor numero de funciones
const FUNCTIONS_PATH = [
    'SORT_PRODUCTS' => '/sort-products'
];
const FUNCTIONS_PARAMS = [
    'SORT_PRODUCTS' => [
        'salesWeight',
        'stockWeight',
        'productSales',
        'productStock'
    ]
];
?>