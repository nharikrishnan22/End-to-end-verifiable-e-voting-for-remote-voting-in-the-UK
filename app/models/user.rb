class User < ApplicationRecord
  
  has_secure_password
  validates :email, presence: true, uniqueness: true # make sure that same email cannot be used twice
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :dateofbirth, presence: true
  
end