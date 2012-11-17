class PreviewController < ApplicationController
  def index
  end

=begin
  Gets the full EPG from a STB and updates the Channel and Program models
=end
  def get_epg
    require 'json'
    require 'net/http'
    require 'time'
    epg = Net::HTTP.get('130.236.248.226', '/mdio/epg')
    epg = JSON.parse(epg)

    for channel in epg
      ch = Channel.new
      ch.name = channel['name']
      ch.channelURL = channel['url']
      # iconURL needs the adress to a STB that the server don't know.
      ch.iconURL = '/mdio/channelicon?onid=' + channel['onid'].to_s() + '&tsid='+ channel['tsid'].to_s() + '&sid=' + channel['sid'].to_s()
      ch.save
      # ch = Channel.where(:name => channel['name'])
      #break
      for program in channel['programs']
        prog = Program.new
        duration = program['duration']
        for i in 0..duration.length
          if duration[i] == '.'
            duration[i] = ':'
          end
        end
        prog.duration = Time.parse(duration)
        prog.name = program['name']
        
        prog.starttime = DateTime.parse(program['start'])
        prog.description = program['exttext']
        prog.shortdescription = program['shorttext']
        prog.channel_id = ch
        prog.save
        # return program['exttext']
        break
      end
      break
    end
    return ch.iconURL
    # id: integer, name: string, channel_id: integer, duration: time, starttime: datetime, description: string, shortdescription: string,
  end
  
  # def return_epg
  #   class Epg
  #     
  #   end
  # end
  

end