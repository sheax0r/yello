module Yello
  class << self
    def find_members(emails)
      Yello::FindMembers.new.run(emails)
    end
  end

  class FindMembers
    include Trello

    def run(*emails)
      puts "find members: #{emails}"
      emails.map do |email|
        begin
          client.find(:member, email)
        rescue Trello::Error => bang
          # Raise our own error - the trello error is not specific enough.
          raise "Member #{email} not found."
        end
      end
    end
  end
end
