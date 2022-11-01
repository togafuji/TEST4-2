class ChangeDatatypeUserIdOfReservations < ActiveRecord::Migration[7.0]
  def change
    change_column :reservations, :user_id, :integer
  end
end
