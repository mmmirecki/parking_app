class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.string :user_name
      t.date :time_booked
      t.references :parking_spot, null: false, foreign_key: true

      t.timestamps
    end
  end
end
