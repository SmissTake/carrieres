# NODEJS API

NODE JS EVALUATION PROJECT

## 1. Mine Information by id

GET:[localhost:8200/mine/show/:id](localhost:8200/mine/show/1)

## 2. Add a new mine

POST:[localhost:8100/mine/add](localhost:8100/mine/add)

Parameter: Body > raw > JSON
```
{
    "name" : "Mine name",
    "longitude" : "00",
    "latitude" : "00",
    "concessionsId" : "0"
}
```

## 3. Update a mine

PUT:[localhost:8200/mine/update/:id](localhost:8200/mine/update/1)

Parameter: Body > raw > JSON
```
{
    "name" : "Mine name",
    "longitude" : "00",
    "latitude" : "00",
    "concessionsId" : "0"
}
```

*Each parameter is optional*