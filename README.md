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

 *  ```rails s ```


 #### API Endpoints
* Fetch Menus
    * URL: /api/v1/menus
    * Method: GET
    * URL Params:
        * name=[string]: To search by menu name
        * order=[asc|desc]: To sort by price, ascending or descending

### Specs

run ``` bundle exe rspec   ``` to run the tests