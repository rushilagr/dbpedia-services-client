module Dbpedia
  module Services
    module Client
      class Configuration
        attr_accessor :spotlight_url, :spotlight_confidence, :spotlight_support

        def initialize
          @spotlight_url = DBPEDIA_SPOTLIGHT_URL || 'http://model.dbpedia-spotlight.org/en/candidates'
          @spotlight_support = 0
          @spotlight_confidence = 0.1
        end
      end
    end
  end
end