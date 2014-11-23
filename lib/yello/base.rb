module Yello
  class Base
    attr_accessor :name

    def initialize(name)
      @name = name 
    end 

    def api_attributes
      {'name'=>name} 
    end
  end
end
