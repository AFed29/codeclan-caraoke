class KaraokeBar
  attr_reader(:name, :till, :entry_fee, :rooms, :songs)

  def initialize(name, till, entry_fee, rooms = [], songs = [])
    @name = name
    @till = till
    @entry_fee = entry_fee
    @rooms = rooms
    @songs = songs
  end

  def add_money_to_till()
    @till += @entry_fee
  end

  def guest_checking_into_room(guest, chosen_room)
    @rooms.each do |room|
      if (room == chosen_room && room.guests().count < room.size())
        if (guest.wallet() >= @entry_fee)
          room.add_guest_to_room(guest)
          guest.remove_money(@entry_fee)
          add_money_to_till()
        end
      end
    end
  end

end
