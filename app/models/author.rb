class Author < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :phone_number, length: { is: 10 }
end
