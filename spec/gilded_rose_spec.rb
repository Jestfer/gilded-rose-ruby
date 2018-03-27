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

    
  end
end
