module ScrumDo
  module Model
    class Member

      attr_reader :id, :email, :first_name, :last_name, :username

      def initialize(json)
        @id = json['id']
        @email = json['email']
        @first_name = json['first_name']
        @last_name = json['last_name']
        @username = json['username']
      end

      def name
        if [@first_name, @last_name].reject do |field|
          field.nil? || field.empty?
        end.empty?
          @username
        else
          '%s %s' % [@first_name, @last_name]
        end
      end

    end
  end
end
