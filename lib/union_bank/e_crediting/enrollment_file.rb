module UnionBank
  module ECrediting
    # Describes UnionBank's eCrediting Enrollment File
    class EnrollmentFile
      include PipeDelimitedFile

      # @return [Array<UnionBank::ECrediting::EnrollmentFile::DetailLine>]
      def detail_lines
        @detail_lines ||= details.map { |detail| DetailLine.new **detail }
      end
    end
  end
end
