class Room
  attr_reader(:name, :size, :guests, :songs)

  def initialize(name, size, guests = [], songs = [])
    @name = name
    @size = size
    @guests = guests
    @songs = songs
  end

  def add_guest_to_room(guest)
    @guests.push(guest)
  end

  def remove_guest_from_room(guest)
    @guests.delete(guest)
  end

  def add_group_of_guests_to_room(guests)
    guests.each { |guest| @guests.push(guest)}
  end

  def remove_group_of_guests_from_room(guests)
    guests.each { |guest| @guests.delete(guest) }
  end

  def add_song_to_room(song)
    @songs.push(song)
  end

  def remove_song_from_room(song)
    @songs.delete(song)
  end

  def reset_room()
    @guests.clear()
    @songs.clear()
  end


end
