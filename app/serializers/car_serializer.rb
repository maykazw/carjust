class CarSerializer < ActiveModel::Serializer
  attributes :id, :picture,:title,:description,:price

  def price
    object.price.round(2)
  end

  def picture
    AttachmentSerializer.new(object.picture) if object.picture
  end
end
