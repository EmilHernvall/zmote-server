class Channel < ActiveRecord::Base
  attr_accessible :name, :iconURL, :channelURL, :program_id

  validates :name, :uniqueness => true, :presence => true
  validates :iconURL, :channelURL, :program_id, :presence => true
end
