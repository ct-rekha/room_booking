class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
    	t.datetime :start_time
    	t.datetime :end_time
    	t.belongs_to :room, foreign_key: true
    	t.belongs_to :user, foreign_key: true
    end
  end
end
