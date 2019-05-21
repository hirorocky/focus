class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, default: "", limit: 30
      t.string :email, null: false, limit: 200
      t.string :password_digest, null: false

      t.timestamps

      t.index :email, unique: true
    end
  end
end
