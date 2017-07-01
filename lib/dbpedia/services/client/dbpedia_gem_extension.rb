module DbpediaGemExtension
	attr_accessor :refcount
	def parse
		self.refcount = read '> Refcount'
		super
	end
end

module Dbpedia
	class SearchResult < Dbpedia::Parser
		prepend DbpediaGemExtension
	end
end
