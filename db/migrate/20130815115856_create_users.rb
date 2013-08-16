class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid, null: false
      t.string :name
      t.string :nickname
      t.string :image
      t.string :token
      t.string :secret

      t.timestamps
    end
    add_index :users, :uid, unique: true
  end
end
