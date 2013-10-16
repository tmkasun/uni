class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :registration_number
  #attr_accessible :registration_number
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable , :authentication_keys => [:registration_number]

  validates :registration_number , presence: true, uniqueness: true
  def email_required?
    false

  end

  def email_changed?

    false

  end

end
