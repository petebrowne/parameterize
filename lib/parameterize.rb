require 'active_support/core_ext/array/extract_options'
require 'active_support/core_ext/string/inflections'

module Parameterize
  autoload :Railtie, 'parameterize/railtie'
  autoload :VERSION, 'parameterize/version'
  
  def parameterizes(*args)
    include InstanceMethods
    
    options = args.extract_options!
    source  = args.first || :title
    
    validates_presence_of   :param
    validates_uniqueness_of :param
    before_validation       :update_param
    
    write_inheritable_attribute(:param_source_field, source)
  end
  
  module InstanceMethods
    def to_param
      self.param
    end
    
    def update_param
      self.param = __send__(self.class.read_inheritable_attribute(:param_source_field)).to_s.parameterize
    end
    protected :update_param
  end
end
