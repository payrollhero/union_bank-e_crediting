# frozen_string_literal: true

require 'csv'

module UnionBank
  module ECrediting
    # Describes UnionBank's eCrediting Transaction File
    class TransactionFile
      include PipeDelimitedFile

      # @return [Array<UnionBank::ECrediting::TransactionFile::DetailLine>]
      def detail_lines
        @detail_lines ||= details.each_with_index.map do |detail, index|
          DetailLine.new(**detail.merge(ref_number: (index + 1)))
        end
      end
    end
  end
end
