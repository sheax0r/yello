require 'yaml'
require 'yello/model'

module Yello
  class << self
    def from_yaml(string)
      YAML.load(string).map{|k,hash|
        Yello::List.new(k, (hash['cards'] ||[]).map{|c|
          if c.is_a? String
            Card.new(c, nil, [])
          else
            Card.new(c.keys[0], 
                     c['desc'], 
                     (c['checklists'] || []).map{|h|
                       Checklist.new(h.keys[0], h.values[0] || [])
                     }.tap{|result|
                       result.concat checklist_shorthand(c) if result.empty?
                     })
          end
        })
      } 
    end

    private

    def checklist_shorthand(hash)
      if hash['checklist']
        [Checklist.new('Checklist', hash['checklist'])]
      else
        []
      end
    end
  end 
end
