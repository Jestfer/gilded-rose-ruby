require 'common_item'

describe CommonItem do

  subject(:chicken) { described_class.new('chicken', 10, 10) }
  subject(:expired_chicken) { described_class.new('expired_chicken', 0, 10) }
  subject(:worst_chicken) { described_class.new('expired_chicken', 0, 0) }

  describe "#next_day" do
    it "reduces sell_in property by 1 when 1 day passes" do
      chicken.next_day

      expect(chicken.sell_in).to eq 9
    end

    it "degrades item quality by 1 when item is updated" do
      chicken.update_item

      expect(chicken.quality).to eq 9
    end

    it "degrades item quality twice as fast when item is expired" do
      expired_chicken.update_item

      expect(expired_chicken.quality).to eq 8
    end

    it "does not reduce the item quality below 0" do
      worst_chicken.update_item

      expect(worst_chicken.quality).to eq 0
    end
  end
end
