require 'rails_helper'

RSpec.describe "Cats", type: :request do
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
    expect(cat.length).to eq(1)
    end
  end

  describe "POST /create" do
    it "creates a cat" do
      cat_params = {
      cat: {
      name: 'Mei',
      age: 13 ,
      favorite_song: 'No Body Like U', 
      pineapple_on_pizza: 'yes',
      enjoys: 'hanging with friends, drawing, and cute boys!',
      image: ' ',
      }
    }

    post '/cats', params: cat_params

    cat=Cat.first

    p 'cats on create method:', cat

    expect(cat.name).to eq ("Mei")
    expect(cat.enjoys).to eq ('hanging with friends, drawing, and cute boys!')
    end
  end

end
