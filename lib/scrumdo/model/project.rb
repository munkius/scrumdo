module ScrumDo
  module Model
    class Project

      attr_reader :point_scale, :velocity

      def initialize
        fetch_data
      end

      def iterations
        ::ScrumDo::Connector::DataRetriever.new.retrieve_json("/iterations").select do |item|
          [item["start_date"], item["end_date"]].reject(&:nil?).count == 2
        end.each_with_index.map do |iteration,index|
          Iteration.new iteration, index+1
        end
      end

      def backlog
        backlog_iteration = ::ScrumDo::Connector::DataRetriever.new.retrieve_json("/iterations").find do |item|
          [item["start_date"], item["end_date"]].select(&:nil?).count == 2
        end

        Iteration.new backlog_iteration, 0
      end

      def current_iteration(iterations=iterations)
        today = Date.today

        iterations.find do |iteration|
          iteration.includes_date? today
        end
      end

      def iterations_left
        project_iterations = iterations
        project_iterations.last(project_iterations.count - project_iterations.index(current_iteration(project_iterations)) - 1)
      end

      def members
        ::ScrumDo::Connector::DataRetriever.new.retrieve_json("/members").map do |member|
          Member.new member
        end
      end

    protected

      def fetch_data
        data = ::ScrumDo::Connector::DataRetriever.new.retrieve_json
        @velocity = data['velocity']
        @point_scale = data['point_scale'].map do |item|
          item[1].downcase
        end
      end

    end
  end
end
