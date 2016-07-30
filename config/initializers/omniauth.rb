OmniAuth.config.logger = Rails.logger
OmniAuth.config.on_failure = SessionsController.action(:new)


Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '966114572097-61o6d34pe4e9jvqqq9d60km2nk9k4ct4.apps.googleusercontent.com', '2cOyKWmgOhOd2m7WJPAkvnre'
end
