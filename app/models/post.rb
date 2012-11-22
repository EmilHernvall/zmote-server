class Post < ActiveRecord::Base
  attr_accessible :content, :timestamp, :user_id, :program_id, :program_name, :starttime, :channel_name

  belongs_to :user
  belongs_to :program
  has_many :comments
  validates :content,  :presence => true
  validates :user_id, :presence => true

end