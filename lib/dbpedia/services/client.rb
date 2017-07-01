require "dbpedia/services/client/version"

require "httparty"
require "dbpedia"

require 'dbpedia/services/client/dbpedia_gem_extension.rb'
require 'dbpedia/services/client/spotlight.rb'
require 'dbpedia/services/client/keyword_and_prefix.rb'
require 'dbpedia/services/client/display.rb'
require 'dbpedia/services/client/configuration.rb'

module Dbpedia
  module Services
    module Client
      class << self
        attr_accessor :configuration
      end

      def self.configuration
        @configuration ||= Configuration.new
      end

      def self.configure
        yield(configuration)
      end

      def self.search (text, service)
        results = case service
                  when :spotlight
                    Dbpedia::Services::Client::Spotlight.search_spotlight text
                  when :keyword
                    Dbpedia::Services::Client.search_keyword text
                  when :prefix
                    Dbpedia::Services::Client.search_prefix text
                  when :all
                    Dbpedia::Services::Client.search_all text
                  end
        results
      end

      def self.search_all text
        results = {}
        results[:spotlight] = Dbpedia::Services::Client::Spotlight.search_spotlight text
        results[:keyword] = Dbpedia::Services::Client.search_keyword text
        results[:prefix] = Dbpedia::Services::Client.search_prefix text
        results
      end

      def self.display obj
        recursive_print obj
      end 
    end
  end
end