require 'spec_helper'
require 'yello/to_yaml'

module Yello
  describe self do
    let(:lists){[list]}
    let(:list){double('list', name: 'LIST', cards: [card1, card2])}
    let(:card1){double('card1', name: 'CARD1', checklists: [checklist])}
    let(:card2){double('card2', name: 'CARD2', checklists:nil)}
    let(:checklist){double('checklist', name: 'CHECKLIST', items:['ITEM'])}

    it 'should convert model objects to yaml' do
      expect(YAML.load(Yello.to_yaml(lists))).to eq (
        {
          'LIST'=>{
            'cards'=>[
              {
                'CARD1'=>nil, 
                'checklists'=>[
                  {'CHECKLIST'=>[
                    'ITEM']
                  }
                ]
              },
              'CARD2'
            ]
          }
        })
    end
  end
end
