class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  #:recoverable, 

  # Setup accessible (or protected) attributes for your model
  attr_accessible :fullname, :username, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  
  # disable the email field
  def email_required?
    false
  end

  def email_changed?
    false
  end

  def to_s
    fullname
  end
end
