require 'yello/model/base'

module Yello
  class List < Base

    attr_reader :cards

    def initialize(name, cards)
      super(name)
      @cards = cards
    end
  end
end
