class Breed < ApplicationRecord

  belongs_to :genre, optional:true
  attachment :image
  validates :title, :sentence,  presence: true

end
