require 'yaml'
require 'yello/list'

module Yello
  class << self
    def parse(string)
      YAML.load(string).map{|k,v|
        Yello::List.new(k, cards(v))
      } 
    end

    def cards(hash)
      (hash['cards'] || []).map{|c|
        if c.is_a? Hash
          Card.new(c.keys[0], checklists(c))
        else
          Card.new(c, [])
        end
      }
    end

    def checklists(hash)
      (hash['checklists'] || []).map{|h|
        Checklist.new(h.keys[0], h.values[0] || [])
      }
    end
  end 
end
