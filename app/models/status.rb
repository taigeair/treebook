class Status < ActiveRecord::Base
  attr_accessible :content, :name, :user_id
  belongs_to :user
  
  validates :content, presence: true,
                      length: {minimum: 6}
  
  validates :user_id, presence: true
end
