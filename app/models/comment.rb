class Comment < ApplicationRecord
  belongs_to :article
  validates :name, :comment, presence: true
end
