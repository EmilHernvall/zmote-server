class PreviewController < ApplicationController
  def index
    @epg = get_epg
  end
  
  def get_epg
     require 'json'
     require 'net/http'
     epg = Net::HTTP.get('130.236.248.226', '/mdio/epg') 
     hash = JSON.parse(epg)
     return hash
   end
  
end
