class AddValidToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :reserved, :boolean
  end
end
