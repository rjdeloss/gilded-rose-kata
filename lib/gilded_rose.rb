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
  AGED_BRIE = 'Aged Brie'
  BACKSTAGE_PASS = "Backstage passes to a TAFKAL80ETC concert"
  SULFURAS = "Sulfuras, Hand of Ragnaros"

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
  
  def update_quality
    if @name != AGED_BRIE and @name != BACKSTAGE_PASS
      if @quality > 0
        if @name != SULFURAS
          @quality = @quality - 1
        end
      end
    else
      if @quality < 50
        adjust_quantity(1)
        if @name == BACKSTAGE_PASS
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
    if @name != SULFURAS
      @sell_in = @sell_in - 1
    end
    if @sell_in < 0
      if @name != AGED_BRIE
        if @name != BACKSTAGE_PASS
          if @quality > 0
            if @name != SULFURAS
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