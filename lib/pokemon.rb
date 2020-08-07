require 'pry'

class Pokemon

  attr_accessor :id ,:name, :type, :db

  def initialize(poke_hash)
    poke_hash.each {|key, value| self.send(("#{key}="), value)}
  end

  def self.save(name, type, db)
    binding.pry
    sql = <<-SQL
      INSERT INTO ? (name, type)
      VALUES (?, ?)
    SQL
    db[:conn].execute(sql, db, name, type)
    @id = db[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end

end
