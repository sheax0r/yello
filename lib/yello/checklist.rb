require 'yello/base'

module Yello
  class Checklist < Base
    attr_accessor :items
    def initialize(name, items) 
      super(name)
      @items = items 
    end
  end
end
