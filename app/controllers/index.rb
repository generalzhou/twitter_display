get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/:username' do
  erb :index
end

get '/:username/tweets' do 
  user = TwitterUser.find_or_create_by_username(params[:username])
  @tweets = user.grab_tweets
  erb :_tweets, :layout => false
end

