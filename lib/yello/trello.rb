require 'trello'
require 'json'
module Yello

  class << self
    def trello
      Yello::Trello.new(Yello::Auth.get)
    end
  end

  class Trello
    attr_reader :client 

    def initialize(auth)
      @client = ::Trello::Client.new( 
                                     developer_public_key: auth.key,
                                     member_token: auth.token)
    end

    def create(name, lists)
      board = client.create(:boards, 'name'=>name)
      board.lists.each do |l|
        l.closed = true
        l.save
      end

      lists.reverse.each do |l|
        list = client.create(:list, l.attributes.merge('idBoard'=>board.id))
        l.cards.each do |c|
          card = client.create(:card, c.attributes.merge('idList'=>list.id))
          c.checklists.each do |cl|
            checklist = client.find(:checklist, JSON.parse(card.create_new_checklist(cl.name))['id'])
            cl.items.each do |i|
              checklist.add_item(i) 
            end
          end 
        end
      end
    end
  end
end
