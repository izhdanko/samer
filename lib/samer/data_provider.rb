require 'samer/user'

module Samer
  class DataProvider

    DATA_PATH = File.expand_path '../../data/users.yml', __FILE__

    def initialize
      @data = YAML.load_file DATA_PATH
    end

    def prepare
      @data.keys.map!{ |name| User.new name, @data[name] }
    end

  end
end
