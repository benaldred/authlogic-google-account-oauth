class User < ActiveRecord::Base
  acts_as_authentic
  
  before_create :populate_oauth_user
  
private

  def populate_oauth_user
    unless oauth_token.blank?
      @response = UserSession.oauth_consumer.request(:get, '/account/verify_credentials.json',
      access_token, { :scheme => :query_string })
      case @response
      when Net::HTTPSuccess
        user_info = JSON.parse(@response.body)
        
        self.name        = user_info['name']
        self.twitter_uid = user_info['id']
        self.avatar_url  = user_info['profile_image_url']
      end
    end
  end
  
end
