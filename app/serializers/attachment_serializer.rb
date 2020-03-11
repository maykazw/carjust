class AttachmentSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :file_name,:file_url

  def file_url
    rails_blob_url(object.file)
  end
end
