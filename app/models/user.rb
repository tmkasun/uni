class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,:recoverable, :rememberable, :trackable,:validatable, :authentication_keys => [:registration_number]
  # remove :registerable temporaly
  validates :registration_number , presence: true , uniqueness: true
  has_one :profile
  def email_required?
    false
  end
  
  def email_changed?
    false
  end
end
