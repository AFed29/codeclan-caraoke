class Guest
  attr_reader(:name, :wallet)

  def initialize(name, wallet)
    @name = name
    @wallet = wallet.round(2)
  end

end
