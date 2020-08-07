class Pokemon

  attr_accessor :id ,:name, :type, :db

  def initialize(poke_hash)
    poke_hash.each {|key, value| self.send(("#{key}="), value)}
  end

  def save
    sql = <<-SQL
      INSERT INTO students (name, grade)
      VALUES (?, ?)
    SQL
    DB[:conn].execute(sql, self.name, self.grade)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
  end

end
