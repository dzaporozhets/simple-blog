class Settings < Settingslogic
  source "#{Rails.root}/config/application.yml"
end

Rails.application.routes.default_url_options[:host]= Settings.host
