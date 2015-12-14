class Trade < ActiveRecord::Base

  belongs_to :giver, class_name: "Profile"
  belongs_to :receiver, class_name: "Profile"
  belongs_to :resource

  validates :resource_id, presence: true
  validates :giver, presence: true
  validates :receiver, presence: true
end
