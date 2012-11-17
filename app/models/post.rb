class Post < ActiveRecord::Base
  attr_accessible :content, :timestamp, :user_id, :program_id

  belongs_to :user
  belongs_to :program
  validates :content,  :presence => true
  validates :timestamp, :presence => true
  validates :user_id, :presence => true

end