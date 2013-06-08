OmniAuth.config.full_host = "http://localhost:3000"

Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :google, 'emineker.net', 'PtyLaRmzLQ1LodMJVrmYdt3b'
  provider :google, '1045885161461.apps.googleusercontent.com', 'wRjIgUZEtzKVJnhQRIFYvvbn'
end
