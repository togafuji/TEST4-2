class ChangeDatatypeBookIdOfReservations < ActiveRecord::Migration[7.0]
  def change
    change_column :reservations, :book_id, :integer
  end
end
