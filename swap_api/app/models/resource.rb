class Resource < ActiveRecord::Base
    belongs_to :giver, class_name: 'Profile'
  belongs_to :receiver, class_name: 'Profile'
 # belongs_to :trade
end
