#!/bin/bash
url='http://localhost:8000/sort-products'

declare -a commandList
declare -a resultsList

commandList[0]=$(curl -X POST $url -H 'Content-Type: application/json' -d '{
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
}')

resultsList[0]='["2","4","3","1"]'

commandList[1]=$(curl -X POST $url -H 'Content-Type: application/json' -d '{
  "salesWeight": 0.75,
  "stockWeight": 0.25,
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
}')

resultsList[1]='["2","4","3","1"]'

commandList[2]=$(curl -X POST $url -H 'Content-Type: application/json' -d '{
  "salesWeight": 0.25,
  "stockWeight": 0.75,
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
}')

resultsList[2]='["2","4","3","1"]'

commandList[3]=$(curl -X POST $url -H 'Content-Type: application/json' -d '{
  "salesWeight": 0.8,
  "stockWeight": 0.2,
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
}')

resultsList[3]='["2","3","4","1"]'

commandList[4]=$(curl -X POST $url -H 'Content-Type: application/json' -d '{
  "salesWeight": 0.75,
  "stockWeight": 0.25,
  "productSales": [
    {"productId": "1", "sales": 200000},
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
}')

resultsList[4]='["1","2","4","3"]'

commandList[5]=$(curl -X POST $url -H 'Content-Type: application/json' -d '{
  "salesWeight": 0.25,
  "stockWeight": 0.75,
  "productSales": [
    {"productId": "1", "sales": 50000},
    {"productId": "2", "sales": 100000},
    {"productId": "3", "sales": 100000},
    {"productId": "4", "sales": 75000}
  ],
  "productStock": [
    {"productId": "1", "stock": 500000},
    {"productId": "2", "stock": 400000},
    {"productId": "3", "stock": 200000},
    {"productId": "4", "stock": 300000}
  ]
}')

resultsList[5]='["1","2","4","3"]'

echo ""

for ((i=0;i<${#commandList[@]};i++))
do
    if test ${commandList[$i]} = ${resultsList[$i]}
    then
        echo Correct test.
        echo Result: ${commandList[$i]}
    else
        echo Test failed. Result: ${commandList[$i]}
        echo Expected result: ${resultsList[$i]}
    fi
    echo ""
done