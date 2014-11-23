require 'yello/base'
require 'yello/checklist'

module Yello
  class Card < Base
    attr_accessor :checklists

    def initialize(name, checklists)
      super(name)
      @checklists = checklists
    end

  end
end

