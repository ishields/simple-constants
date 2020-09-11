require "simple_constants/version"
require 'simple_constants/base_constant_methods'
require 'simple_constants/base_constants'

module SimpleConstants
  def self.root
    File.expand_path('../..',__FILE__)
  end
end

Dir["#{SimpleConstants.root}/lib/**/*.rb"].each do |f|
  require f
end