require 'item'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
        if item.quality > 0
          reduce_quality(item)
        end
      else
        if item.quality < 50
          item.quality = item.quality + 1
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            if item.sell_in < 11
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
            if item.sell_in < 6
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
          end
        end
      end
      reduce_sell_in(item)
      if item.sell_in < 0
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            if item.quality > 0
              reduce_quality(item)
            end
          else
            bin_passes(item)
          end
        else
          increase_brie_quality(item)
        end
      end
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

def increase_brie_quality(item)
  item.quality += 1 if item.quality < 50
end

def bin_passes(item)
  item.quality = 0
end
