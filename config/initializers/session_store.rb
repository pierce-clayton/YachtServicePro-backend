if Rails.env == 'production'
  Rails.application.config.session_store :cookie_store, key: '_auth_app', domain: 'http://mydomain.blah:3000'
else
  Rails.application.config.session_store :cookie_store, key: '_auth_app'
end
