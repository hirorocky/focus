class AddColorToEmotion < ActiveRecord::Migration[5.2]
  def change
    add_column :emotions, :color, :string
  end
end
