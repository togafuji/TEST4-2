class CreateBooks < ActiveRecord::Migration[7.0]
  def change
      create_table :books do |t|
      t.string :room_name
      t.text :room_introduce
      t.integer :fee
      t.string :addres
      t.string :room_image

      t.timestamps
    end
  end
end
