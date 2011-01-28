# Parameterize

_The simplest permalink/slug solution for ActiveRecord 3.0._

It uses ActiveSupport's `String#parameterize` to create the slug. There are no validations. No slug history. No extra tables or models.

## Getting Started

    rails generate model User name:string param:string
    
    class User < ActiveRecord::Base
      parameterize :name
    end
    
    user = User.new :name => 'John Doe'
    user.valid?
    user.param = 'john-doe'
    user.to_param = 'john-doe'
    
## Notes

Validations **are not** included. I prefer to be able to customize my validations directly in the model. The most common validations you would add are:

    class Post < ActiveRecord::Base
      parameterize
      validates_presence_of :param
      validates_uniqueness_of :param
    end
    
You could easily use [Babosa's](http://github.com/norman/babosa) #to_identifier or [Stringex's](http://github.com/rsl/stringex) #to_url instead of ActiveSupport's #parameterize by just aliasing the method you want to use:

    require 'babosa'
    class String
      alias :parameterize :to_identifier
    end

## Copyright

Copyright (c) 2011 [Peter Browne](http://petebrowne.com). See LICENSE for details.
