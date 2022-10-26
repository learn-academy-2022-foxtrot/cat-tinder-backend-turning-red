class Cat < ApplicationRecord
    validates :name, :age,:favorite_song, :pineapple_on_pizza, :enjoys, :image, presence: true

    validates :enjoys, length: {minimum: 10}

end
