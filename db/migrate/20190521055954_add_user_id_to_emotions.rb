class AddUserIdToEmotions < ActiveRecord::Migration[5.2]
  def up
    execute 'DELETE FROM emotions;'
    add_reference :emotions, :user, null: false, index: true, default: 0
  end

  def down
    remove_reference :emotions, :user, index: true
  end
end
