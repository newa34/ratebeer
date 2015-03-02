Rails.application.config.middleware.use OmniAuth::Builder do
 provider :github, ENV['194434f9d74b4c2b67bd'], ENV['a1e297db961378806e4474fd49e25338c68c2cbe']
end