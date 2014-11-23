require 'json'
require 'yello/trello'
module Yello

  class << self
    def import(name, lists) 
      Yello::Import.new.run(name, lists)
    end
  end

  class Import 
    include Trello

    def run(name, lists)
      board = client.create(:boards, 'name'=>name)
      board.lists.each do |l|
        l.closed = true
        l.save
      end

      lists.reverse.each do |l|
        list = client.create(:list, l.attributes.merge('idBoard'=>board.id))
        l.cards.reverse.each do |c|
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
