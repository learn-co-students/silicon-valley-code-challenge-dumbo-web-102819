require "pry"
class Startup
    attr_reader :founder, :domain, :name
    

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain

        @@all << self  
        

    end #initialize

    def self.all
        @@all
    end ## all

    def pivot(domain, name)
        @domain = domain
        @name = name

    end ### pivot

    def self.find_by_founder(founder_name)
        self.all.find{|startup| startup.founder == founder_name}

    end ### find by founder


    def self.domains
        self.all.map{|startup| startup.domain}
    end ##domains


    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end ### sign contract

    def funding_rounds
        FundingRound.all.select{|funding_round| funding_round.startup == self}
    end ## funding_rounds
    
    def num_funding_rounds
        funding_rounds.size
        
    end ### num rounds


    def total_funds
        funding_rounds.map{|funding_round| funding_round.investment}.sum
    
    end ### total_funds

    def investors
        funding_rounds.map{|funding_round| funding_round.venture_capitalist}.uniq
    
    end ##investors

    def big_investors
        
        investors.select {|venture_capitalist| venture_capitalist.total_worth > 1_000_000_000}
        # binding.pry   
    end ### big investors
end ### Startup Class
