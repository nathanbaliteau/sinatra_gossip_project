class Gossip

  attr_reader :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end

  def save
    File.open("./db/gossip.csv", "ab") do |f| 
      f.write("#{@author},#{@content}\n")
      puts "#{@author} dit : #{@content}"
    end
  end

  def self.all
    all_gossips = []
    CSV.foreach("./db/gossip.csv") do |row|
      gossip_temp = Gossip.new(row[0], row[1])
      all_gossips << gossip_temp
    end
    return all_gossips
  end

  def self.find(id)
    return self.all[id.to_i]
  end

end