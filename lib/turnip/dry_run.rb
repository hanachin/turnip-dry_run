require 'rspec/core/formatters/base_formatter'
require "turnip/dry_run/version"
require "turnip/dry_run/base_formatter"
require "turnip/dry_run/text_formatter"

module Turnip
  module DryRun
    class StepMetadata < Struct.new(:feature_file, :step, :step_method)
      def method_name
        step_method.name
      end

      def method_lineno
        step_method.source_location.last
      end

      def method_filename
        step_method.source_location.first
      end
    end

    def run_step(feature_file, step)
      step_metadata = StepMetadata.new(feature_file, step, super)

      example = Turnip::RSpec.fetch_current_example(self)
      example.metadata[:steps] ||= []
      example.metadata[:steps] << step_metadata
    end

    def step(step_or_description, *extra_args)
      #
      # This code clone from turnip source tree,
      # lib/turnip/execute.rb
      # -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
      if step_or_description.respond_to?(:extra_args)
        description = step_or_description.description
        extra_args.concat(step_or_description.extra_args)
      else
        description = step_or_description
      end

      matches = methods.map do |method|
        next unless method.to_s.start_with?("match: ")
        send(method.to_s, description)
      end.compact

      if matches.length == 0
        raise Turnip::Pending, description
      end

      if matches.length > 1
        msg = ['Ambiguous step definitions'].concat(matches.map(&:trace)).join("\r\n")
        raise Turnip::Ambiguous, msg
      end
      # -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

      m = matches.first
      method(m.method_name)
    end
  end
end
