#
class ResourceSerializer < ActiveModel::Serializer
  attributes :id, :type, :description, :profile_id
end
