require 'active_record'
require 'yaml'

namespace :db do
  desc 'Migrate the database'
  task :migrate do
    ActiveRecord::Base.establish_connection(db_configuration['development'])
    ActiveRecord::MigrationContext.new('db/migrate').migrate
  end
end

def db_configuration
  db_config_file = File.join(File.expand_path('..', __FILE__), 'config', 'database.yml')
  YAML.safe_load(File.read(db_config_file))
end
