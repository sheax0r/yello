require 'yello/base'
require 'yello/checklist'

module Yello
  class Card < Base
    attr_accessor :checklists


    def initialize(name, hash)
      super(name)
      @checklists = (hash['checklists'] || []).map{|h|
        Checklist.new(h.keys[0], h.values[0])
      }
    end

  end
end

