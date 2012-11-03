class Program < ActiveRecord::Base
  attr_accessible :duration, :name, :starttime, :description, :shortdescription, :post_id, :channel_id
  belongs_to :post
  validates :duration, :presence => true
  validates :name, :presence => true
  validates :starttime, :presence => true
  validates :description, :presence => true
  validates :shortdescription, :presence => true
  validates :post_id, :presence => true
  validates :channel_id, :presence => true

  #validates :name, :starttime, :channel_id, :uniqueness => true
  validates :name, :presence => true, :uniqueness => {:scope => [:starttime, :channel_id]}

end
