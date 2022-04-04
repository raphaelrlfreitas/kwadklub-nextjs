if Rails.env == "production"
  Rails.application.config.session_store :cookie_store, key: "_kwadklub_session", domain: "kwadklub.com"
else
  Rails.application.config.session_store :cookie_store, key: "_kwadklub_session"
end