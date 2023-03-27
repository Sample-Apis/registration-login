## Start Application

* **Install all require  gems**

   `bundle install`

* **Create database**

   `rails db:create`

* **Execute migrations to create tables**

   `rails db:migrate`

* **Create a file with name .env inside root folder**

* **Put below mentioned key and values inside .env file**

   `API_TOKEN=7d12221d4cd3....`

* **This token will be used to pass in registration and login apis header**


## APIS

### Headers

    {
    	accept: application/vnd.sampleapi; version=1
    	content-type: application/json
    	Authorization: Token token=7d12221d4cd3....
    }

### Signup user

**[POST] /api/users**

    "user": {
        "email": "abc@test.com",
        "name": "XYZ",
        "phone": "9999999999",
        "password": "XXXXX"
    }

### Login user (Using email/password)

**[POST] /api/users/sign_in**

    "user" : {
        "email" : "abc@test.com",
        "password" : "XXXXX"
    }
