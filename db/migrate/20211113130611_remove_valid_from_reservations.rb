class RemoveValidFromReservations < ActiveRecord::Migration[6.1]
  def change
    remove_column :reservations, :valid, :boolean
  end
end
