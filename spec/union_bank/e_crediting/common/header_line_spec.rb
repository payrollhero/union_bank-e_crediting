require "spec_helper"

describe UnionBank::ECrediting::Common::HeaderLine do
  subject(:line) {
    described_class.new org_short_code: org_short_code,
                        date: date,
                        total_no_of_refs: total_no_of_refs
  }

  let(:org_short_code) { "COMPANY-ABC" }
  let(:date) { Date.new 2010, 1, 1 }
  let(:total_no_of_refs) { 1 }

  describe "validations" do
    describe "valid" do
      example { expect { line }.to_not raise_exception }
    end

    describe "invalid org short code" do
      let(:org_short_code) { "A"*16 }

      example { expect { line }.to raise_exception ArgumentError, "Org short code is too long (maximum is 15 characters)" }
    end

    describe "invalid enroll date" do
      let(:date) { nil }

      example { expect { line }.to raise_exception ArgumentError, "Date can't be blank" }
    end

    describe "invalid total no of refs" do
      let(:total_no_of_refs) { 100 }

      example { expect { line }.to raise_exception ArgumentError, "Total no of refs is too long (maximum is 2 characters)" }
    end
  end
end
