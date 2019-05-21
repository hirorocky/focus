class RemoveColorFromEmotion < ActiveRecord::Migration[5.2]
  def change
    remove_column :emotions, :color_r, :integer
    remove_column :emotions, :color_g, :integer
    remove_column :emotions, :color_b, :integer
  end
end
