require 'thor'
require 'yello/parse'
require 'yello/trello'

module Yello
  class CLI < Thor
    desc 'create', 'Create a board. Reads from STDIN if file is unspecified.'
    option :file, aliases: :f, banner: "<file>"
    def create(board)
      Yello.trello.create(board, Yello.parse(input))
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

