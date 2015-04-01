require 'spec_helper'

describe Turnip::DryRun do
  it 'has a version number' do
    expect(Turnip::DryRun::VERSION).not_to be nil
  end

  before do
    @result = %x(bundle exec rspec --format Turnip::DryRun::TextFormatter examples/hello.feature)
  end

  it "shows feature file name and step lineno and step and step defined file and step defined lineno and step method name" do
    expect(@result.lines.first).to include 'examples/hello.feature:3 there is a monster called "Kijimun" ->'
    expect(@result.lines.first).to be_end_with "examples/steps/monster_steps.rb:1 there is a monster called :name\n"
  end
end
