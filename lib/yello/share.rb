module Yello
  class << self
    def share(board, members)
      Yello::Share.new.run(board, members)  
    end
  end

  class Share
    include Trello

    def run(board, members)
      puts "sharing: #{members}"
      members.each do |m|
        client.put("/boards/#{board.id}/members/#{m.id}", type: 'normal')
      end
    end
  end
end

