class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.integer :uid, null: false
      t.string :email, null: false
      t.timestamps
    end
    add_index :users, :uid, unique: true
  end

  def self.down
    drop_table :users
  end
end
