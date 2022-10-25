require 'rails_helper'

RSpec.describe Cat, type: :model do
  
  it "should validate name" do
    cat = Cat.create(
    age: 13 ,
    favorite_song: 'No Body Like U', 
    pineapple_on_pizza: 'yes',
    enjoys: 'hanging with friends, drawing, and cute boys!',
    image: ' ',) 
    expect(cat.errors[:name]).to_not be_empty
  end

  it "should validate age" do
    cat = Cat.create(
    name:'Mei' ,
    favorite_song: 'No Body Like U', 
    pineapple_on_pizza: 'yes',
    enjoys: 'hanging with friends, drawing, and cute boys!',
    image: ' ',) 
    expect(cat.errors[:age]).to_not be_empty
  end

  it "should validate favorite_song" do
    cat = Cat.create(
    name: 'Mei',
    age: 13 ,
    pineapple_on_pizza: 'yes',
    enjoys: 'hanging with friends, drawing, and cute boys!',
    image: ' ',) 
    expect(cat.errors[:favorite_song]).to_not be_empty
  end

  it "should validate pineapple_on_pizza" do
    cat = Cat.create(
    name: 'Mei',
    age: 13 ,
    favorite_song: 'yes',
    enjoys: 'hanging with friends, drawing, and cute boys!',
    image: ' ',) 
    expect(cat.errors[:pineapple_on_pizza]).to_not be_empty
  end

  it "should validate enjoys" do
    cat = Cat.create(
    name: 'Mei',
    age: 13 ,
    favorite_song: 'yes',
    pineapple_on_pizza: 'yes',
    image: ' ',) 
    expect(cat.errors[:enjoys]).to_not be_empty
  end

  it "should validate image" do
    cat = Cat.create(
    name: 'Mei',
    age: 13 ,
    favorite_song: 'yes',
    pineapple_on_pizza: 'yes',
    enjoys: ' ',) 
    expect(cat.errors[:image]).to_not be_empty
  end

  it "enjoys length should be at least 10 characters" do
    cat = Cat.create(
      enjoys: 'hanging')
    expect(cat.errors[:enjoys]).to_not be_empty
  end

end
