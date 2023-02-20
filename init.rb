require 'zeitwerk'

loader = Zeitwerk::Loader.new

# App
loader.push_dir("#{__dir__}/lib")

# Tests
loader.push_dir("#{__dir__}/spec")

loader.setup
