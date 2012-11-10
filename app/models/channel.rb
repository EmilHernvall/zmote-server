class Channel < ActiveRecord::Base
  attr_accessible :name, :iconURL, :channelURL
  has_many :programs
  validates :name, :uniqueness => true, :presence => true
  validates :iconURL, :channelURL, :presence => true
end
