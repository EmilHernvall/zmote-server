class Comment < ActiveRecord::Base
  attr_accessible :content, :post_id, :user_id, :username
  belongs_to :post
  belongs_to :user

  validates :post_id, :presence => true
  validates :username, :presence => true
  validates :content, :presence => true

end
