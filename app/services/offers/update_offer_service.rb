module Offers
  class UpdateOfferService < BaseService
    def initialize(args)
      self.image_id = args.fetch(:image_id,nil)
      self.title = args.fetch(:title)
      self.offer_id = args.fetch(:id)
      self.description = args.fetch(:description)
      self.price = args.fetch(:price)
    end

    def call
      offer = Car.find_by(:id=>offer_id)
      return {status: "errors", error_no: 404, response: "Not found" } if offer.nil?
      if offer.update(:title=>title,:description=>description,:price=>price)
        return {status: "success", response: offer}
      else
        return {status: "errors",error_no: 422, response: offer.errors }
      end
    end
    private
    attr_accessor :image_id, :title,:description,:price,:offer_id
end
end