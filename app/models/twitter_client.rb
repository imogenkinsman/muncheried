class TwitterClient

  def initialize(client = nil)
    if client
      @client = client
    else
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key         = ENV['TWITTER_CONSUMER_KEY']
        config.consumer_secret      = ENV['TWITTER_CONSUMER_SECRET']
        config.access_token         = ENV['TWITTER_ACCESS_TOKEN']
        config.access_token_secret  = ENV['TWITTER_ACCESS_TOKEN_SECRET']
      end
    end
  end

  def post(meal)
    content = "SALE: #{meal} - #{meal.price} - #{meal.description[0...100]}..."
    @client.update(content)
  end

end