require 'active_support/core_ext/array/extract_options'
require 'active_support/core_ext/string/inflections'

module Parameterize
  # Adds a before validation filter for updating the param field
  # with the parameterized version of the given source field.
  #
  # @param [Symbol, String] source The field to parameterize
  def parameterize(source = :title)
    include InstanceMethods
    
    class_attribute   :param_source_field
    before_validation :update_param
    
    self.param_source_field = source
  end
  
  module InstanceMethods
    # Overwrite #to_param to return the generated param.
    def to_param
      self.param
    end
    
    protected
    
    # Updates the param field with the parameterized version of the source field.
    def update_param
      self.param = __send__(self.class.param_source_field).to_s.parameterize
    end
  end
end

require 'parameterize/railtie' if defined?(Rails)
