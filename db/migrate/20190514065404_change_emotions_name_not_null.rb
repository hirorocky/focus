class ChangeEmotionsNameNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :emotions, :name, false
  end
end
