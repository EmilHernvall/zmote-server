class TestController < ApplicationController
  # layout "no_html_tags"
  
  def get_posts_by_user
    name = params[:name]
    render :json => User.where(:name => name)
  end

  def get_posts_by_email
    email = params[:email]
    render :json => User.where(:email => email)
  end

  def insert_user
    name = params[:name]
    email = params[:email]
    render :json => User.create(:name => name, :email => email)
  end

  def insert_program
    name = params[:name]
    duration = params[:duration]
    start_time = params[:starttime]
    description = params[:description]
    short_description = params[:shortdescription]
    channel_name = params[:channel_name]
    theChannel = Channel.where(:name => channel_name)

    theProgram = Program.new
    theProgram.name = name
    theProgram.duration = Time.parse(duration)
    theProgram.starttime = DateTime.parse(start_time)
    theProgram.description = description
    theProgram.shortdescription = short_description

    theProgram.channel_id = theChannel
    render :json => theProgram.save
  end

  def insert_channel
    name = params[:name]
    iconURL = params[:iconURL]
    channelURL = params[:channelURL]
    theChannel = Channel.new
    theChannel.name = name
    theChannel.iconURL = iconURL
    theChannel.channelURL = channelURL
    render :json => theChannel.save

  end

  def insert_post
    username = params[:username]
    program_name = params[:program_name]
    content = params[:content]
    timestamp = DateTime.parse(params[:timestamp])

    theUser = User.where(:name => username)
    if theUser != []
      theProgram = Program.where(:name => program_name)

      thePost = Post.new
      thePost.user = theUser
      thePost.program = theProgram
      thePost.content = content
      thePost.timestamp = timestamp
      render :json => thePost.save
    else
      render :json => nil
    end

  end

  def get_posts_by_user
    username = params[:username]
    theUser = User.where(:name => username)
    render :json => Post.where(:user_id => theUser[0].id)
  end

  def parseJson(jsonObject)
    hash = JSON.parse(jsonObject)
    return hash['firstName']
  end

  def get_program_by_id
    render :json => Program.where(:id => params[:program_id])
  end

  def get_channel_by_id
    render :json => Channel.where(:id => params[:channel_id])
  end

  def get_comments_by_postid
    render :json => Comment.where(:post_id => params[:post_id])
  end
 
end
