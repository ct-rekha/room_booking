class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
    	has_many :users
    	t.string :name
    	t.text :description
    end
  end
end
