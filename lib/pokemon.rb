class Pokemon

  attr_accessor :name, :type
  attr_reader :id

  def initialize(poke_hash)
    poke_hash.each {|key, value| self.send(("#{key}="), value)}
  end

end
