class AddMarinaIdToYacht < ActiveRecord::Migration[6.1]
  def change
    add_column :yachts, :marina_id, :integer
  end
end
