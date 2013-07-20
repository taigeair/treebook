class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :first_name, :last_name, :profile_name, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :profile_name, presence: true,
                           uniqueness: true,
                           format: {
                              with: /^[a-zA-Z0-9_-]+$/,
                              message: 'Must be formatted correctly.'
                          }
  has_many :statuses
  
  def full_name
    first_name  + " " + last_name
  end
  
  def gravatar_url
    stripped_email = email.strip
    lowercase_email = stripped_email.downcase
    hash = Digest::MD5.hexdigest(lowercase_email)
    
    "http://www.gravatar.com/avatar/#{hash}?s=100"
  end
end
