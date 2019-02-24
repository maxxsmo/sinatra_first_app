
class Gossip

  attr_accessor :author, :content, :id


  def initialize (id, author, content)
    @id = id 
    @author = author
    @content = content
    
  end


  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@id, @author, @content]
    end
  end

  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1], csv_line[2])
    end
    return all_gossips
  end

  def self.find(id)
    author = ""
    content = ""
    array = Array.new
    CSV.read("./db/gossip.csv").each do |row|
      if id == row[0]
        author = row[1]
        content = row[2]
      end
    end
    return array = [id, author, content]
  end


end


# p p1 = Gossip.new("fzgrgr", "gregreg")
# p p2 = Gossip.new("fzgrgr", "gregreg")
# p Gossip.find(1)
