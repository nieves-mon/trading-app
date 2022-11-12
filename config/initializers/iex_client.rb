IEX::Api.configure do |config|
    config.publishable_token = Rails.application.credentials.iex_client[:publishable_token]
    config.secret_token = Rails.application.credentials.iex_client[:secret_token]
    config.endpoint = 'https://cloud.iexapis.com/v1'
end
