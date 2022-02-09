class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    def self.oldest_company
        self.all.min_by { |c| c.founding_year }
    end

    def give_freebie(dev, item_name, value)
        Freebie.create(dev_id: dev.id, item_name: item_name, value: value, company_id: self.id)
    end
    
end
