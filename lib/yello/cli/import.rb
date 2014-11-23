require 'thor'
require 'yello/parse'
require 'yello/trello'

module Yello
  class CLI < Thor
    desc 'import', 'Import a board.'
    option :file, aliases: :f, banner: "<file>"
    def import(board)
      Yello.trello.import(board, Yello.parse(input))
    end

    no_tasks do
      def input 
        file ? File.read(file) : STDIN.read
      end

      def file 
        options[:file]
      end
    end
  end
end

