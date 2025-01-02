class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :lists, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  validates :name, presence: true, length: { maximum: 50 }
end
