require 'yello/base'
require 'yello/checklist'

module Yello
  class Card < Base
    attr_accessor :checklists, :desc

    def initialize(name, desc, checklists) 
      super(name)
      @desc = desc
      @checklists = checklists
    end

    def attributes
      super.merge('desc'=>desc)
    end

  end
end

