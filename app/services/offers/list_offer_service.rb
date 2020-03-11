module Offers
  class ListOfferService < BaseService
    def initialize(args)
      self.limited = args.fetch(:limit,5)
      self.max_id = args.fetch(:max_id,nil)
    end

    def call
      offers = Car.all.limit(limited).order(:id)
      offer_list = max_id.nil? ? offers : offers.where("id > ? ",max_id)
      return {status: "success", response: offer_list}
    end
    private
    attr_accessor :limited, :max_id
end
end