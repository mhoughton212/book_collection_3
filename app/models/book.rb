class Book < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true
  validates :author, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :published_date, presence: true

end
