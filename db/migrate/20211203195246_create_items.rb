class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :category_id
      t.integer :list_id
      t.integer :quantity
      t.integer :min_quantity
      t.text :notes
      t.string :image
    end
  end
end
