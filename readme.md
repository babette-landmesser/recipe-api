# Setup
## Pre-requisites
### Local database
- database name: recipe-api
- import database from sql file: recipe-api.sql
 
## Installation
1. clone repository
2. `cd recipe-api`
3. `npm install`
4. set your local database credentials in .env file. 

## Run App
`npm run start`


# Available Endpoints
### Login
#### `POST /api/v1/login`
```
{
    name: string,
    password: string
}
```

### Recipes
#### `GET /api/v1/recipes`
#### `POST /api/v1/recipes`
```
{
    title: string,
    ingredients: string,
    preparation: string,
    portion: number,
    image?: File
}
```

### Users
#### `POST /api/v1/users/update-password`
```
{
    id: number,
    oldPassword: string,
    newPassword: string,
    passwordConfirm: string,
}
```


# Deliver Docker Image 
1. `docker build -t blandmesser/recipe-api .`
2. `docker save blandmesser/recipe-api -o recipe-api.tar`
3. upload tar to server: `scp recipe-api.tar user@server:recipe-api.tar`
4. load tar: `docker load -i recipe-api.tar`
5. start docker: `docker run --rm -dp 7000:7000 blandmesser/recipe-api` 
oder: `docker run --rm -dp 7000:7000 —-name babette/recipe-api blandmesser/recipe-api`  
bei Änderungen: `docker stop babette/recipe-api`