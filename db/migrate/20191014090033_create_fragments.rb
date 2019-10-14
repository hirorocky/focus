class CreateFragments < ActiveRecord::Migration[6.0]
  def change
    create_table :fragments do |t|
      t.text :content
      t.references :tag, null: false, foreign_key: true
      t.references :emotion, null: false, foreign_key: true

      t.timestamps
    end
  end
end
