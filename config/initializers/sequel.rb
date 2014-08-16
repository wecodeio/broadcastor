require_relative "dotenv"

require "sequel"
require "pathname"
require "yaml"
require "logger"
require "uri"

db_url = ENV["DATABASE_URL"]
max_connections = ENV["MAX_CONNECTIONS"] || "4"

DB = Sequel.connect(db_url, max_connections: max_connections.to_i)
DB.loggers << Logger.new($stdout) if ENV["SQL"]

Sequel::Model.plugin :validation_helpers
Sequel::Model.raise_on_save_failure = false

Sequel.default_timezone = :utc
