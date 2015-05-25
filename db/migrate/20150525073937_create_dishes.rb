class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :title
      t.text :description
      t.decimal :cost, precision: 6, scale: 2
      t.integer :pax
      t.boolean :vegetarian
      t.boolean :published
      t.timestamps
    end
  end
end
