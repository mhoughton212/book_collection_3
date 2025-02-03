class User < ApplicationRecord
    # associations
    has_many :books, dependent: :destroy
    
    # validations
    # e.g., validates :email, presence: true
  
    # additional user logic...
  end
  