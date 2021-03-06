require_relative './gilded_rose'

RSpec.describe "GildedRose" do
  context "update quality items" do

    let!(:items) do
      [
      Item.new("+5 Dexterity Vest", 10, 20),
      Item.new("Aged Brie", 2, 0),
      Item.new("Elixir of the Mongoose", 5, 7),
      Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
      Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
      Item.new("Backstage passes", 7, 12),
      Item.new("Backstage passes", 3, 8),
      Item.new("Backstage passes", 11, 14),
      Item.new("Conjured Mana Cake", 3, 6)
      ]
    end

    let(:updated) { update_quality(items) }

    it "Normal Items" do
      expect(updated[0].sell_in).to eq 9
      expect(updated[0].quality).to eq 19
      expect(updated[2].sell_in).to eq 4
      expect(updated[2].quality).to eq 6 
    end

    it "Aged Brie" do
      expect(updated[1].sell_in).to eq 1
      expect(updated[1].quality).to eq 1
    end

    it "Sulfuras, Hand of Ragnaros" do
      expect(updated[3].sell_in).to eq 0
      expect(updated[3].quality).to eq 80
    end

    it "Backstage passes concert" do
      expect(updated[4].quality).to eq 0
    end

    it "Backstage passes with sell in less than 10" do
      expect(updated[5].sell_in).to eq 6
      expect(updated[5].quality).to eq 14
    end

    it "Backstage passes with sell in less than 5" do
      expect(updated[6].sell_in).to eq 2
      expect(updated[6].quality).to eq 11
    end

    it "Backstage passes with sell in more than 10" do
      expect(updated[7].sell_in).to eq 10
      expect(updated[7].quality).to eq 15
    end

    it "Conjured Items" do
      expect(updated[8].sell_in).to eq 2
      expect(updated[8].quality).to eq 4
    end

    it "Quality of item is never negative" do
      updated.each do |item|
        expect(item.quality).to be > -1
      end
    end
  end 
end
