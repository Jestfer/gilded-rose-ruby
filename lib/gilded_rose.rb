require 'item'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if !is_brie?(item) && !is_backstage_passes?(item)
        reduce_quality(item) if item.quality > 0
      else
        if item.quality < 50
          item.quality = item.quality + 1
          
          increase_quality(item) if is_backstage_passes?(item)
        end
      end

      reduce_sell_in(item)

      sell_in_zero(item)
    end
  end
end

private

def reduce_quality(item)
  item.quality -= 1 if item.name != "Sulfuras, Hand of Ragnaros"
end

def reduce_sell_in(item)
  item.sell_in -= 1 if item.name != "Sulfuras, Hand of Ragnaros"
end

def increase_quality(item)
  if is_backstage_passes?(item)
    return item.quality += 2 if item.sell_in < 6
    return item.quality += 1 if item.sell_in < 11
  end

  item.quality += 1 if item.quality < 50
end

def bin_passes(item)
  item.quality = 0
end

def is_backstage_passes?(item)
  item.name == "Backstage passes to a TAFKAL80ETC concert"
end

def is_brie?(item)
  item.name == "Aged Brie"
end

def sell_in_zero(item)
  if item.sell_in < 0
    if !is_brie?(item)
      if !is_backstage_passes?(item)
        reduce_quality(item) if item.quality > 0
      else
        bin_passes(item)
      end
    else
      increase_quality(item)
    end
  end
end
