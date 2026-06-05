ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../Gemfile", __dir__)

require "bundler/setup" # Set up gems listed in the Gemfile.
require "bootsnap/setup" # Speed up boot time by caching expensive operations.

# 親ディレクトリの.envファイルで一元管理を可能にする
require "dotenv"
Dotenv.load(File.expand_path("../../.env", __dir__))
