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
      # ch.iconURL = '/mdio/channelicon?onid=' + channel['onid'].to_s() + '&tsid='+ channel['tsid'].to_s() + '&sid=' + channel['sid'].to_s()
      ch.iconURL = 'hej'
      ch.save
      ch = Channel.where(:name => channel['name'])
      #break
      for program in channel['programs']
        prog = Program.new
        duration = program['duration']
        intDuration = duration.split(".").map(&:to_i)
        minutes = intDuration[0] * 60 + intDuration[1];
        prog.duration = minutes
        prog.name = program['name']
        prog.starttime = DateTime.parse(program['start'])
        prog.description = program['exttext']
        prog.shortdescription = program['shorttext']
        prog.channel_id = ch[0]
        prog.save
      end
    end
 end
end