# Pizza Menu API

Ruby Version: 3.0.0
Rails Version: 7.0.8

This API is designed to manage and serve the pizza menus. Developed using Ruby on Rails, it provides endpoints for fetching menus, with capabilities to search by name and sort by price.


#### Features
* Fetch all menus
* Search menus by name
* Sort menus by price

### Key files

    
    app
    ├── controller                     
    │      └── api/v1
    │               └── menus_controller
    ├── models                     
    │      └── menu
    │
    |
    ├── services
    |      └── fetuch_menu_service
    |
    │
    └── spec


**Setup**

* first clone the directory 
                      ```
                      git clone git@github.com:sajjadmurtaza/pizza_menu_api.git
                      ```
 *  ```cd pizza_menu_api```

 *  ```cp .env.sample .env```

 *  ```bundle install ```

 *  ```rails db:create```

 *  ```rails db:migrate```

 *  Don't forget: ```rails db:seed```

 * AND, set origins at config/initializers/cors.rb correctly
e.g.  ```origins 'localhost:3001'  # Adjust this if your frontend is on a different domain or port```


 *  ```rails s ```


 #### API Endpoints
* Fetch Menus
    * URL: /api/v1/menus
    * Method: GET
    * URL Params:
        * name=[string]: To search by menu name
        * order=[asc|desc]: To sort by price, ascending or descending

    * http://localhost:3000/api/v1/menus
        * ![alt text](https://raw.githubusercontent.com/sajjadmurtaza/SchedulyBridge/master/app/assets/images/all.png "all meanu Screenshot")
    * http://localhost:3000/api/v1/menus?order=desc
        * ![alt text](https://raw.githubusercontent.com/sajjadmurtaza/SchedulyBridge/master/app/assets/images/o.png "order meanu Screenshot")
    * http://localhost:3000/api/v1/menus?name=Margherita
        * * ![alt text](https://raw.githubusercontent.com/sajjadmurtaza/SchedulyBridge/master/app/assets/images/s.png "search meanu Screenshot")

### Specs

run ``` bundle exe rspec``` to run the tests


## Note:
**Please adjust config/initializers/cors.rb file correclty**
e.g.  ```origins 'localhost:3001'  # Adjust this if your frontend is on a different domain or port```