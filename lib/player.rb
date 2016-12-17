# Holds player attributes for CLI game
class Player
  attr_reader :name, :token

  def initialize(args = {})
    @name = args.fetch(:name, nil)
    @token = args.fetch(:token, nil)
  end
end
