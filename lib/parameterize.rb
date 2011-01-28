require 'active_support/core_ext/array/extract_options'
require 'active_support/core_ext/string/inflections'

module Parameterize
  # Adds a before validation filter for updating the param field
  # with the parameterized version of the given source field.
  def parameterize(source = :title)
    include InstanceMethods
    
    class_attribute   :param_source_field
    before_validation :update_param
    
    self.param_source_field = source
  end
  
  module InstanceMethods
    def to_param
      self.param
    end
    
    # Updates the param field with the parameterized version of the source field.
    def update_param
      self.param = __send__(self.class.param_source_field).to_s.parameterize
    end
    protected :update_param
  end
end

require 'parameterize/railtie' if defined?(Rails)
