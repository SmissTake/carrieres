# NODEJS API

NODE JS EVALUATION PROJECT

## 1. Mine Information by id

GET:[localhost:8200/mine/show/:id](localhost:8200/mine/show/1)

## 2. Add a new mine

POST:[127.0.0.1:8100/mine/add](127.0.0.1:8100/mine/add)

Parameter: Body > raw > JSON
```
{
    "name" : "Mine name",
    "longitude" : "00",
    "latitude" : "00",
    "concessionsId" : "0"
}
```