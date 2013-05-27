get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/:username' do
  
  # @tweets = Twitter.user_timeline(:screen_name => params[:username], :count => 1)
  # erb :index


  user = TwitterUser.find_or_create_by_username(params[:username])
  @tweets = user.grab_tweets
  erb :index
end
