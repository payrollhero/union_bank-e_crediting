require 'csv'

module UnionBank
  module ECrediting
    # Defines common methods of a pipe delimited file (CSV file with "|" as the column separator).
    module PipeDelimitedFile
      extend ActiveSupport::Concern

      included do
        extend ActiveSupport::Autoload
        autoload :DetailLine
      end

      # @param [String] org_short_code
      # @param [Date] date
      # @param [Integer] total_no_of_refs
      # @param [Array] details
      def initialize(org_short_code:, date:, total_no_of_refs: 0, details: [])
        @org_short_code = org_short_code
        @date = date
        @total_no_of_refs = total_no_of_refs
        @details = details
      end

      # @return [String]
      def content
        CSV.generate(col_sep: '|', row_sep: "\r\n") do |csv|
          csv << header_line.ordered_field_values

          detail_lines.each do |line|
            csv << line.ordered_field_values
          end
        end
      end

      # @return [UnionBank::ECrediting::Common::HeaderLine]
      def header_line
        @header_line ||= Common::HeaderLine.new org_short_code: org_short_code,
                                                date: date,
                                                total_no_of_refs: total_no_of_refs
      end

      def detail_lines
        # :nocov:
        raise NotImplementedError, "#{self.class} must implement #detail_lines"
        # :nocov:
      end

      private

      attr_reader :org_short_code, :date, :total_no_of_refs, :details
    end
  end
end
