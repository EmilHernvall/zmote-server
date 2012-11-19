class PostController < ApplicationController

  def insert_user
    name = params[:name]
    email = params[:email]
    render :json => User.create(:name => name, :email => email)
  end


=begin
  Inserts program in the database with the url:
  rails.z-app.se/post/insert_program
=end
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
    # Changes the '.' to ':'. Otherwise the Time.parse thinks the time is a date.
    for i in 0..duration.length
      if duration[i] == '.'
        duration[i] = ':'
      end
    end
    theProgram.duration = (duration)
    theProgram.starttime = DateTime.parse(start_time)
    theProgram.description = description
    theProgram.shortdescription = short_description

    theProgram.channel = theChannel[0]
    # render :json => theProgram.save
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
    program_name = params[:program_name].html_safe
    content = params[:content]
    #timestamp = DateTime.parse(params[:timestamp])

    theUser = User.where(:name => username)
    if theUser != []
      theProgram = Program.where(:name => program_name)

      if theProgram != []
        thePost = Post.new
        thePost.user = theUser[0]
        thePost.program = theProgram[0]
        thePost.content = content
        #thePost.timestamp = timestamp
        render :json => thePost.save

      else
        render :text => "The program query returned null."
      end
    else
      render :json => "The user query returned null."
    end
  end
  def insert_comment
    username = params[:username]
    postId = params[:post_id]
    content = params[:content]
    #timestamp = DateTime.parse(params[:timestamp])

    theUser = User.where(:name => username)
    if theUser != []
      thePost = Post.where(:id => postId)

      theComment = Comment.new
      theComment.user = theUser[0]
      theComment.post = thePost[0]
      theComment.content = content
      #theComment.timestamp = timestamp
      render :json => theComment.save
    else
      render :json => nil
    end
  end
  def get_post_by_program
    programName = params[:program_name]
    #startTime = DateTime.parse(params[:start_time])
    startTime = DateTime.new(params[:year], params[:month], params[:day], params[:hours], params[:minutes], "0")
    channelName = params[:channel_name]

    theChannel = Channel.where(:name => channelName)
    theProgram = Program.where(:name => :program_name, :starttime => startTime, :channel_id => theChannel[0].id)
    #theProgram = Program.where(:name => programName, :channel_id => theChannel[0].id)
    render :json => Post.where(:program_id => theProgram[0].id)
  end

  def get_user_by_id
    render :json => User.where(:id => params[:id])
  end
end