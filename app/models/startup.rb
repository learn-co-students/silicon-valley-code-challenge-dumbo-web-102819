class Startup
    @@all = []
    attr_accessor :name 
    attr_reader :founder, :domain
    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain 
        @@all << self 
    end 
    def self.all
        @@all
    end 

    def pivot(new_domain)
        @domain = new_domain
    end 

    def funding_rounds 
        FundingRound.all.select do |instance|
            instance.startup == self
        end 
    end 

    def self.find_by_founder(founder_name)
        @@all.find do |instance_startup|
            instance_startup.founder == founder_name 
        end 
    end 
    def self.domains
        @@all.map do |instance_startup|
            instance_startup.domain 
        end 
    end 
    def sign_contract(venture_capitalist, type, amount)
        FundingRound.new(type, amount, self, venture_capitalist)
    end 
    def num_funding_round
        funding_rounds.select{ |instance| instance.startup == self }.count
    end 
    def total_funds
        total_variable = 0
        funding_rounds.each do |instance|
            if instance.startup == self
                total_variable += instance.investment 
            end 
        end 
        total_variable
    end 
    def investors 
        new_array = funding_rounds.map do |instance| 
            instance.venture_capitalist 
        end 
        new_array.uniq
    end 
    def big_investors 
        new_array = funding_rounds.map do |instance|
            if instance.investment >= 1_000_000_000 
                instance.venture_capitalist
            end 
        end 
        new_array.uniq
    end 
end
