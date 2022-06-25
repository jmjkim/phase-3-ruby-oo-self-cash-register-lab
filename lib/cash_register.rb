require 'pry'

class CashRegister
    attr_reader :items
    attr_accessor :total, :discount, :price, :quantity, :last_transaction_total
    
    def initialize(discount = 0)
        @items = []

        @total = 0
        self.discount = discount
    end
    
    def add_item(title, price, quantity = 1)
        self.price = price
        self.quantity = quantity

        @total += price * quantity

        quantity.times { @items << title }
    end

    def apply_discount
        if (self.discount != 20)
            "There is no discount to apply."
        else
            @total -= (@total * self.discount / 100)
            "After the discount, the total comes to $#{@total}."
        end
    end

    def items
        return @items
    end

    def void_last_transaction
        @total -= self.price * self.quantity
    end
end