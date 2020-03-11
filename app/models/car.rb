class Car < ApplicationRecord
  has_one :picture, as: :target, class_name: 'Attachment', dependent: :destroy
  validates :title, presence: true, length: { in: 1..250 }

end
