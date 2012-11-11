class Program < ActiveRecord::Base
  attr_accessible :duration, :name, :starttime, :description, :shortdescription, :channel_id
  has_many :posts
  belongs_to :channel
  validates :duration, :presence => true
  validates :name, :presence => true
  validates :starttime, :presence => true
  validates :description, :presence => true
  # shortdesc is sometimes empty
  # validates :shortdescription, :presence => true
  validates :channel_id, :presence => true

  #validates :name, :starttime, :channel_id, :uniqueness => true
  validates :name, :presence => true, :uniqueness => {:scope => [:starttime, :channel_id]}

end
