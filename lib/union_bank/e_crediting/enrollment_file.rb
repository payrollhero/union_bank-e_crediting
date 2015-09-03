module UnionBank
  module ECrediting
    class EnrollmentFile
      include PipeDelimitedFile

      def detail_lines
        @detail_lines ||= details.map { |detail| DetailLine.new detail }
      end
    end
  end
end
