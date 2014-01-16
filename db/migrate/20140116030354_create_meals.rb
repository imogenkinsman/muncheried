class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :name
      t.text :description
      t.string :url
      t.decimal :price, :precision => 5, :scale => 2
      t.integer :remaining

      t.timestamps
    end
  end
end
