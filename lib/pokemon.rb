class Pokemon

  attr_accessor :id ,:name, :type, :db

  def initialize(poke_hash)
    poke_hash.each {|key, value| self.send(("#{key}="), value)}
    #binding.pry
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL
    db.execute(sql, name, type)
    @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]

  end

  def self.find(id, db)
    sql = <<-SQL
      SELECT * FROM pokemon WHERE id = ? LIMIT 1
    SQL

    db.execute(sql, id).collect{|row| self.new_from_db(row)}.first
  end

end
