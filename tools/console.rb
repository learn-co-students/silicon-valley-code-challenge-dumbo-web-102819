require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

ross = VentureCapitalist.new("Ross Haneman")
ross.total_worth = 1_000_000_000
#Initialization works, as does tres comma club and net worth writer.
rich = VentureCapitalist.new("Richard Hendrix")
rich.total_worth = 1_000_000

pied = Startup.new("Pied Piper", rich.name, "compression")

ross.offer_contract(pied, "Series A", 5_000_000)

pied.sign_contract(rich, "Series B", 100_000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
