# Load the twitter gem
require 'twitter'

# Load the dotenv gem
require 'dotenv'

# This tells dotenv to read the .env file and set the appropriate values in ENV
Dotenv.load

# Load the pry gem 
# require pry

# quelques lignes qui enregistrent les clés d'APIs avec DotEnv
client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = ENV['TWITTER_API_KEY']
  config.consumer_secret     = ENV['TWITTER_API_SECRET']
  config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
  config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
end

# stream a random sample of all tweets
client.sample do |object|
  puts object.text if object.is_a?(Twitter::Tweet)
end