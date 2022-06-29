class GildedRose
  attr_reader  :items

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      item.update_quality
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
  
  def update_quality
    if @name != "Aged Brie" and @name != "Backstage passes to a TAFKAL80ETC concert"
      if @quality > 0
        if @name != "Sulfuras, Hand of Ragnaros"
          @quality = @quality - 1
        end
      end
    else
      if @quality < 50
        adjust_quantity(1)
        if @name == "Backstage passes to a TAFKAL80ETC concert"
          if @sell_in < 11
            if @quality < 50
              adjust_quantity(1)
            end
          end
          if @sell_in < 6
            if @quality < 50
              adjust_quantity(1)
            end
          end
        end
      end
    end
    if @name != "Sulfuras, Hand of Ragnaros"
      @sell_in = @sell_in - 1
    end
    if @sell_in < 0
      if @name != "Aged Brie"
        if @name != "Backstage passes to a TAFKAL80ETC concert"
          if @quality > 0
            if @name != "Sulfuras, Hand of Ragnaros"
              adjust_quantity(-1)
            end
          end
        else
          adjust_quantity(-(@quality))
        end
      else
        if @quality < 50
          adjust_quantity(1)
        end
      end
    end
  end

  def adjust_quantity(adjustment)
    @quality += adjustment
  end
end