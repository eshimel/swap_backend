#
class ResourceSerializer < ActiveModel::Serializer
  attributes :id, :category, :description, :profile_id
end
