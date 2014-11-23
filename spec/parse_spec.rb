require 'spec_helper'
require 'rspec/expectations'
require 'yello/parse'

describe Yello do
  RSpec.configure do |c|
  end

  let(:lists) { Yello.parse(File.read("#{__dir__}/test.yml")) }
  let(:cards) { lists[0].cards }
  let(:checklists) { cards[4].checklists }

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
end
