module Printer
    def print()
        @item.each do |i|
            puts "#{i[:quantity]} #{i[:name]} : #{'%.2f' % (i[:final_price])}"
        end
        puts "#{'%.2f' % @total_tax}"
        puts "#{'%.2f' % @total}"
    end
end

class TaxCalculator
    def self.calculate_tax(price,name)
        tax_rate=is_exempted?(name)? 0 : 0.10
        tax_rate+=0.05 if is_imported?(name)

        tax=(price*tax_rate*20).ceil/20.0
        tax
    end
    def is_imported?(name)
        name.include?('imported')
    end
    def is_exempted?(name)
        name.include?('book') || name.include?('chocolate') || name.include?('chocolates') || name.include?('pills')
    end
end

class Order
    include Printer
    attr_accessor :item, :total_tax,:total

    def initialize
        @item=[]
        @total_tax=0
        @total=0
    end

    def add_item(quantity,name,price)
        tax=TaxCalculator.calculate_tax(price,name)
        final_price=price+tax
        @item<<{name: name, final_price: final_price, quantity: quantity}
        @total_tax+=tax*quantity
        @total+=final_price*quantity
    end
end

class Driver
  def input(order)
    puts "Enter items or enter done"
    loop do
     puts "Enter item in the form of [quantity name at price]"
     item=gets.chomp()
     break if item.downcase== "done"

     item_name,at,price=item.rpartition(" at ")
     quantity,name=item_name.split(' ')
     order.add_item(quantity.to_i,name,price.to_f)
    end
  end
end

order=Order.new
driver=Driver.new
driver.input(order)
order.print()