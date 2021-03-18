require 'httparty'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.color_mode = true

  config.before(:all) do
    class HttParty
      include HTTParty
      base_uri 'api.openweathermap.org/data/2.5'
    end
  end
end

# 1000a5fd40e9a1493f948bb35205b744
