class DeadlineItem < CommonItem
  NAME = 'Backstage passes to a TAFKAL80ETC concert'

  def initialize(name = NAME, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end
end
