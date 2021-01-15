class CreateMarinas < ActiveRecord::Migration[6.1]
  def change
    create_table :marinas do |t|
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :state
      t.integer :zip
      t.text :description

      t.timestamps
    end
  end
end
