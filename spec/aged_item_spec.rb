require 'aged_item'

describe AgedItem do

  subject(:brie) { described_class.new(9, 9) }
  subject(:best_brie) { described_class.new(9, 50) }

  describe "#initialize" do
    it "instantiates with name = 'Aged Brie' being the only existing AgedItem" do
      expect(brie.name).to eq 'Aged Brie'
    end

    describe "#next_day" do
      it "reduces sell_in property by 1 when 1 day passes" do
        brie.next_day

        expect(brie.sell_in).to eq 8
      end
    end

    describe "#update_item" do
      it "should not increase item quality beyond 50" do
        best_brie.update_item

        expect(best_brie.quality).to eq 50
      end

      it "increases brie quality the older it gets" do
        brie.update_item

        expect(brie.quality).to eq 10
      end
    end
  end
end
