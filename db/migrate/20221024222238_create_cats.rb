class CreateCats < ActiveRecord::Migration[7.0]
  def change
    create_table :cats do |t|
      t.string :name
      t.integer :age
      t.string :favorite_song
      t.string :pineapple_on_pizza
      t.text :enjoys
      t.text :image

      t.timestamps
    end
  end
end
     