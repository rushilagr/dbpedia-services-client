require 'dbpedia/services/client'

text = []
# text = generate_combinations 'self-help apps'
# text << 'mg road' 
# text << 'Rohini'
# text << 'snooker clubs' 
# text << 'bangalore'

# text << 'Sachin T'
# text << 'Sachin Tendulkar'
# text << 'Hacker News'
# text << 'drugs'
# text << 'Design'
text << 'fashion designers'

text.each do |e|
	puts
	puts "----------------------------------------------------------------------"
	puts e.upcase
	puts "----------------------------------------------------------------------"
	puts


	results = Dbpedia::Services::Client.search_all e
	Dbpedia::Services::Client.display results
end