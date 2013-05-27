class TwitterUser < ActiveRecord::Base
  
  has_many :tweets

  def grab_tweets
    if self.tweets.empty?
      self.fetch_tweets!
    elsif (Time.now - self.tweets.first.created_at) > [avg_time , 1].min
      puts 'Freshening up'
      self.fetch_tweets!
    end
    self.tweets
  end

  def avg_time
    all_times = self.tweets.map { |tweet| tweet.time_posted }
    avg = (Time.now - all_times.min )/10.0
    puts "AVERAGE TIME: #{avg}"
    return avg
  end

  def fetch_tweets!
    self.tweets.destroy_all
    tweet_data = Twitter.user_timeline(:screen_name => self.username, :count => 10 )
    tweet_data.each do |tweet|
      self.tweets << Tweet.create(text: tweet.text, time_posted: tweet.created_at)
    end
  end

  def no_new_tweets

  end

end
