OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '749210785538392', 'cca88192464d85098eed502c8fdd48a9'
end