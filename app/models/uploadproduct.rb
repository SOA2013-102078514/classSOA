class Uploadproduct < ActiveRecord::Base
  attr_accessible :title, :discription

  validates_presence_of :title, :discription

end
