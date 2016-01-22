class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
   	   t.string :nick_name, null: false
   	   t.string :first_name
       t.string :last_name
       t.string :email, null: false
	   t.string :password_digest
	   t.boolean :admin
	   t.string :profile_photo
       t.timestamps null: false
    end
    add_index :users, :nick_name, unique: true
    add_index :users, :email, unique: true
  end
end
