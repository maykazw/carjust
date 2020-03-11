require 'rails_helper'

RSpec.describe 'Attachments', :type => :request do
  let(:v) { '/attachments'}

  describe 'POST /attachments' do
    let(:params) { { file: file }}
    let(:content_type) { nil }
    let(:file) { fixture_file_upload(file_fixture('milk.jpg')) }
    subject { post v, params: params }
    context 'user sends valid file' do
           it 'returns success operation' do
        expect { subject }.to(change { Attachment.count }.from(0).to(1))
        expect(response.status).to eq 200
      end
    end
  end

  describe 'DELETE /attachments/:id' do
    let!(:attachment) { create(:attachment) }
    subject { delete "#{v}/#{attachment.id}", headers: {'Content-Type' => 'application/json'} }

    context 'user sends a new valid file' do
      it 'returns success operation' do
        expect { subject }.to(change { Attachment.count }.from(1).to(0))
        expect(response.status).to eq 200
      end
    end
  end
end
