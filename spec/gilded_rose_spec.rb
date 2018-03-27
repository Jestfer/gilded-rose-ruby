require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("chicken", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "chicken"
    end

    it "degrades avg item qty by 1 when 1 day passes" do
      items = [Item.new("chicken", 10, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 9
    end

    it "degrades avg item qty by 2 when item expired" do
      items = [Item.new("chicken", 0, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 8
    end

    it "does not reduce the item quality below 0" do
      items = [Item.new("chicken", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end

    it "increases aged brie qty the older it gets" do
      items = [Item.new("Aged Brie", 9, 9)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 10
    end

    it "checks that item quality does not exceed 50" do
      items = [Item.new("Aged Brie", 9, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 50
    end

    it "checks that Sulfuras sell_in and quality do not change" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 10, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 10
      expect(items[0].quality).to eq 10
    end

    # Backstage passes
    it "checks that Backstage passes' qty increases by 2 when <10 days" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 12
    end

    it "checks that Backstage passes' qty increases by 3 when <5 days" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 13
    end

    it "checks that Backstage passes have no value after the concert" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 5)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end
  end
end
