class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        !!self.freebies.find_by(item_name: item_name)
    end

    def give_away(dev, freebie)
        if self.id != freebie.dev_id
            return "DO NOT GIVE WHAT IS NOT YOURS"
        end

        freebie.update(dev_id: dev.id)
    end


end
