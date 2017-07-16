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
		if !DBPEDIA_KEYWORD_URL.nil? && !DBPEDIA_PREFIX_URL.nil?
			search = {'keyword' => DBPEDIA_KEYWORD_URL, 'prefix' => DBPEDIA_PREFIX_URL}
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
