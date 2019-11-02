class VentureCapitalist
    attr_accessor :name, :total_worth
    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def offer_contract(startup, type_of_investment, amount)
        FundingRound.new(startup, self, type_of_investment, amount)
    end

    def funding_rounds
        FundingRound.all.select{|round|
            round.venture_capitalist == self
        }
    end

    def portfolio
        funding_rounds.map{|round|
            round.startup
        }.uniq
    end

    def biggest_investment
        funding_rounds.max_by{|round|
            round.investment
        }
    end

    def invested(domain)
        rounds_in_domain = funding_rounds.select{|round|
            round.startup.domain == domain
        }
        rounds_in_domain.sum{|round|
            round.investment
        }
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        @@all.select{|venture_capitalist|
            venture_capitalist.total_worth > 1_000_000_000
        }
    end
end
