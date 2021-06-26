class Event < ApplicationRecord
  validates :number, :plan_day, :tel, :last_name, :first_name, :last_name_kana, :first_name_kana, :email, :start_time,  presence: true

end

