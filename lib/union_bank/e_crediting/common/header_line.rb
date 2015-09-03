require "active_model"

module UnionBank
  module ECrediting
    module Common
      class HeaderLine
        include ActiveModel::Model

        attr_accessor :org_short_code,
                      :date,
                      :total_no_of_refs

        validates :org_short_code, length: { maximum: 15 }
        validates :total_no_of_refs, length: { minimum: 1, maximum: 2 }, numericality: { only_integer: true }
        validates :org_short_code, :date, :total_no_of_refs, presence: true

        def initialize(org_short_code:, date:, total_no_of_refs: 0)
          @org_short_code = org_short_code
          @date = date
          @total_no_of_refs = total_no_of_refs

          raise ArgumentError, errors.full_messages.to_sentence unless valid?
        end

        def ordered_field_values
          [
            "H", # identifier
            org_short_code.strip,
            date.strftime("%m%d%Y"),
            total_no_of_refs
          ]
        end
      end
    end
  end
end
