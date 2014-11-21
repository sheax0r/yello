$: << "#{__dir__}/.."
module Yello
  class Base
    attr_accessor :name

    def initialize(name)
      @name = name 
    end 
  end
end
