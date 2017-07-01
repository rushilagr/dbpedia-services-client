module Dbpedia
  module Services
    module Client

      def self.recursive_print obj
        if obj.is_a? Array
          obj.each { |e| recursive_print e}
          puts
        elsif obj.is_a? Hash
          obj.each do |k,v|
            puts k.upcase
            puts
            recursive_print v
          end
        else
          puts obj
        end

      end
    end
  end
end
