# frozen_string_literal: true

require "active_model"

module UnionBank
  module ECrediting
    # Describes UnionBank's eCrediting Enrollment File's detail line
    class EnrollmentFile::DetailLine
      include ActiveModel::Model

      attr_accessor :payee_id,
                    :account_number,
                    :account_name,
                    :mobile_number,
                    :email

      validates :payee_id, length: { maximum: 50 }
      validates :account_number, length: { maximum: 16 }
      validates :account_name, length: { maximum: 120 }
      validates :mobile_number, length: { maximum: 13 }
      validates :email, length: { maximum: 40 }

      validates :payee_id,
                :account_number,
                :account_name,
                :mobile_number,
                :email,
                presence: true

      # @param [String] payee_id
      # @param [String] account_number
      # @param [String] account_name
      # @param [String] mobile_number
      # @param [String] email
      def initialize(payee_id:, account_number:, account_name:, mobile_number:, email:)
        @payee_id = payee_id
        @account_number = account_number
        @account_name = account_name
        @mobile_number = mobile_number
        @email = email

        raise ArgumentError, errors.full_messages.to_sentence unless valid?
      end

      # @return [Array]
      def ordered_field_values
        [
          "D",                  # identifier
          payee_id,
          account_number,
          account_name,
          mobile_number,
          email
        ]
      end
    end
  end
end
