class Uploadproduct < ActiveRecord::Base
  attr_accessible :title, :discription, :user_id
  validates_presence_of :title, :discription
  belongs_to :user

end
