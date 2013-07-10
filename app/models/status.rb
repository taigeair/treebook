class Status < ActiveRecord::Base
  attr_accessible :content, :name, :user_id
  belongs_to :user
end
