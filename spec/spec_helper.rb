require 'rubygems'
require 'bundler/setup'
Bundler.require :default, :development
require 'active_record'
require 'parameterize/matcher'

ActiveRecord::Base.extend Parameterize
ActiveRecord::Base.establish_connection :adapter => 'sqlite3', :database => ':memory:'
ActiveRecord::Migration.verbose = false
ActiveRecord::Schema.define :version => 1 do
  create_table :posts do |t|
    t.string :title
    t.string :param
  end
  
  create_table :users do |t|
    t.string :name
    t.string :param
  end
end

class Post < ActiveRecord::Base
  parameterize
end

class User < ActiveRecord::Base
  parameterize :name
end
