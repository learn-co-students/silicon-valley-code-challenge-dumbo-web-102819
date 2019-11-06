require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

llg = Startup.new("LLG Trans Inc.", "Kaishaer", "New York")
ggg = Startup.new("GGG Coding Corp.", "Guligena", "Chicago")
lll = Startup.new("L and L Toys", "Lena and Leila", "Boston")
kll = Startup.new("KLL Inc.", "Kaishaer Lena and Leila", "Los Angeles")

jp_morgen = VentureCapitalist.new("JP Morgen", 2_000_000_000)
jeff_bezos = VentureCapitalist.new("Amazon", 3_000_000_000)
bill_gates = VentureCapitalist.new("Microsoft", 1_000_000)
elon_musk = VentureCapitalist.new("Tesla", 9_000_000)


f_r_1 = FundingRound.new(llg, jp_morgen, "Series A", 50_000)
f_r_2 = FundingRound.new(ggg, jp_morgen, "Series B", 60_000)
f_r_3 = FundingRound.new(lll, bill_gates, "Series C", 60_000)
f_r_4 = FundingRound.new(llg, elon_musk, "Series B", 60_000)
binding.pry
0 #leave this here to ensure binding.pry isn't the last line