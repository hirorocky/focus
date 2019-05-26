class AddDetailToEmotions < ActiveRecord::Migration[5.2]
  def change
    add_column :emotions, :detail, :text
  end
end
