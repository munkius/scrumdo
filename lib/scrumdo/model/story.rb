module ScrumDo
  module Model
    class Story

      attr_reader :id, :category, :detail, :detail_html, :number, :points_value, :rank, :status_text, :summary_html

      def initialize(json, iteration_id)
        @iteration_id = iteration_id

        @id = json['id']
        @category = json['category']
        @detail = json['detail']
        @detail_html = json['detail_html']
        @number = json['number']
        @points_value = json['points_value']
        @rank = json['rank']
        @status_text = json['status_text']
        @summary_html = json['summary_html']
      end

      def tasks
        ::ScrumDo::Connector::DataRetriever.new.retrieve_json("/iterations/#{@iteration_id}/stories/#{@id}/tasks").map do |task|
          Task.new task
        end
      end

    end
  end
end
