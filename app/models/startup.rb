class Startup
    attr_accessor :name
    attr_reader :founder, :domain
    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(domain, name)
        @domain = domain ##TODO
        @name = name
    end

    def sign_contract(vc_instance, investment_type, amount)
        FundingRound.new(self, vc_instance, investment_type, amount)
    end

    def funding_rounds
        FundingRound.all.select{|round|
            round.startup == self
        }
    end

    def num_funding_rounds
        funding_rounds.length
    end

    def total_funds
        funding_rounds.reduce(0){|sum, funding_round|
            sum += funding_round.investment
        }
    end

    def investors
        funding_rounds.map{|round|
            round.venture_capitalist
    }.uniq
    end


    #Opted not to use the tres_commas_club method here due to runtime inefficiency
    #no need to compare two arrays when I can check one, single source of truth still maintained
    def big_investors
        investors.select{|investor|
            investor.total_worth > 1_000_000_000
        }
    end


###############################################################

    def self.all
        @@all
    end

    def self.find_by_founder(founder)
        @@all.find{|startup|
            startup.founder == founder
        }
    end

    def self.domains
        @@all.map{|startup|
            startup.domain
    }.uniq
    end
end
