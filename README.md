# Challenge: Cat Tinder API Setup
### As a developer, I have been commissioned to create an application where a user can see cute cats looking for friends. As a user, I can see a list of cats. I can click on a cat and see more information about that cat. I can also add cats to the list of cats looking for friends. If my work is acceptable to my client, I may also be asked to add the ability to remove a cat from the list as well as edit cat information.


## API Setup
- As a developer, I can create a new Rails application with a Postgresql database.
    branch:backend-structure

- As a developer, I can create a RSpec testing suite in my Rails application.
    branch:backend-structure

- As a developer, I can add a resource for Cat that has a name, an age, what the cat enjoys doing, and an image.
    branch:backend-structure

## API Seeds

- As a developer, I can add cat seeds to the seeds.rb file.
    branch:backend-structure
#### In seeds.rb
```rb
    cats.each do |each_cat|
        Cat.create each_cat
        puts 'creating cat #{each_cat}'
    end
``` 
- ##### Errors Encountered: 
    - Would not migrate due to kebab-case used in model. Changed it to snake_case in model and migrated successfully 
- As a developer, I can run the rails command to add cats to database.
    branch:backend-structure
    $ rails c
    > Cat.all 

## API CORS

- As a developer, I can enable my controller to accept requests from outside applications.
    branch:backend-structure

- As a developer, I can add the CORS gem to my Rails application.
    branch:backend-structure

- As a developer, I can add the cors.rb file to my application.
    branch:backend-structure
    Added to app/contollers/application_controller.rb

    ```ruby 
    class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token 
    end
    ```

    Adding to Gemfile 
        ```ruby 
        gem 'rack-cors', :require => 'rack/cors'
        ``` 
    
    config/initializers/cors.rb 
        ```rails
            Rails.application.config.middleware.insert_before 0, Rack::Cors do
        allow do
        origins '*'  # <- change this to allow requests from any domain while in development.
    
        resource '*',
            headers: :any,
            methods: [:get, :post, :put, :patch, :delete, :options, :head]
        end
        end
        ```

        $ bundle 

## API Endpoints (DONE)
Branch:api-endpoints 
- As a developer, I can add an index request spec to my application.
- As a developer, I can add an index endpoint to my application.
- As a developer, I can add a create request spec to my application.
- As a developer, I can add a create endpoint to my application.
### Stretch Goals (NOT YET COMPLETED)
- As a developer, I can add an update request spec to my application.
- As a developer, I can add an update endpoint to my application.
- As a developer, I can add a destroy request spec to my application.
- As a developer, I can add a destroy endpoint to my application.


## API Validations
Branch:api-validations 
- As a developer, I can add the appropriate model specs that will ensure an incomplete cat throws an error.
- As a developer, I can add the appropriate model validations to ensure the user submits a name, an age, what the cat enjoys, and an image.
    validates :name, :age,:favorite_song, :pineapple_on_pizza, :enjoys, :image, presence: true
- As a developer, I can add the appropriate model specs that will ensure a cat enjoys entry is at least 10 characters long.
- As a developer, I can add a validation to assure that will ensure a cat enjoys entry is at least 10 characters long.
    validates :enjoys, length: {minimum: 10}
- As a developer, I can add the appropriate request validations to ensure the API is sending useful information to the frontend developer if a new cat is not valid.
    ```ruby
    post '/cats', params: cat_params
    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json['name']).to include "can't be blank"
    ```
- As a developer, I can add the appropriate request spec that will look for a 422 error if the create validations are not met.
    ```ruby 
        def create
            cat = Cat.create(cat_params)
            if cat.valid?
                render json: cat
            else 
                render json: cat.errors, status: 422
            end 
        end
    ```

- STRETCH: As a developer, I can add the appropriate request validations to ensure the API is sending useful information to the frontend developer if an updated cat is not valid.


- STRETCH: As a developer, I can add the appropriate request spec that will look for a 422 error if the update validations are not met.


