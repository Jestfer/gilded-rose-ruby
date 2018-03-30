require 'gilded_rose'

describe GildedRose do

  let(:common_item) { double('a common item', name: 'Pollo', sell_in: 10, quality: 10) }
  let(:aged_item) { double('an aged item', name: 'Brie', sell_in: 10, quality: 50) }
  let(:legendary_item) { double('a legendary item', name: 'Sulfuras', sell_in: 10, quality: 10) }
  let(:deadline_item) { double('a deadline item', name: 'KISS Backstage Passes', sell_in: 0, quality: 0) }
  let(:conjured_item) { double('a conjured item', name: 'Large Mana Potion', sell_in: 10, quality: 10) }

  let(:items) { [common_item, aged_item, legendary_item, deadline_item] }

  subject(:gilded_rose) { described_class.new(items)}

  describe "#update_quality" do
    it "receives array of different items to iterate through them and update them" do
      allow(common_item).to receive(:update_item)
      allow(aged_item).to receive(:update_item)
      allow(legendary_item).to receive(:update_item)
      allow(deadline_item).to receive(:update_item)
      allow(conjured_item).to receive(:update_item)

      gilded_rose.update_quality
    end
  end
end
