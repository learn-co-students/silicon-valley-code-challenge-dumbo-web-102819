class Startup

    attr_reader :founder, :domain
    attr_accessor :name

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        
        @@all << self
    end

    def pivot(name, domain)
        @name = name
        @domain = domain
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder)
        self.all.find do |instance|
            instance.founder == founder
        end
    end

    def self.domains
        self.all.map do |instance|
            instance.domain
        end
    end

    def fundings
        FundingRound.all.select do |instance|
            instance.startup == self
        end
    end

    def sign_contract(venture, investment)
         funding = FundingRound.new("Preseed", self, venture)
         funding = investment
         funding
    end

    def num_funding_rounds
        fundings.length
    end

    def total_funds
        total  = 0
        fundings.each do |instance|
            total += instance.investment
        end
        total
    end

    def investors
        fundings.map do |instance|
            instance.venture_capitalist
        end.uniq
    end

    def big_investors
        VentureCapitalist.all.select do |instance|
            investors.include?(instance)
        end.uniq
    end
    
end
