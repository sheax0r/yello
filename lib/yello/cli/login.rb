require 'highline/import'
require 'os'
require 'thor'
require 'yello/auth'

module Yello
  class CLI < Thor

    desc 'login', 'Login to Trello'
    def login
      get_key
      key = ask('Enter Trello API key:')

      get_token(key)
      token = ask('Enter Trello member token:')

      Yello::Auth.set(key, token)  
    end

    no_tasks do
      def api_url
        'https://trello.com/1/appKey/generate'
      end

      def token_url(key)
        "https://trello.com/1/authorize?key=#{key}&name=yello&expiration=never&response_type=token&scope=read,write"
      end

      if OS.osx?
        def get_key
          ask "Press Enter to open a browser window to get your API key."
          `open "#{api_url}"`
        end

        def get_token(key)
          ask "Press Enter to open a browser window to get your member token."
          `open "#{token_url(key)}"`
        end
      else
        def get_key
          puts "Get your trello API key here: #{api_url}"
        end

        def get_token(key)
          puts "Get your member token here: #{token_url}\n"
        end
      end
    end

  end
end

