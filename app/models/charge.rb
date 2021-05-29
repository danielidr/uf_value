class Charge < ApplicationRecord
    def self.charge_client(client1)
        @charge = Charge.find_by(client: client1)
        if @charge == nil
            return 404
        else
            Charge.create(client: client1, quantity: 1)
            @charge.update(quantity: @charge.quantity + 1)
            return 200
        end 
    end
end
