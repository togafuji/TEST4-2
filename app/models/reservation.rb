class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :book
  
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :people, presence: true
  validate :errors_matter
  def errors_matter
    errors.add(:start_date, "は終了日以前の日付にしてください") if start_date > end_date
    errors.add(:start_date, "は本日以降の日付にしてください") if start_date.strftime('%Y-%m-%d') < Date.current.strftime('%Y-%m-%d')
    errors.add(:people, "は一人以上にしてください") if people < 1 
  end
end
