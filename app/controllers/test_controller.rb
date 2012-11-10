class TestController < ApplicationController
  # layout "no_html_tags"

  def index

  end

  def json
    render :json => User.first
  end
  
  def some_action
    id = params[:id]
    name = params[:name]
    print 'hej'
    # Do some stuff, can't get the id value from the url
  end
  
 
end
