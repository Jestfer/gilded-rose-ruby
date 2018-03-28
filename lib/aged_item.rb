class AgedItem < Item
  NAME = 'Aged Brie'

  def initialize(name = NAME, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end
end
