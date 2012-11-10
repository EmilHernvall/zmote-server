class Channel < ActiveRecord::Base
  attr_accessible :name, :iconURL, :channelURL

  validates :name, :uniqueness => true, :presence => true
  validates :iconURL, :channelURL, :presence => true
end
