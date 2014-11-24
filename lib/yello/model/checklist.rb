require 'yello/model/base'

module Yello
  class Checklist < Base

    attr_accessor :check_items
    alias_method :items, :check_items

    def initialize(name, items) 
      super(name)
      @check_items = items 
    end
  end
end
