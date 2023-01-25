require "active_model"

module UnionBank
  module ECrediting
    # Describes UnionBank's eCrediting Transaction File's detail line
    module TransactionFile
      class DetailLine
        include ActiveModel::Model

        AMOUNT_RANGE = (BigDecimal("0")..BigDecimal("9999999999.99")).freeze

        attr_accessor :payee_id,
                      :ref_number,
                      :amount,
                      :ref_values

        validates :payee_id, length: { maximum: 50 }
        validates :ref_number, length: { maximum: 20 }
        validates :amount, inclusion: { in: AMOUNT_RANGE, message: "must be between 0.00 to 9,999,999,999.99" }

        validates :payee_id,
                  :ref_number,
                  :amount,
                  presence: true

        # @param [String] payee_id
        # @param [Integer] ref_number
        # @param [BigDecimal] amount
        # @param [Array] ref_values
        def initialize(payee_id:, ref_number:, amount:, ref_values: [])
          @payee_id = payee_id
          @ref_number = ref_number
          @amount = BigDecimal(amount.to_s)
          @ref_values = ref_values

          raise ArgumentError, errors.full_messages.to_sentence unless valid?
        end

        # @return [Array]
        def ordered_field_values
          [
            "D",                  # identifier
            payee_id,
            ref_number,
            formatted_amount
          ] + ref_values
        end

        private

        def formatted_amount
          format("%012d", (amount * BigDecimal("100")))
        end
      end
    end
  end
end
