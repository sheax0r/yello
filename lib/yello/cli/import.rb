require 'thor'
require 'yello/from_yaml'
require 'yello/import'

module Yello
  class CLI < Thor
    desc 'import', 'Import a board.'
    option :file, aliases: :f, banner: "<file>"
    def import(board)
      Yello.import(board, Yello.from_yaml(input))
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

