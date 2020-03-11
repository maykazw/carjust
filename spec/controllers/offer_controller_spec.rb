require 'rails_helper'

RSpec.describe 'offers Controller', :type => :request do
  describe "POST /offers" do
    subject { post '/offers', params: params.to_json, :headers => {'Content-Type' => 'application/json'} }
    context 'Create success' do
      let!(:attachment) { create(:attachment) }
      let!(:params) do
        {
            "title" => "Honda",
            "image_id" => attachment.id,
            "description" => "Lepsza niz wygląda",
            "price" => 123.11
        }
      end
      before { subject }
      it 'returns ok' do
        expect(response.status).to eq 200
      end
    end
  end
  describe "Edit /offer/" do
    let!(:car) { create(:car) }

    subject { patch "/offers/#{car.id}", params: params.to_json, :headers => {'Content-Type' => 'application/json'} }
    context 'edit success' do
      let!(:params) do
        {
            "title" => "Golf",
            "description" => "Gti",
            "price" => 123.11
        }
      end
      before { subject }
      it 'returns ok' do
        expect(response.status).to eq 200
      end
    end
  end
  describe "Search /offer/" do
    let!(:car) { create(:car) }
    let!(:car2) { create(:car) }
    let!(:car3) { create(:car) }
    let!(:car4) { create(:car) }
    subject { get "/offers/search?title=#{car.title}", :headers => {'Content-Type' => 'application/json'} }
    context 'search success' do
      before { subject }
      it 'returns ok' do
        expect(response.status).to eq 200
      end
    end
  end
  describe "Delete /offer/:id" do
    let!(:car) { create(:car) }
    subject { delete "/offers/#{car.id}", :headers => {'Content-Type' => 'application/json'} }
    context 'delete success' do
      before { subject }
      it 'returns ok' do
        expect(Car.all.count).to eq 0
        expect(response.status).to eq 200
      end
    end
  end

  describe "Show /offer/:id" do
    let!(:car) { create(:car) }
    subject { get "/offers/#{car.id}", :headers => {'Content-Type' => 'application/json'} }
    context 'delete success' do
      before { subject }
      it 'returns ok' do
        expect(response.status).to eq 200
      end
    end
  end

  describe "Show /offers" do
    let!(:car) { create(:car) }
    let!(:car2) { create(:car) }
    let!(:car3) { create(:car) }
    let!(:car4) { create(:car) }
    let!(:car5) { create(:car) }
    let!(:car6) { create(:car) }
    context 'list success' do
      subject { get "/offers/", :headers => {'Content-Type' => 'application/json'} }
      before { subject }
      it 'returns ok' do
        expect(response.status).to eq 200
      end
      end
    context 'list success last' do
      subject { get "/offers?max_id=#{car5.id}", :headers => {'Content-Type' => 'application/json'} }
      before { subject }
      it 'returns ok' do
        expect(response.status).to eq 200
      end
    end
  end
end