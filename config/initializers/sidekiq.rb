Sidekiq.configure_server do |config|
  config.redis = Rails.application.secrets.redis
end

Sidekiq.configure_client do |config|
  config.redis = Rails.application.secrets.redis
end
