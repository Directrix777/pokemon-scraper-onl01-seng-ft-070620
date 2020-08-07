require 'pry'

class Pokemon

  attr_accessor :id ,:name, :type, :db

  def initialize(poke_hash)
    poke_hash.each {|key, value| self.send(("#{key}="), value)}
    binding.pry
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL
    db.execute(sql, db, name, type)
    @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]

  end

end
