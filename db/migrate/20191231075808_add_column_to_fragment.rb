class AddColumnToFragment < ActiveRecord::Migration[6.0]
  def change
    add_column :fragments, :score, :float, default: 0.0
    add_column :fragments, :magnitude, :float, default: 0.0
  end
end
