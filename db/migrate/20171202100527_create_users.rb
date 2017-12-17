class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|

      # auth stuff      
      t.string   :name
      t.boolean  :admin, default: false
      t.string   :remember_digest
      t.string   :access_token, index: true, unique: true
      t.string   :reset_digest
      t.datetime :reset_sent_at

      t.string :email, null: false, default: ""
      t.string :password_digest, null: false, default: ""


      # app stuff
      # t.string :kind, default: "ordinary"

      t.string :username
      t.string :first_name #, default: "First Name"
      t.string :last_name #, default: "Last Name"

      t.string :phone #, default: "phone number shows here"      t.date :birthday
      t.string :gender
      
      t.string :genre1 #, default: "ordinary"
      t.string :genre2 #, default: "ordinary"
      t.string :genre3 #, default: "ordinary"

      t.string :artist1 #, default: "ordinary"
      t.string :artist2 #, default: "ordinary"
      t.string :artist3 #, default: "ordinary"

      t.string :status
      t.text :about
      t.string :photo # second priority from fb or google
      
      t.integer  :viewcount, default: 0

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :username              # added by Jun
  end
end