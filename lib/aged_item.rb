class AgedItem < CommonItem
  NAME = 'Aged Brie'

  def initialize(name = NAME, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def update_item

  end
end
