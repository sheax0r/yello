require 'netrc'

module Yello

  Auth = Struct.new(:key, :token)

  class Auth
    class << self
      def get
        n = netrc['yello']
        Auth.new(*(netrc['yello']))
      end

      def set(key, token)
        netrc.tap do |n| 
          n['yello'] = key, token
          n.save
        end
      end

      def netrc
        Netrc.read
      end
    end
  end
end

