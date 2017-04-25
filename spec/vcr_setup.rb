require 'vcr'

VCR.configure do |c|
  c.hook_into                  :webmock
  c.cassette_library_dir     = 'spec/vcr_cassettes'
  c.ignore_localhost         = true
  c.default_cassette_options = { record: :new_episodes, erb: true }
  c.configure_rspec_metadata!
end
