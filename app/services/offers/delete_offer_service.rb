module Offers
  class DeleteOfferService < BaseService
    def initialize(args)
      self.id = args.fetch(:id)
    end

    def call
      offer = Car.find_by(:id=>id)
      return {status: "errors", error_no: 404, response: "Not found" } if offer.nil?
      if offer.destroy
        return {status: "success", response: "Deleted successfully"}
      else
        return {status: "errors",error_no: 422, response: offer.errors }
      end
    end
    private
    attr_accessor :id
end
end