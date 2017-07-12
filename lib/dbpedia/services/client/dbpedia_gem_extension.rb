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

module DbpediaGemClientExtenstion
	def initialize
		super
		if !ENV['KEYWORD_URL'].nil? && !ENV['PREFIX_URL'].nil?
			search = {'keyword' => ENV['KEYWORD_URL'], 'prefix' => ENV['PREFIX_URL'],}
			@uris = {'search' => search}
		end
		@uris
	end
end

module Dbpedia
	class Client
		prepend DbpediaGemClientExtenstion
	end
end
