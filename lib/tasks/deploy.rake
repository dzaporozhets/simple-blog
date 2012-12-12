namespace :heroku do
  desc 'Deploy the app'
  task :deploy do
    app = Settings.heroku_name
    system "heroku maintenance:on --app #{app}"
    system "git push heroku master"
    system "heroku run rake db:migrate --app #{app}"
    system "heroku maintenance:off --app #{app}"
  end
end
