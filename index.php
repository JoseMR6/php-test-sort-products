<?php
declare(strict_types=1);

include_once('./constants.php');
include_once('./functions/global.php');
include_once('./functions/endpoints/sort-products.php');

//enlazar url con funcion
$urlRelative = $_SERVER['REQUEST_URI'];
if ($urlRelative === FUNCTIONS_PATH['SORT_PRODUCTS']) {
    //recoger datos de entrada
    //$data = getInputData(true, './mocks/mock1.json');
    $data = getInputData();
    $params = FUNCTIONS_PARAMS['SORT_PRODUCTS'];

    //ejecutar funcion
    $output = sortProducts(
        $data[$params[0]],
        $data[$params[1]],
        $data[$params[2]],
        $data[$params[3]]
    );

    //devolver datos de salida
    $outputJson = json_encode($output);
    header('Content-Type: application/json');
    echo($outputJson);
}
