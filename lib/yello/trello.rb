require 'yello/auth'
require 'trello'

module Yello
  class << self
    def trello
      Trello::Client.new( 
                         developer_public_key: auth.key,
                         member_token: auth.token)
    end

    def auth
      @auth ||= Yello::Auth.get
    end
  end
end
