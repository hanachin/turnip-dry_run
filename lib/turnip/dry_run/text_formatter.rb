module Turnip
  module DryRun
    class TextFormatter < BaseFormatter
      # FIXME
      if ::RSpec::Core::Formatters.respond_to?(:register)
        ::RSpec::Core::Formatters.register self, :example_passed
      end

      def example_passed(notification)
        # FIXME
        example = notification.respond_to?(:example) ? notification.example : notification

        feature_path_width = example.metadata[:steps].map {|s|
          "#{s.feature_file}:#{s.step.line}".size
        }.max
        step_width = example.metadata[:steps].map {|s|
          s.step.description.size
        }.max
        method_name_width = example.metadata[:steps].map {|s|
          s.method_name.size
        }.max
        method_path_width = example.metadata[:steps].map {|s|
          "#{s.method_filename}:#{s.method_lineno}".size
        }.max
        example.metadata[:steps].each do |s|
          m = ["#{s.feature_file}:#{s.step.line}", s.step.description, "#{s.method_filename}:#{s.method_lineno}", s.method_name]
          output << "%-#{feature_path_width}s %-#{step_width}s -> %-#{method_path_width}s %-#{method_name_width}s#{$/}" % m
        end
      end
    end
  end
end
