class User < ActiveRecord::Base
  has_secure_password

  # with rails 4 we don't want this line coz we have strong_attributes
  #attr_accessible :email , :password , :password_confirmation #http://stackoverflow.com/questions/3136420/difference-between-attr-accessor-and-attr-accessible

  validate :email , uniqueness: true
end
