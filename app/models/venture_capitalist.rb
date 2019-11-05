class VentureCapitalist

    attr_reader :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth

        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.select do |capitalist_instance|
            capitalist_instance.total_worth > 1_000_000_000
        end
    end

    def offer_contract(type, startup, investment)
        new_round = FundingRound.new(type, startup, self)
        new_round.investment = investment
        new_round
    end

    def funding_rounds
        FundingRound.all.select do |instance|
            instance.venture_capitalist == self
        end
    end

    def portfolio
        funding_rounds.map do |instance|
            instance.startup
        end.uniq
    end

    def biggest_investments
        
        funding_rounds.map do |instance|
            instance.investment
        end.max
    end

    def invested(domain)
        total = 0
        funding_rounds.map do |instance|
            if(instance.startup.domain == domain)
                total += instance.investment
            end
        end
        total
    end
    
end
