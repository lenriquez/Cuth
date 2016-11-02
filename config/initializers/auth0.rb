Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    's2IY0wHfBg6X5ClwSUmYtRca3IrQaMV8',
    'aO3mwpcaS7sH7z386Y3-35jUMQt6hBwUxhWJHvaHtua5seuqD8ozRpEHzSCN3738',
    'lenriquez.auth0.com',
    callback_path: "/auth/auth0/callback"
  )
end
