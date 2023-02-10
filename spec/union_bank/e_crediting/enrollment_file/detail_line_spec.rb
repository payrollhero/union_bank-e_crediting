# frozen_string_literal: true

require "spec_helper"

describe UnionBank::ECrediting::EnrollmentFile::DetailLine do
  subject(:line) do
    described_class.new payee_id: payee_id,
                        account_number: account_number,
                        account_name: account_name,
                        mobile_number: mobile_number,
                        email: email
  end

  let(:payee_id) { "1234567890123456" }
  let(:account_number) { "1234567890123456" }
  let(:account_name) { "Person A" }
  let(:mobile_number) { "888-8888" }
  let(:email) { "person.a@company.com" }

  describe "validations" do
    describe "valid" do
      example { expect { line }.to_not raise_exception }
    end

    describe "invalid payee ID" do
      let(:payee_id) { "8" * 51 }

      example { expect { line }.to raise_exception ArgumentError, "Payee is too long (maximum is 50 characters)" }
    end

    describe "invalid account_number" do
      let(:account_number) { "12345678901234567" }

      example do
        expect do
          line
        end.to raise_exception ArgumentError, "Account number is too long (maximum is 16 characters)"
      end
    end

    describe "invalid account_name" do
      let(:account_name) { "A" * 121 }

      example do
        expect do
          line
        end.to raise_exception ArgumentError, "Account name is too long (maximum is 120 characters)"
      end
    end

    describe "invalid mobile number" do
      let(:mobile_number) { "8" * 14 }

      example do
        expect do
          line
        end.to raise_exception ArgumentError, "Mobile number is too long (maximum is 13 characters)"
      end
    end

    describe "invalid email" do
      let(:email) { "a" * 41 }

      example { expect { line }.to raise_exception ArgumentError, "Email is too long (maximum is 40 characters)" }
    end
  end
end
