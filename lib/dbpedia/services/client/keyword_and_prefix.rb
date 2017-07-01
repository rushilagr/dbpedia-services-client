module Dbpedia
  module Services
    module Client

      def self.search_keyword (text)
        raw_results = Dbpedia::search(text)
        final_results = []
        raw_results.each do |r|
          final_results << [r.uri, r.label, r.refcount]
        end
        final_results
      end

      def self.search_prefix (text)
        raw_results = Dbpedia::search(text, method: 'prefix')
        final_results = []
        raw_results.each do |r|
          final_results << [r.uri, r.label, r.refcount]
        end
        final_results
      end
      
    end
  end
end
