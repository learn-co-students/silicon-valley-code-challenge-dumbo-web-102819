class VentureCapitalist
    @@all = []
    attr_reader :name, :total_worth
    def initialize(name, total_worth)
        @name = name 
        @total_worth = total_worth 
        @@all << self
    end 
    def self.all
        @@all 
    end 
    def self.tres_commas_club
        @@all.select do |instance|
            instance.total_worth >= 1_000_000_000
        end 
    end 
    def offer_contract(startup, type, amount)
        FundingRound.new(type, amount, startup, self)
    end 
    def funding_rounds
        FundingRound.all.select do |instance|
            instance.venture_capitalist == self
        end 
    end 
    def portfolio
        new_array = funding_rounds.map do |instance|
            instance.startup
        end 
        new_array.uniq
    end 
    def biggest_investment 
        funding_rounds.max_by do |instance|
            instance.investment 
        end 
    end 
    def invested(domain_arg)
        total_amount_invested = 0
        funding_rounds.each do |instance|
            if instance.startup.domain == domain_arg
                total_amount_invested += instance.investment
            end 
        end 
        total_amount_invested
    end 
end
