class Profile < ActiveRecord::Base
  include Authentication
  has_many :giver_trades, class_name:  'Trade',
                          foreign_key: 'giver_id',
                          dependent:   :destroy

  has_many :given_resources, through: :giver_resources, source: :resource
  has_many :received_resources, through: :receiver_resources, source: :resource
  has_many :givers, through: :giver_trades, source: :receiver

  has_many :receiver_trades, class_name:  'Trade',
                             foreign_key: 'receiver_id',
                             dependent:   :destroy

  has_many :borrowers, through: :borrower_loans, source: :loaner
end

