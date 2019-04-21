Google Login

1. Add to Gemfile
	
	# Gemfile
gem 'devise', '~> 4.3.0'
gem 'omniauth-google-oauth2', '~> 0.2.2'

2. config/initializers/devise.rb

Devise.setup do |config|
  # Add the credentials from your Google application to your secrets
  # Configure Google omniauth with proper scope
  config.omniauth :google_oauth2, "client_id", "client_secret", {
    scope: "contacts.readonly,userinfo.email"
  }
end

3. # app/controllers/users/omniauth_callbacks_controllers.rb

[:facebook, :google_oauth2].each do |provider|
    provides_callback_for provider
end

4. do rake routes
    Change this to link with user_google_oauth2_authorize_path

    this
    	<button class="btn btn-default">Google Login</button>
    to
			<%= link_to "Sign in with Google", user_google_oauth_omniauth_authorize_path %>