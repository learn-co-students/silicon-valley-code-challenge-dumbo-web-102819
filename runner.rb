require 'pry'

require_relative './app/models/funding_round.rb'
require_relative './app/models/startup.rb'
require_relative './app/models/venture_capitalist.rb'

s1 = Startup.new('apple', 'griff', 'tech')
s2 = Startup.new('google', 'soner', 'tech')
s3 = Startup.new('yahoo', 'dominic', 'chocolate milk')

v1 = VentureCapitalist.new('jack', 2_000_000_000)
v2 = VentureCapitalist.new('mark', 1_000_000_000)
v3 = VentureCapitalist.new('alice', 1_000_000_001)

f1 = s1.sign_contract(v1, 'angel', 20_000)
f2 = s1.sign_contract(v2, 'angel', 30_000)
f3 = s2.sign_contract(v2, 'one year', 10_000_000)
f4 = s2.sign_contract(v3, 'angel', 2_500_000)
f5 = s3.sign_contract(v3, 'two year', 2_500_100)
f6 = s3.sign_contract(v1, 'angel', 100_000)
f7 = s3.sign_contract(v2, 'one_year', 8_000_000)
f8 = v3.offer_contract(s1, 'two year', 100_000)
f9 = v3.offer_contract(s1, 'angel', 200_000)

binding.pry
0