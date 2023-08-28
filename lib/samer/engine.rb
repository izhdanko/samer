module Samer
  class Engine

    attr_reader :users

    def initialize users
      @users = users
    end

    def find_for name
      @name = name
      @similar = {}
      return "User @#{name} is not present in example users list. See it in lib/data/users.yml" unless current_user

      @users.each do |user|
        next if user.name == current_user.name
        @similar[user.name] = distance(current_user, user)
      end

      similar
    end

    def recommend name
      return "Unable to find recommendations because user @#{name} is not listed in lib/data/users.yml" unless current_user
      @users.find{ |user| user.name == similar[0] }.music.keys - current_user.music.keys
    end


    private

    def distance current_user, user
      distances = []

      current_user.music.keys.each do |genre|
        next unless user.music[genre]
        distances.push (current_user.music[genre] - user.music[genre]) ** 2
      end

      1.fdiv 1 + Math.sqrt(distances.inject(0){ |sum, score| sum + score })
    end

    def current_user
      @users.find{ |user| user.name == @name }
    end

    def similar
      @similar.max_by{ |_, score| score }
    end

  end
end
