source "https://rubygems.org"

gem "dotenv"

gem "pg"
gem "sequel"

gem "sinatra"
gem "sinatra-contrib"
gem "sinatra-asset-pipeline"
gem "haml"
gem "thin"
gem "sass"
gem "uglifier"
gem "rack-flash3"
gem "bcrypt"

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
  gem "therubyracer", platforms: :ruby
end
