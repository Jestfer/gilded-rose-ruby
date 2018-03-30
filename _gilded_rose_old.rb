require 'item'
require 'common_item'
require 'legendary_item'
require 'aged_item'
require 'deadline_item'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      if !brie?(item) && !backstage_passes?(item)
        reduce_quality(item)
      else
        increase_quality(item)
      end

      reduce_sell_in(item)

      sell_in_zero(item)
    end
  end
end

private

def reduce_quality(item)
  item.quality -= 1 if (!sulfuras?(item) && item.quality > 0)
end

def reduce_sell_in(item)
  item.sell_in -= 1 if !sulfuras?(item)
end

def increase_quality(item)
  if backstage_passes?(item)
    return item.quality += 3 if item.sell_in < 6
    return item.quality += 2 if item.sell_in < 11
  end

  item.quality += 1 if item.quality < 50
end

def bin_passes(item)
  item.quality = 0
end

def backstage_passes?(item)
  item.instance_of? DeadlineItem
end

def brie?(item)
  item.instance_of? AgedItem
end

def sulfuras?(item)
  item.instance_of? LegendaryItem
end

def sell_in_zero(item)
  deadline_quality(item) if item.sell_in < 0
end

def deadline_quality(item)
  if !brie?(item)
    bin_passes(item) if backstage_passes?(item)

    reduce_quality(item)
  else
    increase_quality(item)
  end
end
