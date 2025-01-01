class Category < ApplicationRecord
  has_many :lists

  validates :name, presence: true
  validates :color, format: { with: /\A#[0-9A-Fa-f]{6}\z/, message: "deve ser um código hexadecimal válido (e.g., #FF5733)" }, allow_blank: true
end
