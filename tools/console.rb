require_relative '../config/environment.rb'


def reload
  load 'config/environment.rb'
end

blahco = Startup.new("Blah Co", "Gerald","Blahco.com")
meep = Startup.new("Meep", "Meryl","Meep.com")
shtool = Startup.new("Shtoolio", "Leif","Shtoolio.com")

mark_cuban = VentureCapitalist.new("Mark Cuban",6_000_000_000)
sarah_paul = VentureCapitalist.new("Sarah Paul",9_000_000_000)
birdie_lopez = VentureCapitalist.new("Birdie Lopez",400_000_000)

fr1 = FundingRound.new(blahco,mark_cuban,"Angel",9_000_000)
fr2 = FundingRound.new(meep,mark_cuban,"Angel",6_000_000)
fr3 = FundingRound.new(shtool,mark_cuban,"Pre-Seed",3_500_000)
fr4 = FundingRound.new(meep,sarah_paul,"Series A",4_100_000)
fr5 = FundingRound.new(shtool,sarah_paul,"Series B",10_900_000)
fr6 = FundingRound.new(shtool,birdie_lopez,"Seed",7_000_000)
fr7 = FundingRound.new(blahco,birdie_lopez,"Series C",8_400_000)
fr8 = FundingRound.new(blahco,mark_cuban,"Angel",9_000_000)
fr9 = FundingRound.new(blahco,mark_cuban,"Angel",9_000_000)
fr10 = FundingRound.new(blahco,mark_cuban,"Angel",9_000_000)

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

binding.pry
0 #leave this here to ensure binding.pry isn't the last line