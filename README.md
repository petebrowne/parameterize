# Parameterize

_The simplest permalink/slug solution for ActiveRecord >= 3.0._

It uses ActiveSupport's `String#parameterize` to create the slug. There are no validations. No slug history. No extra tables or models.

## Getting Started

``` ruby
# Gemfile
gem 'parameterize'
```

``` bash
$ bundle install
$ rails generate model User name:string param:string
# Parameterize requires a string column named 'param'
```
   
``` ruby
# models/user.rb
class User < ActiveRecord::Base
  parameterize :name
end

# elsewhere
user = User.new :name => 'John Doe'
user.valid?
user.param = 'john-doe'
user.to_param = 'john-doe'
```
    
## Notes

Validations **are not** included. I prefer to be able to customize my validations directly in the model. The most common validations you would add are:

``` ruby
class Post < ActiveRecord::Base
  parameterize
  validates_presence_of :param
  validates_uniqueness_of :param
end
```
    
You could easily use [Babosa's](http://github.com/norman/babosa) #to_identifier or [Stringex's](http://github.com/rsl/stringex) #to_url instead of ActiveSupport's #parameterize by just aliasing the method you want to use:

``` ruby
require 'babosa'
class String
  alias :parameterize :to_identifier
end
```
    
There is also a Shoulda-style RSpec matcher available for use in your specs:

``` ruby
# spec_helper.rb
require 'parameterize/matcher'

# post_spec.rb
describe Post do
  it { should parameterize(:title) }
end
```

## Copyright

Copyright (c) 2011 [Peter Browne](http://petebrowne.com). See LICENSE for details.
