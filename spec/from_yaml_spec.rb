require 'spec_helper'
require 'rspec/expectations'
require 'yello/from_yaml'

describe Yello do
  RSpec.configure do |c|
  end

  let(:lists) { Yello.from_yaml(File.read("#{__dir__}/test.yml")) }
  let(:cards) { lists[0].cards }
  let(:checklists) { cards[4].checklists }
  let(:default_checklist){ cards[3].checklists[0] }

  it 'should have lists' do
    expect(lists.size).to eq 3 
    expect(lists[0].name).to eq("Not Started")
  end

  it 'should have cards' do
    expect(cards.size).to eq 5
    expect(cards[0].name).to eq 'Get an email account'
  end

  it 'should have checklists' do
    expect(checklists.size).to eq 1
    expect(checklists[0].name).to eq 'Process'
  end

  it 'should have items in a checklist' do
    expect(checklists[0].items.size).to eq 4
    expect(checklists[0].items[0]).to eq 'Write tests'
  end

  it 'should have a default checklist' do
    expect(default_checklist).not_to eq nil 
    expect(default_checklist.name).to eq 'Checklist'
    expect(default_checklist.items.size).to eq 2
  end
end
