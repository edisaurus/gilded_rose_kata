def update_quality(items)
  name = [
          'Aged Brie',
          'Backstage passes',
          'Backstage passes to a TAFKAL80ETC concert', 
          'Sulfuras, Hand of Ragnaros',
         ]
  items.each do |item|
      # item is Aged Brie or Backstage passes
      if item.name == name[0]
        item.sell_in -= 1
        item.quality += 1
      
      elsif item.name == name[1] && item.sell_in > 10
        item.sell_in -= 1
        item.quality += 1
      
      # item is Backstage passes
      elsif item.name == name[1] && item.sell_in < 5
        item.sell_in -= 1
        item.quality += 3

      elsif item.name == name[1] && item.sell_in < 10
        item.sell_in -= 1
        item.quality += 2
      
      # item is Backstage passes concert
      elsif item.name == name[2]
        item.quality = 0

      # item is Sulfuras
      elsif item.name == name[3]
        item.sell_in = item.sell_in
        item.quality = item.quality
      
      # item is Conjured
      elsif item.name.start_with? "Conjured"
        item.sell_in -= 1
        item.quality -= 2
      
      # item is Normal
      else
        item.sell_in -= 1
        item.quality -= 1
      end
  end
end

# DO NOT CHANGE THINGS BELOW -----------------------------------------

Item = Struct.new(:name, :sell_in, :quality)

# We use the setup in the spec rather than the following for testing.
#
# Items = [
#   Item.new("+5 Dexterity Vest", 10, 20),
#   Item.new("Aged Brie", 2, 0),
#   Item.new("Elixir of the Mongoose", 5, 7),
#   Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
#   Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
#   Item.new("Conjured Mana Cake", 3, 6),
# ]

# puts update_quality(Items)
#<struct Item name="+5 Dexterity Vest", sell_in=9, quality=19>
#<struct Item name="Aged Brie", sell_in=1, quality=1>
#<struct Item name="Elixir of the Mongoose", sell_in=4, quality=6>
#<struct Item name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=80>
#<struct Item name="Backstage passes to a TAFKAL80ETC concert", sell_in=14, quality=21>
#<struct Item name="Conjured Mana Cake", sell_in=2, quality=5>
