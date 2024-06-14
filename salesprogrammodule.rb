module TC
    def print()
        @item.each do |i|
            puts "#{i[:quantity]} #{i[:name]} : #{'%.2f' % (i[:final_price])}"
        end
            puts "#{'%.2f' % @total_tax}"
            puts "#{'%.2f' % @total}"
    end
end