module Offers
  class CreateOfferService < BaseService
    def initialize(args)
      self.image_id = args.fetch(:image_id,nil)
      self.title = args.fetch(:title)
      self.description = args.fetch(:description)
      self.price = args.fetch(:price)
    end

    def call
      offer = Car.new(:title=>title,:description=>description,:price=>price)
      if !image_id.blank? && image_id.to_i > 0
        attachment = Attachment.find_by(:id=>image_id)
        return {status: "errors", error_no: 404,response: "Attachment not found" } if attachment.nil?
      end
      if offer.save
        unless attachment.nil?
          attachment.update!(target: offer)
        end
        return {status: "success", response: offer}
      else
        return {status: "errors", error_no: 422,response: offer.errors }
      end
    end
    private
    attr_accessor :image_id, :title,:description,:price
end
end