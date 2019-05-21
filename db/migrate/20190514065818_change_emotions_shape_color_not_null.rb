class ChangeEmotionsShapeColorNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :emotions, :shape, false
    change_column_null :emotions, :color, false

  end
end
