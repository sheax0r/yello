require 'yello/parse'
require 'spec_helper'
require 'yello/trello'
require 'json'

module Yello
  describe Trello do
    let(:auth){ double('auth', :key=>'KEY', :token=>'TOKEN') }
    let(:client) { double('client') }
    let(:board) { double('board', id: 'BOARD-ID') } 
    let(:list) { double('list', id: 'LIST-ID') }   
    let(:card){ double('card') }
    let(:checklist_json){ {'id'=>'CHECKLIST-ID'}.to_json }
    let(:checklist){double('checklist')}
    let(:input){
      Yello.parse(File.read("#{__dir__}/create.yml"))
    }

    it 'should create a board' do
      expect(Yello::Auth).to receive(:get){ auth }
      expect(::Trello::Client).to receive(:new).with(
        developer_public_key: 'KEY',
        member_token: 'TOKEN'){ 
          client 
        }
        expect(client).to receive(:create).with(:boards, 'name'=>'BOARD'){board}
        expect(client).to receive(:create).with(:list, 'name'=>'LIST', 'idBoard'=> 'BOARD-ID', 'pos'=>'bottom'){ list }
        expect(client).to receive(:create).with(:card, 'name'=>'CARD', 'idList'=>'LIST-ID'){ card }
        expect(card).to receive(:create_new_checklist).with('CHECKLIST'){checklist_json}
        expect(client).to receive(:find).with(:checklist, 'CHECKLIST-ID'){checklist}
        expect(checklist).to receive(:add_item).with('ITEM')

        Yello.trello.create('BOARD', input)
    end    

  end
end

