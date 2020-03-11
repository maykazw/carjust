module Offers
  class SearchOfferService < BaseService
    def initialize(args)
      self.title = args.fetch(:title)
      self.limited = args.fetch(:limit,5)
      self.max_id = args.fetch(:max_id,nil)
    end

    def call
      offers = Car.where("title ILIKE ?", "%#{title}%").order(:id)
      offer_list = max_id.nil? ? offers : offers.where("id > ? ",max_id)
      return {status: "success", response: offer_list}
    end
    private
    attr_accessor :title,:limited,:max_id
end
end