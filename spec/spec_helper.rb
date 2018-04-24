# frozen_string_literal: True

require 'rspec'
require 'jekyll'
require 'liquid'
require 'capybara/rspec'
require 'capybara-screenshot/rspec'
require 'rack/test'
require 'rack/jekyll'
require 'pry'


RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end


  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.filter_run_when_matching :focus
  config.example_status_persistence_file_path = 'spec/examples.txt'
  config.disable_monkey_patching!
  config.warnings = true
  config.expose_dsl_globally = true

  config.default_formatter = 'doc' if config.files_to_run.one?

  config.profile_examples = 5
  config.order = :random
  Kernel.srand config.seed

  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, browser: :chromium)
  end

  Capybara.javascript_driver = :webkit
  Capybara.app = Rack::Jekyll.new(force_build: true)
  Capybara::Screenshot.autosave_on_failure = true
  Capybara::Screenshot.prune_strategy = { keep: 20 }
  Capybara.asset_host = '../_site'
end
