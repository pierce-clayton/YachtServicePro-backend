class AddNameToMarina < ActiveRecord::Migration[6.1]
  def change
    add_column :marinas, :name, :string
  end
end
