namespace :heroku do
  desc 'Deploy the app'
  task deploy: :environment do
    app = Settings.heroku_name
    system "heroku maintenance:on --app #{app}"
    system "git push heroku master"
    system "heroku run rake db:migrate --app #{app}"
    system "heroku maintenance:off --app #{app}"
  end

  task init: :environment do
    system "git push heroku master"
    system "heroku addons:add sendgrid:starter"
    system "heroku run rake db:seed --app #{app}"
  end
end
