require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    describe "Item Aged Brie" do 
      it "should increase in quality as @sell_in decreases" do 
        items = [Item.new("Aged Brie", 3, 3)]
        market = GildedRose.new(items)

        market.update_quality
        aged_brie = market.items[0]

        expect(aged_brie).to have_attributes(:name => "Aged Brie", :sell_in => 2, :quality => 4)
      end
      
      it "should double in quality as @sell_in is updated after the expiration" do 
        items = [Item.new("Aged Brie", 0, 4)]
        market = GildedRose.new(items)

        market.update_quality
        aged_brie = market.items[0]

        expect(aged_brie).to have_attributes(:name => "Aged Brie", :sell_in => -1, :quality => 6)
      end
    end

  end

end
