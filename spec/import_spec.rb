require 'yello/from_yaml'
require 'spec_helper'
require 'yello/import'
require 'json'

module Yello
  describe Trello do
    let(:auth){ double('auth', :key=>'KEY', :token=>'TOKEN') }
    let(:client) { double('client') }
    let(:board) { double('board', id: 'BOARD-ID') } 
    let(:existing_lists){ [existing_list] }
    let(:existing_list){ double('existing-list') }
    let(:list) { double('list', id: 'LIST-ID') }   
    let(:card){ double('card') }
    let(:checklist_json){ {'id'=>'CHECKLIST-ID'}.to_json }
    let(:checklist){double('checklist')}
    let(:input){
      Yello.from_yaml(File.read("#{__dir__}/create.yml"))
    }

    it 'should import a board' do
      expect(Yello::Auth).to receive(:get){ auth }
      expect(::Trello::Client).to receive(:new).with(
        developer_public_key: 'KEY',
        member_token: 'TOKEN'){ 
          client 
        }
        expect(client).to receive(:create).with(:boards, 'name'=>'BOARD'){board}
        expect(board).to receive(:lists){existing_lists}
        expect(existing_list).to receive(:closed=).with(true)
        expect(existing_list).to receive(:save)
        expect(client).to receive(:create).with(:list, 'name'=>'LIST', 'idBoard'=> 'BOARD-ID'){ list }
        expect(client).to receive(:create).with(:card, 'name'=>'CARD', 'idList'=>'LIST-ID'){ card }
        expect(card).to receive(:create_new_checklist).with('CHECKLIST'){checklist_json}
        expect(client).to receive(:find).with(:checklist, 'CHECKLIST-ID'){checklist}
        expect(checklist).to receive(:add_item).with('ITEM')

        Yello.import('BOARD', input)
    end    

    it 'should export a board' do

    end

  end
end

