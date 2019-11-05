require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

s1 = Startup.new("Google", "Someone", "nikes_domain")
s2 = Startup.new("Amazon", "Jeff Bezos", "amazon_domain")
s3 = Startup.new("Facebook", "Mark Zuckerberg", "facebook_domain")
s4 = Startup.new("Flatiron", "IDK", "flatiron_domain")

c1 = VentureCapitalist.new("Rich Guy", 1_200_000_000)
c2 = VentureCapitalist.new("21 Savage", 1_500_000_000)
c3 = VentureCapitalist.new("Fella", 1_000_000)
c4 = VentureCapitalist.new("Tekashi 69", 1_000)

f1 = FundingRound.new("Series A", s1, c1)
f2 = FundingRound.new("Series b", s2, c2)
f3 = FundingRound.new("Series C", s3, c3)
f4 = FundingRound.new("Angel", s4, c4)

f1.investment = 1_000_500_00
f2.investment = 2_000_000_000
f3.investment = 5_000_000
f4.investment = 2_000_000

c5 = VentureCapitalist.new("Dude", 1_000)
s4.sign_contract(c5, 500)

s5 = Startup.new("AppAcad", "Jim", "app_domain")
c3.offer_contract("Preseed", s5, 2_000_000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line