require 'pry'

DB = {:conn => SQLite3::Database.new("db/pokemon.db")}

class Pokemon

  attr_accessor :id ,:name, :type, :db

  def initialize(poke_hash)
    poke_hash.each {|key, value| self.send(("#{key}="), value)}
  end

  def self.save(name, type, db)
    binding.pry
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL
    DB[:conn].execute(sql, db, name, type)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end

end
