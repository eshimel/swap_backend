#
class AddAcceptedToTrades < ActiveRecord::Migration
  def change
    add_column :trades, :accepted, :boolean, :default => false
  end
end
