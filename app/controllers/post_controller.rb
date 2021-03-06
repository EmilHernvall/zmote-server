class PostController < ApplicationController

=begin
  Inserts user in the database with the url:
  rails.z-app.se/post/insert_user
=end
  def insert_user
    name = params[:name]
    email = params[:email]
    render :json => User.create(:name => name, :email => email)
  end


=begin
  Inserts program in the database with the url:
  rails.z-app.se/post/insert_program
  Parameters:
  Name
  Duration
  Starttime
  Description
  Shortdescription
  Channel_name
=end
  def insert_program
    name = params[:name]
    duration = params[:duration]
    #start_time = params[:starttime]
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
    program_name = params[:program_name]
    content = params[:content]
    #startTime = DateTime.new(params[:year].to_i + 1900, params[:month].to_i, params[:day].to_i, params[:hours].to_i, params[:minutes].to_i, 0)
    channelName = params[:channel_name]
    #timestamp = DateTime.parse(params[:timestamp])
    startTime = DateTime.new(params[:year].to_i + 1900, params[:month].to_i, params[:day].to_i, params[:hours].to_i, params[:minutes].to_i, 0)
    #theUser = User.where(:name => username)
  #if theUser != []
      #theProgram = Program.where(:name => program_name)

      #if theProgram != []
        thePost = Post.new
        #thePost.user = theUser[0]
        thePost.username = username
        #thePost.program = theProgram[0]
        thePost.program_name = program_name
        thePost.channel_name = channelName
        thePost.content = content
        thePost.starttime=startTime
        #thePost.timestamp = timestamp
        thePost.save
        render :json => thePost

      #else
      #  render :text => "The program query returned null."
      #end
    #else
    #  render :json => "The user query returned null."
    #end
  end

  def insert_comment
    username = params[:username]
    postId = params[:post_id]
    content = params[:content]
    #timestamp = DateTime.parse(params[:timestamp])

    #theUser = User.where(:name => username)
    #if theUser != []
      thePost = Post.find(postId)
      thePost.save
      theComment = Comment.new
      #theComment.user = theUser[0]
      theComment.username = username
      theComment.post = thePost
      theComment.content = content
      #theComment.timestamp = timestamp
      theComment.save
      render :json => theComment

    #else
    #  render :json => nil
    #end
  end

  def get_comments_by_postid
    render :json => Comment.where(:post_id => params[:post_id])
  end

  def get_post_by_program
    programName = params[:program_name]
    #startTime = DateTime.parse(params[:start_time])
    startTime = DateTime.new(params[:year].to_i + 1900, params[:month].to_i, params[:day].to_i, params[:hours].to_i, params[:minutes].to_i, 0)

    #render :text => startTime

    channelName = params[:channel_name]

    #theChannel = Channel.where(:name => channelName)
    #theProgram = Program.where(:name => programName, :starttime => startTime.to_time, :channel_id => theChannel[0].id)
    #theProgram = Program.where(:name => programName, :channel_id => theChannel[0].id)
    #render :json => Post.where(:program_id => theProgram[0].id)
    render :json => Post.where(:program_name => programName, :channel_name => channelName, :starttime => startTime.to_time)
     #render :json => Program.find(1).starttime
    #render :json => Post
  end

  def get_user_by_id
    render :json => User.where(:id => params[:id])
  end
end
