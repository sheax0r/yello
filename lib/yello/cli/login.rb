require 'highline/import'
require 'thor'
require 'yello/auth'

module Yello
  class CLI < Thor
    desc 'login', 'Login to Trello'
    def login
      puts 'Get your trello key and API token here: https://trello.com/1/appKey/generate'
      Yello::Auth.set(
        ask('Enter Trello key:'),
        ask('Enter Trello API token:'))
    end
  end
end

