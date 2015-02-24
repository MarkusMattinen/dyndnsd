
module Dyndnsd
  module Generator
    class Bind
      def initialize(domain, config)
        @domain = domain
        @ttl = config['ttl']
        @dns = config['dns']
        @email_addr = config['email_addr']
        @additional_zone_content = config['additional_zone_content']
      end

      def generate(zone)
        out = []
        out << @additional_zone_content
        out << ""
        zone['hosts'].each do |hostname,ip|
          name = hostname.chomp('.' + @domain)
          out << "#{name} #{@ttl} IN A #{ip}"
        end
        out << ""
        out.join("\n")
      end
    end
  end
end
