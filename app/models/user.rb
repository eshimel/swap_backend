
class User < ActiveRecord::Base
  include Authentication
  # has_many :resources
  has_one :profile
end
