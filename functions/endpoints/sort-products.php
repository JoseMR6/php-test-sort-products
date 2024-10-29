<?php
declare(strict_types=1);

function sortProducts(
    float $salesWeight,
    float $stockWeight,
    array $productSales,
    array $productStock
): array {
    $sortedIds = [];
    $sortValues = [];

    //crear un un array de ids con valores de ordenacion ponderados
    foreach ($productSales as $index => $product) {
        $value = [];
        $value['productId'] = $product['productId'];
        $value['sortValue'] = $salesWeight * $product['sales'];
        $value['sortValue'] += $stockWeight * $productStock[$index]['stock'];

        //ordenar array de valores de ordenacion
        sortInsert($sortValues, $value);
    }

    //extraer ids ordenados
    foreach ($sortValues as &$value) {
        //echo ($value['productId'] . ': ' . $value['sortValue'] . '<br>');
        array_push($sortedIds, $value['productId']);
    }

    return $sortedIds;
}

function sortInsert(array &$sortValues, array $newValue): void
{
    //si es mayor se coloca delante
    //ocupando el indice del valor actual
    foreach ($sortValues as $index => $value) {
        if ($newValue['sortValue'] > $value['sortValue']) {
            array_splice($sortValues, $index, 0, [$newValue]);
            return;
        } 
    }

    array_push($sortValues, $newValue);
}
?>