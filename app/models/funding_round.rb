class FundingRound

    attr_reader :startup, :venture_capitalist
    attr_accessor :type

    @@all = []

    def initialize(type, startup, venture_capitalist)
        @investment
        @type = type
        @startup = startup
        @venture_capitalist = venture_capitalist

        @@all << self
    end

    def self.all
        @@all
    end

    def investment=(num)
        if(num < 0)
           @investment = "No Negative Numbers"
        else
            @investment = num.round
        end
    end

    def investment
        @investment
    end
    
end
