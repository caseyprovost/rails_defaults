Sidekiq.configure_server do |config|
  config.redis = {url: "#{Rails.application.credentials.redis_url}/0"}
end

Sidekiq.configure_client do |config|
  config.redis = {url: "#{Rails.application.credentials.redis_url}/0"}
end
