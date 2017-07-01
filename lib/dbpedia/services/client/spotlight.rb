module Dbpedia
  module Services
    module Client
    	module Spotlight

        def self.get_spotlight_response text
          response = HTTParty.get(
            Dbpedia::Services::Client.configuration.spotlight_url, 
            query: {
              text: text,
              confidence: Dbpedia::Services::Client.configuration.spotlight_confidence,
              support: Dbpedia::Services::Client.configuration.spotlight_support
              },
            headers: {
              'Accept': 'application/json'
              }
            )
          return response
        end

        def self.parse_spotlight_response response
          final_results = {}
          json = JSON.parse response.body
          keywords = json['annotation']['surfaceForm']
          keywords = [keywords] if keywords.class == {}.class
          return if keywords.nil?

          keywords.each do |keyword|
            keywords_arr = []
            resources = keyword['resource']
            resources = [resources] if resources.class == {}.class

            resources.each do |e| 
              resource_arr = ['http://dbpedia.org/resource/' + e["@uri"], e["@label"], e["@finalScore"]]
              keywords_arr << resource_arr
            end

            final_results[keyword['@name']] = keywords_arr
          end
          final_results
        end

        def self.search_spotlight (text)
          response = self.get_spotlight_response text
          final_results = parse_spotlight_response response
        end
        
      end
    end
  end
end