if Rails.env == 'production'
  Rails.application.config.session_store :cookie_store, key: '_auth_app', domain: 'https://gentle-caverns-38062.herokuapp.com/'
else
  Rails.application.config.session_store :cookie_store, key: '_auth_app'
end
