class Startup
    
    attr_reader :founder, :name, :domain
    @@all = []
    def initialize(name,founder,domain)
        @name = name
        @founder = founder
        @domain = domain
        
        @@all << self
    end

    def pivot(domain,name)
        @domain = domain
        @name = name
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder_name)
        all.select do |startup|
            startup.founder == founder_name
        end
    end

    def self.domains
        all.map do |startup|
            startup.domain
        end
    end

    def sign_contract(venture_capitalist,type,amount)
        FundingRound.new(self,venture_capitalist,type,amount)
    end

    def funding_rounds
        FundingRound.all.select do |funding_round|
            funding_round.startup == self
        end
    end

    def num_funding_rounds
        funding_rounds.length
    end

    def total_funds
        funding_rounds.map do |funding_round|
            funding_round.investment
        end.reduce(:+)
    end

    def investors
        funding_rounds.map do |funding_round|
            funding_round.venture_capitalist
        end.uniq
    end

    def big_investors
        investors.select do |investor|
            VentureCapitalist.tres_comma_club.include?(investor)
        end
    end
end
