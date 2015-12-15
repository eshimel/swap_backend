#
class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :username, :studio, :website, :user_id
end
