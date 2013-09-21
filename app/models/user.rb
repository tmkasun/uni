class User < ActiveRecord::Base
  has_secure_password
  
  attr_accessible :email , :password , :password_confirmation #http://stackoverflow.com/questions/3136420/difference-between-attr-accessor-and-attr-accessible
  validate_uniqueness_of :email # or validate :email , uniqueness: true  
end
