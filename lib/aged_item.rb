require 'common_item'

class AgedItem < CommonItem
  NAME = 'Aged Brie'

  def initialize(name = NAME, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def update_item
    next_day
    increase_quality
  end
  
  private
  
  def increase_quality
    @quality += 1 if @quality < MAX_QTY
  end
end

