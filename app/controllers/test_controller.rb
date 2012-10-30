class Person
  attr_accessor :fname, :lname
end

class TestController < ApplicationController
  # layout "no_html_tags"

  def index
    
  end
  
  def json
    p = Person.new
    p.fname = "Viktor"
    p.lname = "Dahl"
    render :json => p
  end
  
  def http_request1
     render :text => 
     "ID: "+
     params[:id]+
     "\n"+"asdf"+"\n"
  end
  
  
end
