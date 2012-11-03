class Post < ActiveRecord::Base
  attr_accessible :content, :timestamp, :user_id

  validates :content,  :presence => true
  validates :timestamp, :presence => true
  validates :user_id, :presence => true

  belongs_to :user

end