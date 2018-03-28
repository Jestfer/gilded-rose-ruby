require 'item'
require 'legendary_item'
require 'aged_item'
require 'deadline_item'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if !is_brie?(item) && !is_backstage_passes?(item)
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
  item.quality -= 1 if (!is_sulfuras?(item) && item.quality > 0)
end

def reduce_sell_in(item)
  item.sell_in -= 1 if !is_sulfuras?(item)
end

def increase_quality(item)
  if is_backstage_passes?(item)
    return item.quality += 3 if item.sell_in < 6
    return item.quality += 2 if item.sell_in < 11
  end

  item.quality += 1 if item.quality < 50
end

def bin_passes(item)
  item.quality = 0
end

def is_backstage_passes?(item)
  item.instance_of? DeadlineItem
end

def is_brie?(item)
  item.instance_of? AgedItem
end

def is_sulfuras?(item)
  item.instance_of? LegendaryItem
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
