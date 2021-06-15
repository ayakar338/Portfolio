class Reservation < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :email, presence: true
  validates :address, presence: true
  validates :telephone, presence: true

end
