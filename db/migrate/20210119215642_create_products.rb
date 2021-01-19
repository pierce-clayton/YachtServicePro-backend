class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.references :user, null: false, foreign_key: true
      t.references :marina, null: false, foreign_key: true
      t.string :stripe_product_id
      t.boolean :active
      t.string :stripe_attributes
      t.text :description
      t.string :images
      t.string :name

      t.timestamps
    end
  end
end
