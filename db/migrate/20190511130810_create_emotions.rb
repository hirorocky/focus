class CreateEmotions < ActiveRecord::Migration[5.2]
  def change
    create_table :emotions do |t|
      t.string :name
      t.integer :shape
      t.integer :color_r
      t.integer :color_g
      t.integer :color_b

      t.timestamps
    end
  end
end
