class Category < ApplicationRecord
  has_many :lists

  validates :name, presence: true
end
