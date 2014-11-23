require 'thor'
require 'yello/from_trello'
require 'yello/trello'
require 'yello/to_yaml'

module Yello
  class CLI < Thor
    desc 'export', 'Export a board.'
    option :id, aliases: :i, banner: "<id>", required: true
    option :file, aliases: :f, banner: "<file>", type: :boolean
    def export
      Yello.from_trello(board).tap do |result|
        output {|f|
          f.write(Yello.to_yaml(result))
        }
      end
    end

    no_tasks do

      def board
        client.find(:boards, id) || (fail "No such board: #{id}")
      end

      def output(&block)
        if file
          File.open(file){|f| yield f}
        else
          yield STDOUT
        end
      end 

      def name
        options[:name]
      end

      def id
        options[:id]
      end

      def file
        options[:file]
      end

      include Trello
    end
  end
end
