require 'yaml'

module Yello
  class << self
    def set_auth(key, token)
      Auth.set(key, token)
    end

    def get_auth
      Auth.get
    end
  end

  Auth = Struct.new(:key, :token)

  class Auth
    class << self
      def get
        yaml = YAML.load(File.read(file))
        Auth.new(yaml.fetch('key'), yaml.fetch('token')) 
      end

      def set(key, token)
        File.write(file, {"key"=>key, "token"=>token}.to_yaml)
      end

      def file
        "#{ENV['HOME']}/.yellorc"
      end
    end
  end
end

