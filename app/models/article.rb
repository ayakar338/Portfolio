class Article < ApplicationRecord

  attachment :image
  validates :title, :sentence,  presence: true
end
