source "https://rubygems.org"

gem "pg", platforms: :ruby
gem "jdbc-postgres", platforms: :jruby
gem "sinatra"
gem "haml"
gem "puma"
gem "sinatra-contrib"
gem "sass"
gem "uglifier"
gem "sinatra-asset-pipeline"
gem "rack-flash3"
gem "sidekiq"
gem "pony"

group :development do
  gem "rerun"
end

group :test do
  gem "minitest"
  gem "database_cleaner"
  gem "rack-test", require: "rack/test"
  gem "minitest-line"
end

group :production do
  # gem "therubyracer", platforms: :ruby
  # gem "therubyrhino", platforms: :jruby
end
