<?php

declare(strict_types=1);

function getInputData(bool $local = false, 
    string $localUrl = LOCAL_JSON
): array
{
    $result = null;
    $data = [];

    if ($local) {
        //fichero json local
        $result = file_get_contents($localUrl);
    }else{
        //json desde POST
        $result = file_get_contents('php://input');
    }

    if ($result) {
        $data = json_decode($result, true);
    }

    return $data;
}
