class Genre < ApplicationRecord
  has_many :breeds
  validates :name, presence: true
end
