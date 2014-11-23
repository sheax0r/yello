require 'spec_helper'
require 'yello/from_trello'

module Yello
  describe self do

    let(:board){ double('board', name: 'BOARD', lists: [list]) }
    let(:list){ double('list', name: 'LIST', cards:[card])}
    let(:card){ double('card', name: 'CARD', pos: 1, desc: 'DESCRIPTION', checklists: [checklist])}
    let(:checklist){ double('checklist', name: 'CHECKLIST', items: [item])} 
    let(:item){ double('item', name: 'ITEM') }

    it 'should convert trello objects to model objects' do
      Yello.from_trello(board).tap do |lists|
        expect(lists.size).to eq 1
        lists[0].tap do |list|
          expect(list.name).to eq 'LIST'
          list.cards.tap do |cards|
            expect(cards.size).to eq 1
            cards[0].tap do |card|
              expect(card.name).to eq 'CARD'
              card.checklists.tap do |checklists|
                expect(checklists.size).to eq 1
                checklists[0].tap do |checklist|
                  expect(checklist.name).to eq 'CHECKLIST'
                  expect(checklist.items).to eq(["ITEM"])
                end
              end
            end
          end
        end
      end
    end
  end
end

