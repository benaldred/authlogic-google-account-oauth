class UserSession < Authlogic::Session::Base
  def self.oauth_consumer
    OAuth::Consumer.new("z22sSQlQMptg2u0A2wK4w", "hMbGnTbY5nDBMTQq0OLiveDBnqD4BUYQEfTzk5N0wg",
    { :site=>"http://twitter.com",
      :authorize_url => "http://twitter.com/oauth/authenticate" })
  end
end