require 'yello/trello'
require 'yello/model'

module Yello
  class << self
    def from_trello(board)
      board.lists.map{|l|
        Yello::List.new(l.name, l.cards.sort_by(&:pos).map{|c|
          Card.new(c.name, c.desc, c.checklists.map{|cl|
            Checklist.new(cl.name, cl.items.map(&:name))
          })
        })
      }
    end
  end
end
