OmniAuth.config.logger = Rails.logger
OmniAuth.config.on_failure = SessionsController.action(:new)
OmniAuth.config.full_host = Rails.env.production? ? 'http://codecollab.co/' : 'http://localhost:3000'


Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLETKN1'], ENV['GOOGLETKN2']
end
