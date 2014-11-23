require 'yaml'
require 'yello/version'
require 'yello/list'

module Yello
  class << self
    def parse(string)
      YAML.load(string).map{|k,v|
        Yello::List.new(k, v)
      } 
    end
  end 
end
