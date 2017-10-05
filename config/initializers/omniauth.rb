require 'omniauth/strategies/outreach'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :outreach,
           'APP_ID',
           'APP_SECRET'
end
