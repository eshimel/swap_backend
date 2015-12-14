class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :type
      t.text :description
      t.integer :profile_id
      t.foreign_key :profiles, :column => :profile_id, :dependent => :delete
      t.timestamps null: false
    end
  end
end
