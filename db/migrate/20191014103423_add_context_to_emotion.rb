class AddContextToEmotion < ActiveRecord::Migration[6.0]
  def change
    add_column :emotions, :context, :text, default: ""
  end
end
