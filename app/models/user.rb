class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,:recoverable, :rememberable, :trackable,:validatable, :authentication_keys => [:registration_number]
  # disable :registerable temporaly
  validates :registration_number , presence: true , uniqueness: true
  has_one :profile
  ROLES = %w[admin moderator guest banned student] #https://github.com/ryanb/cancan/wiki/Role-Based-Authorization
  
  before_create :set_user_profile #(influenced by) https://github.com/plataformatec/devise/wiki/How-To:-Add-a-default-role-to-a-User
  
  def email_required?
    false
  end
  
  def email_changed?
    false
  end
  
  private
  
  def set_user_profile
    
    related_profile = Profile.find(:first, :conditions => [ "lower(registration_number) = ?", self.registration_number.downcase ]) #http://stackoverflow.com/questions/2220423/case-insensitive-search-in-rails-model
    return false unless related_profile
    self.profile = related_profile
    
  end
end
