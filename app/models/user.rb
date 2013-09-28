class User < ActiveRecord::Base
  has_secure_password
  
  validates_length_of :password, within: 3..20
  validates :email , presence: true, email: true , uniqueness: true
end
