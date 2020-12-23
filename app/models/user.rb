class User < ApplicationRecord
  
  has_secure_password
  has_one_attached :avatar
  validates :email, presence: true, uniqueness: true # make sure that same email cannot be used twice
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :dateofbirth, presence: true
  validates :password, presence: true
  validates_length_of :password, minimum: 8
  
end