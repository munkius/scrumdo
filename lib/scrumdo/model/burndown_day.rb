module ScrumDo
  module Model
    class BurndownDay

      attr_reader :date, :points_total, :points

      # ScrumDo has the following points status mapping
      # by default:
      # - points_status1  => todo
      # - points_status4  => doing
      # - points_status10 => done
      def initialize(json)
        @date = Date.parse(json['date']) rescue nil
        @points_total = json['points_total']
        @points = {
          points_status1: json['points_status1'],
          points_status2: json['points_status2'],
          points_status3: json['points_status3'],
          points_status4: json['points_status4'],
          points_status5: json['points_status5'],
          points_status6: json['points_status6'],
          points_status7: json['points_status7'],
          points_status8: json['points_status8'],
          points_status9: json['points_status9'],
          points_status10: json['points_status10']
        }
      end

    end
  end
end
