class TestController < ApplicationController
  # layout "no_html_tags"

  def index

  end

  def json
    # u = User.create( :email => "viktor.dahl@z-app.se", :firstName => "Viktor", :lastName => "Dahl")
    @users = User
    render :json => @users.first
  end

  def retrieve
    @users = User
  end
  
  def parseJson(jsonObject)
    hash = JSON.parse(jsonObject)
    return hash['firstName']
  end
  
end
