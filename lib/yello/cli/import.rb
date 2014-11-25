require 'thor'
require 'yello/from_yaml'
require 'yello/to_trello'
require 'yello/share'
require 'yello/find_members'

module Yello
  class CLI < Thor
    desc 'import', 'Import a board.'
    option :file, aliases: :f, banner: "<file>"
    option :share, aliases: :s, banner: "<email1,email2,...>"
    def import(board)
      find_members.tap do |members| 
        Yello.to_trello(board, Yello.from_yaml(input)).tap do |board|
          share(board, members) 
          puts board.url
        end
      end
    end

    no_tasks do
      def input 
        file ? File.read(file) : STDIN.read
      end

      def file 
        options[:file]
      end

      def find_members
        Yello.find_members(options[:share]) 
      end

      def share(board, members)
        Yello.share(board, members)
      end
    end
  end
end

