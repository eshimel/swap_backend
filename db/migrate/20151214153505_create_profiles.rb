class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :username
      t.string :studio
      t.string :website
      t.integer :user_id
      t.foreign_key :users, :column => :user_id, :dependent => :delete

      t.timestamps null: false
    end
  end
end
