require 'yaml'
module Yello
  class << self
    def to_yaml(lists)
      Yello::ToYaml.convert(lists)
    end
  end

  module ToYaml

    class << self

      def convert(lists)
        {}.tap{|h|
          lists.each{|l|
            h[l.name] = list(l)
          }
        }.to_yaml
      end

      def list(l)
        {}.tap{|h|
          h['cards'] = l.cards.map{|c|
            card(c)
          }
        } 
      end

      def card(c)
        if c.checklists && !c.checklists.empty?
          {
            c.name=>nil,
            'desc'=>c.desc,
            'checklists'=>c.checklists.map{|cl|checklist(cl)}
          }
        else
          c.name
        end
      end

      def checklist(cl)
        {
          cl.name => cl.items
        }
      end

    end
  end
end
