#
class TradeSerializer < ActiveModel::Serializer
  attributes :id, :giver_id, :receiver_id, :resources_id
end
