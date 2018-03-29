class DeadlineItem < CommonItem
  NAME = 'Backstage passes to a TAFKAL80ETC concert'

  def initialize(name = NAME, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def update_item
    next_day
    increase_qty
    check_expiracy
  end
end

private

def check_expiracy
  bin_passes if @sell_in < 0
end

def bin_passes
  @quality = MIN_QTY
end

def increase_qty
  return @quality += 3 if @sell_in < 5
  @quality += 2 if @sell_in < 10
end