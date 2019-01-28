
class Gossip

  attr_accessor :author, :content, :id


  def initialize (author, content)
    @author = author
    @content = content  
  end

  


  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |i|
      all_gossips << Gossip.new(i[0], i[1])
    end
    return all_gossips
  end


end

p user1 = Gossip.new("s", "grgerg")
p user2 = Gossip.new("zrjgrklgjlre", "a")
p user3 = Gossip.new("zrjgrklgjlre", "a")
p user4 = Gossip.new("zrjgrklgjlre", "a")