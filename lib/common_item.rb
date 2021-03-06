require 'item'

MIN_QTY = 0
MAX_QTY = 50

class CommonItem < Item

  def next_day
    @sell_in -= 1
  end

  def update_item
    next_day

    expiracy_check

    reduce_quality
  end

  private
  
  def expiracy_check
    true if @sell_in < 0
  end
  
  def reduce_quality(times = 1)
    return nil if @quality == MIN_QTY
  
    expiracy_check == true ? @quality -= 2 * times : @quality -= 1 * times
  end
end
