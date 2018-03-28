class LegendaryItem < Item
  NAME = 'Sulfuras, Hand of Ragnaros'

  def initialize(name = NAME, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def update
    self
  end
end
