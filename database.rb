require 'active_record'
require 'mysql2'


ActiveRecord::Base.establish_connection(
  adapter:  'mysql2', 
  host:     'aayeth7foprea1.cnoaizdqciu7.us-east-1.rds.amazonaws.com',
  database: 'ranking-service',
  username:  ENV['DB_USER'],
  password:  ENV['DB_PASSWORD']
)