class Article < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  attachment :image
  validates :title, :sentence,  presence: true
end
