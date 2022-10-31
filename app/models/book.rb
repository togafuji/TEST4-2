class Book < ApplicationRecord

  require 'pry'
 
  belongs_to :user
  has_many :reservations
  mount_uploader:room_image,RoomImageUploader
  has_one_attached :room_image
  
  validates :room_name, presence: true
  validates :room_introduce, presence: true
  validates :fee, presence: true
  validates :addres, presence: true
  validates :room_image, presence: true

end
