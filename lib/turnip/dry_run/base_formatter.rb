module Turnip
  module DryRun
    class BaseFormatter < ::RSpec::Core::Formatters::BaseTextFormatter
      def initialize(output)
        super(output)
      end
    end
  end
end
