class KaraokeBar
  attr_reader(:name, :entry_fee, :rooms)

  def initialize(name, entry_fee, rooms = [], songs = [])
    @name = name
    @entry_fee = entry_fee
    @rooms = rooms
    @songs = songs
  end

end
