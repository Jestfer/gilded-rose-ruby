require 'deadline_item'

describe DeadlineItem do

  subject(:passes) { described_class.new(10, 10) }
  subject(:great_passes) { described_class.new(5, 10) }
  subject(:expired_passes) { described_class.new(0, 5) }

  describe "#initialize" do
    it "instantiates with name = 'Backstage passes to a TAFKAL80ETC concert' being the only existing DeadlineItem" do
      expect(passes.name).to eq 'Backstage passes to a TAFKAL80ETC concert'
    end
  end

  describe "#next_day" do
    it "reduces sell_in property by 1 when 1 day passes" do
      passes.next_day

      expect(passes.sell_in).to eq 9
    end
  end

  describe "#update_item" do
    it "increases item quality by 2 when <10 days for deadline" do
      passes.update_item

      expect(passes.quality).to eq 12
    end

    it "increases item quality by 3 when <5 days for deadline" do
      great_passes.update_item

      expect(great_passes.quality).to eq 13
    end

    it "makes passes no valuable after the concert" do
      expired_passes.update_item

      expect(expired_passes.quality).to eq 0
    end
  end
end
