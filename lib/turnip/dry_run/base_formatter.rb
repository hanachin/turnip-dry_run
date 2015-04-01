module Turnip
  module DryRun
    class BaseFormatter < ::RSpec::Core::Formatters::BaseFormatter
      def initialize(output)
        super(output)
      end
    end
  end
end
