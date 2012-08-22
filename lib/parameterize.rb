require 'active_record'
require 'active_support/core_ext/string/inflections'

module Parameterize
  # Adds a before validation filter for updating the param field
  # with the parameterized version of the given source field.
  #
  # @param [Symbol, String] source The field to parameterize
  def parameterize(source = :title, options = {})
    include InstanceMethods

    class_attribute :parameterize_config, :instance_writer => false
    before_validation :parameterize, :if => :parameterize?

    self.parameterize_config = {
      :source => source,
      :target => :param,
      :update => false
    }.merge(options)
  end

  module InstanceMethods
    # Overwrite #to_param to return the parameterize target attribute. Falls
    # back to the original implementation if for some reason the target
    # attribute does not exist
    def to_param
      __send__(parameterize_config[:target]) || super
    end

    protected

    # Updates the target attribute with the parameterized version of the source attribute.
    def parameterize
      __send__(:"#{parameterize_config[:target]}=", __send__(parameterize_config[:source]).to_s.parameterize)
    end

    # Returns true if the source attribute should be parameterized.
    def parameterize?
      parameterize_config[:update] || __send__(parameterize_config[:target]).nil?
    end
  end
end

ActiveRecord::Base.extend Parameterize
