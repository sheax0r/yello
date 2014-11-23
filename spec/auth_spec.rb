require 'spec_helper'
require 'yello/auth'

module Yello
  describe Auth do

    let(:netrc) {{'yello'=>['KEY', 'TOKEN']}}

    it 'should get auth' do
      expect(Netrc).to receive(:read){ netrc }
      Yello::Auth.get.tap{|auth|
        expect(auth.key).to eq "KEY"
        expect(auth.token).to eq "TOKEN"
      }
    end

    it 'should set auth' do
      expect(Netrc).to receive(:read){ netrc } 
      expect(netrc).to receive(:[]=).with('yello', ['KEY', 'TOKEN'])
      expect(netrc).to receive(:save)
      Yello::Auth.set('KEY', 'TOKEN') 
    end
  end
end
