require 'yaml'
require 'yello/model'

module Yello
  class << self
    def from_yaml(string)
      Yello::FromYaml.convert(string)
    end
  end

  module FromYaml
    class << self

      def convert(string)
        YAML.load(string).map{|k,v|
          Yello::List.new(k, cards(v))
        } 
      end

      private

      def cards(hash)
        (hash['cards'] || []).map{|c|
          if c.is_a? Hash
            Card.new(c.keys[0], c['desc'], checklists(c))
          else
            Card.new(c, nil, [])
          end
        }
      end

      def checklists(hash)
        (hash['checklists'] || []).map{|h|
          Checklist.new(h.keys[0], h.values[0] || [])
        }.tap do |result|
          # Look for checklist shorthand if no checklists are found.
          if result.empty?
            result.concat checklist_shorthand(hash)
          end
        end
      end

      def checklist_shorthand(hash)
        if hash['checklist']
          [Checklist.new('Checklist', hash['checklist'])]
        else
          []
        end
      end
    end 
  end
end
