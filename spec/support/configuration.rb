module ScrumDo
  module Config
    class Configuration

      def self.config_path
        File.expand_path('../../fixtures/scrumdo.yml', __FILE__)
      end

    end
  end
end
