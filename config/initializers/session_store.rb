Rails.application.config.session_store :cookie_store, key: '_ysp_app',
                                                      secure: Rails.env.production?,
                                                      domain: :all

