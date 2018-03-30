describe Item do
  describe "#initialize" do
    it "returns a string of a created instance" do
      chicken = Item.new('pollo', 10, 10)

      expect(chicken.to_s).to eq 'pollo, 10, 10'
    end
  end
end
