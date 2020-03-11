Dir[Rails.root.join('spec/support/active_storage_helpers.rb')].each { |f| require f }
include ActiveStorageHelpers
FactoryBot.define do
  factory :attachment do
    target {nil}
    after(:build) do |obj|
      obj.file.attach(create_file_blob)
    end
  end
end
