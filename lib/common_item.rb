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
end

private

def expiracy_check
  true if self.sell_in < 0
end

def reduce_quality
  return nil if self.quality == MIN_QTY
  
  expiracy_check == true ? self.quality -= 2 : self.quality -= 1
end
