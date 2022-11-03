# NODEJS API

NODE JS EVALUATION PROJECT

## 1. Mine Information by id

GET:[localhost:8400/mine/show/:id](localhost:8400/mine/show/1)

## 2. Add a new mine

POST:[localhost:8400/mine/add](localhost:8400/mine/add)

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

PUT:[localhost:8400/mine/update/:id](localhost:8400/mine/update/1)

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

## 4. Delete a mine

DELETE:[localhost:8400/mine/delete/:id](localhost:8400/mine/delete/1)


{
    "firstname":"gwiondeux",
    "lastname":"Tanguy",
    "password":"admin",
    "mail":"gwiontanguy+2@mail.com"
}

## 5. Show all mines by concession

GET:[localhost:8400/concession/show/mines/:id](localhost:8400/concession/show/mines/1)

## 6. Show all contacts by concession

GET:[localhost:8400/concession/show/contact/:id](localhost:8400/concession/show/contact/1)

## 7. Show all informations by concession

GET:[localhost:8400/concession/all/:id](localhost:8400/concession/all/1)

## 8. Authentication for Create/Update/Delete

### 8.1 Sign in

POST:[http://localhost:8400/user/login](http://localhost:8400/user/login)

Parameter: Body > raw > JSON
```
{
    "firstname":"firstname",
    "lastname":"lastname",
    "password":"password",
    "mail":"mail"
}
```

### 8.2 Log in

POST:[http://localhost:8400/user/signin](http://localhost:8400/user/signin)

Parameter: Body > raw > JSON
```
{
    "password":"password",
    "mail":"mail"
}
```

> *return a token*