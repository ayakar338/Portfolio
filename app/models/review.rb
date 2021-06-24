class Review < ApplicationRecord
  validates :text, :rate, presence: true
end
