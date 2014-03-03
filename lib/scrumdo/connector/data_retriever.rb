require 'json'
require 'net/http'

module ScrumDo
  module Connector
    class DataRetriever

      URL_PREFIX = 'https://www.scrumdo.com/api/v2/organizations'

      def retrieve_json(ref=nil)
        path = "%s/%s/projects/%s%s" % [URL_PREFIX, config.organization, config.project, ref]

        uri = URI(path)

        if config.proxy_host
          base = proxy
        else
          base = Net::HTTP
        end

        base.start(uri.host, uri.port, use_ssl: uri.scheme == 'https', verify_mode: OpenSSL::SSL::VERIFY_NONE) do |http|
          request = Net::HTTP::Get.new uri
          request.basic_auth config.user, config.password
          response = http.request request
          JSON.parse(response.body)
        end
      end

    private

      def proxy
        Net::HTTP::Proxy(config.proxy_host, config.proxy_port)
      end

      def scrumdo_credentials
        { user: config.user, password: config.password }
      end

      def config
        ::ScrumDo::Config::Configuration
      end

    end
  end
end
