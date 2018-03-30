require 'gilded_rose'

describe GildedRose do

  let(:chicken) { double('common item', name: 'chicken', sell_in: 10, quality: 10) }
  let(:expired_chicken) { double('common item', name: 'chicken', sell_in: 0, quality: 10) }
  let(:lowest_quality_chicken) { double('common item', name: 'chicken', sell_in: 0, quality: 0) }

  # Eddie thinks there is a way to let all doubles take the same function
  # Then we return whatever we need for the specific case
  ## expect(chicken).to receive(:update_item)

  # Mock instances of other item classes the same way!

  describe "#update_quality" do
    it "does not change the name" do
      items = [chicken]
      expect(chicken).to receive(:update_item)
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "chicken"
    end

    it "degrades avg item qty by 1 when 1 day passes" do
      items = [chicken]

      allow(chicken).to receive(:quality).and_return(chicken.quality - 1)
      expect(chicken).to receive(:update_item)
      GildedRose.new(items).update_quality()

      expect(items[0].quality).to eq 9
    end

    it "reduces avg item sell_in by 1 when 1 day passes" do
      items = [chicken]

      allow(chicken).to receive(:sell_in).and_return(chicken.sell_in - 1)
      expect(chicken).to receive(:update_item)
      GildedRose.new(items).update_quality()

      expect(items[0].sell_in).to eq 9
    end

    it "degrades avg item qty by 2 when item expired" do
      items = [expired_chicken]

      allow(expired_chicken).to receive(:quality).and_return(expired_chicken.quality - 2)
      expect(expired_chicken).to receive(:update_item)
      GildedRose.new(items).update_quality()

      expect(items[0].quality).to eq 8
    end

    it "does not reduce the item quality below 0" do
      items = [lowest_quality_chicken]

      allow(lowest_quality_chicken).to receive(:quality).and_return(lowest_quality_chicken.quality)
      expect(lowest_quality_chicken).to receive(:update_item)
      GildedRose.new(items).update_quality()
  
      expect(items[0].quality).to eq 0
    end

    # Aged Brie
    it "checks that item quality does not exceed 50" do
      items = [AgedItem.new(9, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 50
    end

    it "increases aged brie qty the older it gets" do
      items = [AgedItem.new(9, 9)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 10
    end

    # Sulfuras
    it "checks that Sulfuras sell_in and quality do not change" do
      items = [LegendaryItem.new(10, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 10
      expect(items[0].quality).to eq 10
    end

    # Backstage passes
    it "checks that Backstage passes' qty increases by 2 when <10 days" do
      items = [DeadlineItem.new(10, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 12
    end

    it "checks that Backstage passes' qty increases by 3 when <5 days" do
      items = [DeadlineItem.new(5, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 13
    end

    it "checks that Backstage passes have no value after the concert" do
      items = [DeadlineItem.new(0, 5)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end
  end
end
