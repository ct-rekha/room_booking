class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
    	t.belongs_to :room
    	t.string :name
    	t.string :email
    	t.string :password_digest
    	t.timestamps
    end
  end
end
