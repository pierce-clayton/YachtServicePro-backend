if Rails.env == 'production'
  Rails.application.config.session_store :cookie_store, key: '_ysp_app', domain: :all
else
  Rails.application.config.session_store :cookie_store, key: '_ysp_app'
end
