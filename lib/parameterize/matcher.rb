require 'rspec/matchers'

RSpec::Matchers.define :parameterize do |source|
  match do |model|
    model.class.include?(Parameterize::InstanceMethods) && model.class.parameterize_config[:source] == source
  end

  failure_message_for_should do |model|
    "expected #{model.class} to parameterize #{source}"
  end
end
