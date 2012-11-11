class PreviewController < ApplicationController
  def index
    
  end
  
  def get_epg
     require 'json'
     require 'net/http'
     epg = Net::HTTP.get('130.236.248.227', '/mdio/epg') 
     epg = JSON.parse(epg)
     
     for channel in epg
      	ch = Channel.new
      	ch.name = channel['name']
      	ch.channelURL = channel['url']
      	ch.iconURL = channel['url']
      	ch.save 
        return ch
      	
        ch = Channel.where(name = channel['name'])
        for program in channel['programs']
          prog = Program.new
          prog.name = program['name']
          prog.starttime = program['start']
          break
        end
        break
      end
     # return epg
     # :duration, :name, :starttime, :description, :shortdescription, :channel_id
   end
end