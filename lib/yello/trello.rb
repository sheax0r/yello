require 'yello/auth'
require 'trello'

module Yello
  module Trello
    def client
      @client ||= ::Trello::Client.new( 
                                       developer_public_key: auth.key,
                                       member_token: auth.token)
    end

    def auth
      @auth ||= Yello::Auth.get
    end
  end
end
