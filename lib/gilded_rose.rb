require 'item'
require 'common_item'
require 'legendary_item'
require 'aged_item'
require 'deadline_item'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      item.update_item
    end
  end
end
