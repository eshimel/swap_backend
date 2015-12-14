class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.references :giver, null: false
      t.references :receiver, null: false
      t.references :resource, index: true, null: false
      t.timestamps null: false
    end

    add_index :trades, :giver_id
    add_index :trades, :receiver_id
    add_foreign_key :trades, :profiles, column: :giver_id, on_delete: :cascade
    add_foreign_key :trades, :profiles, column: :receiver_id, on_delete: :cascade
    add_foreign_key :trades, :resources, on_delete: :cascade
  end
end
