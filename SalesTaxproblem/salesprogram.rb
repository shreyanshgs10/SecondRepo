$LOAD_PATH << '.'

require "salesprogrammodule.rb"

class TaxCalculator

    def initialize
        @item=[]
        @total_tax=0
        @total=0
    end


    def add(quantity,name,price)

        importedd=importedm(name)
        exempt=exemptm(name)

        tax=calc_tax(price,importedd,exempt)
        final_p=price+tax
        @item<<{name: name, final_price: final_p, quantity: quantity}
        @total_tax+=tax*quantity
        @total+=final_p*quantity
    end


    def importedm(name)
        return name.include?('imported')
    end


    def exemptm(name)
        return name.include?('book') || name.include?('chocolate') ||name.include?('pilll')
    end



    def calc_tax(price,imported,exempt)
        tax_rate=exempt ? 0 : 0.10
        if imported
            tax_rate+=0.05
        end
        tax=(price*tax_rate*20).ceil/20.0
        return tax
    end

    include TC
    
end






calc=TaxCalculator.new
puts "Enter items or enter done"
loop do

    puts "Enter item in the form of [quantity name at price]"
    item=gets.chomp()
    break if item.downcase== "done"

    item_name,at,price=item.rpartition(" at ")
    quantity,name=item_name.split(' ')

    
    calc.add(quantity.to_i,name,price.to_f)


end
calc.print


 
