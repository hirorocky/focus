class RemoveDetailFromEmotions < ActiveRecord::Migration[6.0]
  def change
    remove_column :emotions, :detail, :text
    remove_column :emotions, :shape, :integer
  end
end
