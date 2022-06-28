require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    describe "Item: Aged Brie" do 
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
      
      it "should not go over 50 in quantity" do 
        items = [Item.new("Aged Brie", 2, 50)]
        market = GildedRose.new(items)

        market.update_quality
        aged_brie = market.items[0]

        expect(aged_brie).to have_attributes(:name => "Aged Brie", :sell_in => 1, :quality => 50)
      end
    end

    describe "Item: Backstage passes to a TAFKAL80ETC concert" do
      it "should increase in quality as @sell_in decreases" do 
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 3)]
        market = GildedRose.new(items)

        market.update_quality
        backstage_pass = market.items[0]

        expect(backstage_pass).to have_attributes(:name => "Backstage passes to a TAFKAL80ETC concert", :sell_in => 10, :quality => 4)
      end

      it "should increase in quality by 2 when @sell_in is less than 10" do 
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 5)]
        market = GildedRose.new(items)

        market.update_quality
        backstage_pass = market.items[0]

        expect(backstage_pass).to have_attributes(:name => "Backstage passes to a TAFKAL80ETC concert", :sell_in => 9, :quality => 7)
      end

      it "should increase in quality by 3 when @sell_in is less than 5" do 
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 10)]
        market = GildedRose.new(items)

        market.update_quality
        backstage_pass = market.items[0]

        expect(backstage_pass).to have_attributes(:name => "Backstage passes to a TAFKAL80ETC concert", :sell_in => 4, :quality => 13)
      end

      it "should drop quality to 0 after the concert" do 
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 13)]
        market = GildedRose.new(items)

        market.update_quality
        backstage_pass = market.items[0]

        expect(backstage_pass).to have_attributes(:name => "Backstage passes to a TAFKAL80ETC concert", :sell_in => -1, :quality => 0)
      end
    end

  end

end
