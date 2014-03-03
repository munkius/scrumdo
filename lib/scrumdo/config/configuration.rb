require 'erb'
require 'yaml'

module ScrumDo
  module Config
    class Configuration

      @@loaded = false

      def self.organization
        config 'organization'
      end

      def self.project
        config 'project'
      end

      def self.proxy_host
        config 'proxy_host'
      end

      def self.proxy_port
        config 'proxy_port'
      end

      def self.user
        config 'user'
      end

      def self.password
        config 'password'
      end

    protected

      def self.config(field)
        load unless @@loaded
        @@config['scrumdo'][field]
      end

      def self.load
        @@config = YAML.load(ERB.new(File.read(config_path)).result)
        @@loaded = true
      end

      def self.config_path
        'scrumdo.yml'
      end

    end
  end
end
