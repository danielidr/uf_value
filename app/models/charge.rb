class Charge < ApplicationRecord
    def self.charge_client(client1)
        charge = Charge.find_by(client: client1)
        if charge == nil
            Charge.create(client: client1, quantity: 1)
        else
            charge.update(quantity: charge.quantity + 1)
        end 
    end
end
