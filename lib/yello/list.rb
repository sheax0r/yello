require 'yello/base'
require 'yello/card'

module Yello
  class List < Base

    attr_reader :cards

    def initialize(name, hash)
      super(name)
      @cards = (hash['cards'] || []).map{|c|
        if c.is_a? Hash
          Card.new(c.keys[0], c.values[0])
        else
          Card.new(c, {})
        end
      }
    end
  end
end
