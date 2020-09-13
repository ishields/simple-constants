require "simple_constants/version"
require 'simple_constants/base_constant_methods'
require 'simple_constants/base_constants'

module SimpleConstants
  def self.yml_path=(value)
    @yml_path = value
  end

  def self.yml_path
    @yml_path || 'lib/simple_constants/yml/'
  end

  def self.model_path=(value)
    @model_path = value
  end

  def self.model_path
    @model_path || 'lib/simple_constants/model'
  end

  def self.root
    Dir.pwd
  end
end

Dir["#{SimpleConstants.root}/#{SimpleConstants.model_path}/**/*.rb"].each do |f|
  require f
end