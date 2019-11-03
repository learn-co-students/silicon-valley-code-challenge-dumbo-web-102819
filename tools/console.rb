require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console


apple = Startup.new("Appele", "Steve Jobs", "Tech")
google = Startup.new("Google", "Google Dude", "Tech")
wework = Startup.new("WeWork", "wework dude", "Real Estate")
warren = VentureCapitalist.new("Warren Buffet", 50_000_000_000)
son = VentureCapitalist.new("Miyoshi Son", 20_000_000_000)
napsterdude = VentureCapitalist.new("Napster guy", 5_000_000_000)
f1 = warren.offer_contract(apple, "IPO", 1_000_000)
f2 = wework.sign_contract(son, "IPO", 1_000_000_000)
f3 = napsterdude.offer_contract(google, "Let Me In", 5_000_000)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line