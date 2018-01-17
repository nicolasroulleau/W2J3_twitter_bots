# Load the twitter gem
require 'twitter'

# Load the dotenv gem
require 'dotenv'

# This tells dotenv to read the .env file and set the appropriate values in ENV
Dotenv.load

# Load the pry gem 
# require pry

# quelques lignes qui enregistrent les clés d'APIs avec DotEnv
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['TWITTER_API_KEY']
  config.consumer_secret     = ENV['TWITTER_API_SECRET']
  config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
  config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
end

p client

# ligne qui permet de tweeter
client.update('My first ruby tweet!!!!')

# ligne qui va twitter Bonjour Monde!
client.update('Bonjour Monde!')


#EXAMPLES

=begin
	
Usage Examples
After configuring a client, you can do the following things.

Tweet (as the authenticated user)
client.update("I'm tweeting with @gem!")

Follow a user (by screen name or user ID)
client.follow("gem")
client.follow(213747670)

Fetch a user (by screen name or user ID)
client.user("gem")
client.user(213747670)

Fetch a cursored list of followers with profile details (by screen name or user ID, or by implicit authenticated user)
client.followers("gem")
client.followers(213747670)
client.followers

Fetch a cursored list of friends with profile details (by screen name or user ID, or by implicit authenticated user)
client.friends("gem")
client.friends(213747670)
client.friends

Fetch the timeline of Tweets by a user
client.user_timeline("gem")
client.user_timeline(213747670)

Fetch the timeline of Tweets from the authenticated user's home page
client.home_timeline

Fetch the timeline of Tweets mentioning the authenticated user
client.mentions_timeline

Fetch a particular Tweet by ID
client.status(27558893223)

Collect the three most recent marriage proposals to @justinbieber
client.search("to:justinbieber marry me", result_type: "recent").take(3).collect do |tweet|
  "#{tweet.user.screen_name}: #{tweet.text}"
end

Find a Japanese-language Tweet tagged #ruby (excluding retweets)
client.search("#ruby -rt", lang: "ja").first.text

=end

# STREAMING

=begin

Streaming
Site Streams are restricted to whitelisted accounts. To apply for access, follow the steps in the Site Streams documentation. User Streams do not require prior approval.

Configuration works just like Twitter::REST::Client

client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = "YOUR_CONSUMER_KEY"
  config.consumer_secret     = "YOUR_CONSUMER_SECRET"
  config.access_token        = "YOUR_ACCESS_TOKEN"
  config.access_token_secret = "YOUR_ACCESS_SECRET"
end
Stream a random sample of all tweets

client.sample do |object|
  puts object.text if object.is_a?(Twitter::Tweet)
end
Stream mentions of coffee or tea

topics = ["coffee", "tea"]
client.filter(track: topics.join(",")) do |object|
  puts object.text if object.is_a?(Twitter::Tweet)
end
Stream tweets, events, and direct messages for the authenticated user

client.user do |object|
  case object
  when Twitter::Tweet
    puts "It's a tweet!"
  when Twitter::DirectMessage
    puts "It's a direct message!"
  when Twitter::Streaming::StallWarning
    warn "Falling behind!"
  end
end
An object may be one of the following:

Twitter::Tweet
Twitter::DirectMessage
Twitter::Streaming::DeletedTweet
Twitter::Streaming::Event
Twitter::Streaming::FriendList
Twitter::Streaming::StallWarning
	
=end

