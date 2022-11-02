class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.integer :people
      t.integer :total_price
      t.integer :total_day

      t.timestamps
    end
  end
end
