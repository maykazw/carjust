class Attachment < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_one_attached :file
  validates :file, presence: true

  belongs_to :target, polymorphic: true, optional: true

  def file_url
    rails_blob_url(file)
  end

  def file_path
    ActiveStorage::Blob.service.send(:path_for,file.key)
  end

  def file_name
    file.filename.base.to_s
  end

  def file_extension
    file.filename.extension_without_delimiter.to_s
  end

  def meta
    {
        :width=> file.metadata[:width],
        :height=> file.metadata[:height],
        :size=> (file.byte_size / 1024.0).round(2),
        :content_type=> file.content_type
    }
  end
end
