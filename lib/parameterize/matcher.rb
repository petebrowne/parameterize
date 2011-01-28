require 'rspec/matchers'

RSpec::Matchers.define :parameterize do |source|
  match do |model|
    model.class.include?(Parameterize::InstanceMethods) && model.class.param_source_field == source
  end
  
  failure_message_for_should do |model|
    "expected #{model.class} to parameterize #{source}"
  end
end
