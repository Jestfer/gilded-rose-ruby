require 'conjured_item'

describe ConjuredItem do

  subject(:mana_potion) { described_class.new('Mana Potion', 10, 10) }
  subject(:expired_mana_potion) { described_class.new('Mana Potion', 0, 4) }

  describe "#next_day" do
    it "reduces sell_in property by 1 when 1 day passes" do
      mana_potion.next_day

      expect(mana_potion.sell_in).to eq 9
    end
  end

  describe "#update_item" do
    it "degrades conjured item quality twice as fast as common items" do
      mana_potion.update_item

      expect(mana_potion.quality).to eq 8
    end

    it "degrades expired conjured item quality twice as fast as expired common items" do
      expired_mana_potion.update_item
      expect(expired_mana_potion.quality).to eq 0
    end
  end
end
