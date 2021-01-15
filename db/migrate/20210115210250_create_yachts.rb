class CreateYachts < ActiveRecord::Migration[6.1]
  def change
    create_table :yachts do |t|
      t.string :name
      t.integer :length
      t.boolean :sail
      t.string :registration_number

      t.timestamps
    end
  end
end
