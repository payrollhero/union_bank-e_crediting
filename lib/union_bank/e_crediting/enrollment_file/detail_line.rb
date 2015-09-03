require "active_model"

module UnionBank
  module ECrediting
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

      def initialize(payee_id:, account_number:, account_name:, mobile_number:, email:)
        @payee_id = payee_id
        @account_number = account_number
        @account_name = account_name
        @mobile_number = mobile_number
        @email = email

        raise ArgumentError, errors.full_messages.to_sentence unless valid?
      end

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
