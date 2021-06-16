class Contact < ApplicationRecord
  attr_accessor :name, :email, :message
  validates :name, :email, :message, presence: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
end
