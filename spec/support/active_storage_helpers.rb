module ActiveStorageHelpers
  def file_fixture(fixture_name = 'milk.jpg')
    file_fixture_path = Rails.root.join('spec/fixtures/files')
    path = Pathname.new(File.join(file_fixture_path, fixture_name))

    if path.exist?
      path
    else
      msg = "the directory '%s' does not contain a file named '%s'"
      raise ArgumentError, msg % [file_fixture_path, fixture_name]
    end
  end

  def create_file_blob(filename: 'milk.jpg', content_type: 'image/jpeg', metadata: nil)
    ActiveStorage::Blob.create_after_upload! io: file_fixture(filename).open, filename: filename, content_type: content_type, metadata: metadata
  end
end