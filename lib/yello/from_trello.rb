require 'yello/trello'
require 'yello/list'

module Yello
  class << self
    def from_trello(board)
      puts "from trello: #{board}"
      Yello::FromTrello.convert(board)
    end

    module FromTrello
      class << self
        def convert(board)
          puts "converting #{board.name}"
          Yello::List.new(board.name, cards(b.cards))   
        end

      end
    end
  end
end
