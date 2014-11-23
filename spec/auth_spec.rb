require 'spec_helper'
require 'yello/auth'

module Yello
  describe Auth do

    let(:auth_contents) {{"key"=>"KEY", "token"=>"TOKEN"}.to_yaml}
    let (:auth_file) {"#{ENV['HOME']}/.yellorc"}

    it 'should get auth' do
      expect(File).to receive(:read).with(auth_file){ auth_contents }
      Yello.get_auth.tap{|auth|
        expect(auth.key).to eq "KEY"
        expect(auth.token).to eq "TOKEN"
      }
    end

    it 'should set auth' do
      expect(File).to receive(:write).with(auth_file, auth_contents)
      Yello.set_auth('KEY', 'TOKEN') 
    end
  end
end
