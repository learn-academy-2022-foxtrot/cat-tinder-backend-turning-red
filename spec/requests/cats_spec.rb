require 'rails_helper'

RSpec.describe "Cats", type: :request do
 
#index tests   
  describe "GET /index" do
    it "gets list of cats" do
    Cat.create(
    name: 'Mei',
    age: 13 ,
    favorite_song: 'No Body Like U', 
    pineapple_on_pizza: 'yes',
    enjoys: 'hanging with friends, drawing, and cute boys!',
    image: ' ',)

    get '/cats'

    cat = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(cat.length).to eq(0)
    end
  end

  # Create tests
  describe "POST /create" do
    it "creates a cat" do
      cat_params = {
        cat: {
          name: "Mei",
          age: 13 ,
          favorite_song: 'No Body Like U', 
          pineapple_on_pizza: 'yes',
          enjoys: 'hanging with friends, drawing, and cute boys!',
          image: ' something.com',
      }
    }

    post "/cats", params: cat_params
    cat=Cat.first

    p 'cats on create method:', cat

    expect(cat.name).to eq("Mei")
    expect(cat.enjoys).to eq('hanging with friends, drawing, and cute boys!')
    end
  end

  it "doesn't create a cat without a name" do
    cat_params = {
      cat: {
      age: 13 ,
        favorite_song: 'No Body Like U', 
        pineapple_on_pizza: 'yes',
        enjoys: 'hanging with friends, drawing, and cute boys!',
        image: 'something.com',
      }
    }

    post '/cats', params: cat_params
    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json['name']).to include "can't be blank"
  end


# Update tests
describe "PATCH /update" do
    it "updates a cat" do
      cat_params = {
        cat: {
          name: "Mei",
          age: 13 ,
          favorite_song: 'No Body Like U', 
          pineapple_on_pizza: 'yes',
          enjoys: 'hanging with friends, drawing, and cute boys!',
          image: 'something.com',
      }
    }

    post '/cats', params: cat_params #creates a cat

    catmoose = Cat.first 

    update_params = {
      cat: {
        name: "NotMei",
        age: 13 ,
        favorite_song: 'No Body Like U', 
        pineapple_on_pizza: 'yes',
        enjoys: 'hanging with friends, drawing, and cute boys!',
        image: 'something.com',
    }
  }

    patch "/cats/#{catmoose.id}", params: update_params #updates a cat
    cat=Cat.first

    expect(cat.name).to eq("NotMei")
    expect(cat.enjoys).to eq('hanging with friends, drawing, and cute boys!')
    end
  
  #validation
    it "doesn't update a cat without a name" do
      cat_params = {
        cat: {
          name: "Mei",
          age: 13 ,
          favorite_song: 'No Body Like U', 
          pineapple_on_pizza: 'yes',
          enjoys: 'hanging with friends, drawing, and cute boys!',
          image: 'something.com',
        }
      }
      post '/cats', params: cat_params #creates a cat

      catmoose = Cat.first 
  
      update_params = {
        cat: {
          name: '',
          age: 13 ,
          favorite_song: 'No Body Like U', 
          pineapple_on_pizza: 'yes',
          enjoys: 'hanging with friends, drawing, and cute boys!',
          image: 'something.com',
      }
    }
  
      patch "/cats/#{catmoose.id}", params: update_params #updates a cat
     
      
      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['name']).to include "can't be blank"
    end
  end
end

