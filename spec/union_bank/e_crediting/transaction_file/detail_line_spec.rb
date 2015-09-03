require "spec_helper"

describe UnionBank::ECrediting::TransactionFile::DetailLine do
  subject(:line) {
    described_class.new payee_id: payee_id,
                        ref_number: ref_number,
                        amount: amount
  }

  let(:payee_id) { "1234567890123456" }
  let(:ref_number) { 1 }
  let(:amount) { 123.45 }

  describe "validations" do
    describe "valid" do
      example { expect { line }.to_not raise_exception }
    end

    describe "invalid payee ID" do
      let(:payee_id) { "8"*51 }

      example { expect { line }.to raise_exception ArgumentError, "Payee is too long (maximum is 50 characters)" }
    end

    describe "invalid ref number" do
      let(:ref_number) { "1"*21 }

      example { expect { line }.to raise_exception ArgumentError, "Ref number is too long (maximum is 20 characters)" }
    end

    describe "invalid amount" do
      context "amount is negative" do
        let(:amount) { -0.01 }

        example { expect { line }.to raise_exception ArgumentError, "Amount must be between 0.00 to 9,999,999,999.99" }
      end

      context "amount is too high" do
        let(:amount) { 10_000_000_000.00 }

        example { expect { line }.to raise_exception ArgumentError, "Amount must be between 0.00 to 9,999,999,999.99" }
      end
    end
  end
end
