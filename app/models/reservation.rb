class Reservation < ApplicationRecord
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :people, presence: true
  
  belongs_to :user
  belongs_to :book
end
