lib = File.expand_path('../../lib', __FILE__)
$:.unshift(lib) unless $:.include?(lib)

require 'rubygems'
require 'bundler/setup'
require 'rspec'
require 'active_record'
require 'parameterize'
require 'parameterize/matcher'

module ActiveRecord
  class Base
    extend Parameterize
    establish_connection :adapter => 'sqlite3', :database => ':memory:'
  end
  
  Migration.verbose = false
  
  Schema.define(:version => 1) do
    create_table :posts do |t|
      t.string :title
      t.string :param
    end
    
    create_table :users do |t|
      t.string :name
      t.string :param
    end
  end
end

class Post < ActiveRecord::Base
  parameterize
end

class User < ActiveRecord::Base
  parameterize :name
end
