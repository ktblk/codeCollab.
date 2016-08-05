OmniAuth.config.logger = Rails.logger
OmniAuth.config.on_failure = SessionsController.action(:new)


Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLETKN1'], ENV['GOOGLETKN2']
end
