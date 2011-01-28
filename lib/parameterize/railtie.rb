require 'rails/railtie'

module Parameterize
  class Railtie < Rails::Railtie
    initializer 'parameterize.include_macro' do |app|
      ActiveRecord::Base.extend Parameterize
    end
  end
end
