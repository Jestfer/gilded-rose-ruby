require 'legendary_item'

describe LegendaryItem do

  subject(:sulfuras) { described_class.new(50, 50) }

  describe "#initialize" do
    it "instantiates with name = 'Sulfuras, Hand of Ragnaros' being the only existing LegendaryItem" do
      expect(sulfuras.name).to eq 'Sulfuras, Hand of Ragnaros'
    end
  end

  describe "#update_item" do
    it "changes nothing" do
      sulfuras.update_item

      expect(sulfuras.sell_in).to eq 50
      expect(sulfuras.quality).to eq 50
    end
  end
end
