class OffersController < ApplicationController

  def index
    search_offer = Offers::ListOfferService.call(list_params)
    render json: search_offer[:response],:each_serializer=>CarSerializer
  end

  def show
    render json: Car.find(params[:id]),:serializer=>CarSerializer
  end

  def search
    search_offer = Offers::SearchOfferService.call(search_params)
    render json: search_offer[:response],:each_serializer=>CarSerializer
  end

  def create
    create_offer = Offers::CreateOfferService.call(create_params)
    if create_offer[:status] == "success"
      render json: create_offer[:response],:serializer=>CarSerializer
    else
      render json: create_offer[:response], status: create_offer[:error_no]
    end
  end

  def update
    update_offer = Offers::UpdateOfferService.call(update_params)
    if update_offer[:status] == "success"
      render json: update_offer[:response],:serializer=>CarSerializer
    else
      render json: update_offer[:response], status: update_offer[:error_no]
    end
  end

  def destroy
    update_offer = Offers::DeleteOfferService.call(delete_params)
    if update_offer[:status] == "success"
      render json: update_offer[:response]
    else
      render json: update_offer[:response], status: update_offer[:error_no]
    end
  end

  protected

  def create_params
    params.require(:title)
    params.permit(:title, :description, :price, :image_id)
  end

  def search_params
    params.require(:title)
    params.permit(:title,:limit,:max_id)
  end

  def list_params
    params.permit(:limit,:max_id)
  end

  def update_params
    params.require(:title)
    params.require(:id)
    params.permit(:title, :id,:description, :price, :image_id)
  end

  def delete_params
    params.require(:id)
    params.permit(:id)
  end
end
