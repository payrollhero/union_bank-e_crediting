require "csv"

module UnionBank
  module ECrediting
    class TransactionFile
      include PipeDelimitedFile

      def detail_lines
        @detail_lines ||= details.each_with_index.map do |detail, index|
          DetailLine.new detail.merge(ref_number: (index + 1))
        end
      end
    end
  end
end
