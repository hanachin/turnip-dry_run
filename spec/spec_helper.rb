$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

Turnip::RSpec::Execute.prepend(Turnip::DryRun)
Dir.glob(File.expand_path('../examples/**/*steps.rb', __dir__)) { |f| require f }
