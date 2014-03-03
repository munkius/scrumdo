module ScrumDo
  module Model
    class Task

      attr_reader :id, :status, :complete, :summary, :estimated_minutes, :order, :tags

      def initialize(json)
        @id = json['id']
        @status = json['status']
        @complete = json['complete']
        @summary = json['summary']
        @estimated_minutes = json['estimated_minutes']
        @order = json['order']
      end

    end
  end
end
