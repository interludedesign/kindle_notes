# Get the absolute path of the parent directory
parent_dir = File.expand_path('..', __dir__)

# Add the parent directory to the load path
$LOAD_PATH.unshift(parent_dir)

require 'init'

RSpec.configure do |config|
  config.filter_run_when_matching :focus
end
