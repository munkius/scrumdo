module ScrumDo
  module Model
    class Iteration

      attr_reader :id, :name, :url, :start_date, :end_date, :index

      def initialize(json, index)
        @name = json['name']
        @url = json['url']
        @id = json['id']
        @start_date = Date.parse(json["start_date"]) rescue nil
        @end_date = Date.parse(json["end_date"]) rescue nil

        @index = index
      end

      def stories
        ::ScrumDo::Connector::DataRetriever.new.retrieve_json("/iterations/#{@id}/stories").map do |story|
          Story.new story, @id
        end
      end

      def burndown_data
        ::ScrumDo::Connector::DataRetriever.new.retrieve_json("/iterations/#{@id}/burndown").map do |day|
          BurndownDay.new day
        end
      end

      def burndown
        data = burndown_data

        data.map do |day|
          { date: day.date, todo: day.points_total - day.points[:points_status10] }
        end + ((data.last.date + 1)..@end_date).map do |day|
          { date: day, todo: nil }
        end
      end

      def days
        (@start_date..@end_date).count
      end

      def includes_date?(date)
        date >= @start_date && date <= @end_date
      end

    end
  end
end
