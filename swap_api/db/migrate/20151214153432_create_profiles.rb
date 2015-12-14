class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :username
      t.string :studio
      t.string :website
      t.references :user
      t.timestamps null: false
    end
  end
end
