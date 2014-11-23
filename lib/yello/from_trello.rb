require 'yello/trello'
require 'yello/list'

module Yello

  class << self
    def from_trello(board)
      Yello::FromTrello.convert(board)
    end
  end

  module FromTrello
    class << self
      def convert(board)
        board.lists.map{|l|
          Yello::List.new(l.name, cards(l.cards))   
        }
      end

      def cards(array)
        # Sort by position
        array.sort_by{|c|-c.pos}.map{|c|
          Yello::Card.new(c.name, checklists(c.checklists))
        } 
      end

      def checklists(array)
        array.map{|cl|
          Yello::Checklist.new(cl.name, cl.items.map(&:name))
        }
      end
    end
  end

end
