class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one(item)
        self.freebies.any? { |freebie| freebie.item_name == item}
    end

    def give_away(dev, freebie)
        freebie.update(dev_id: dev) unless freebie.dev != self
      end
end
