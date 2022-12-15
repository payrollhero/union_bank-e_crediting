require "spec_helper"

describe UnionBank::ECrediting::TransactionFile do

  subject(:file) do
    described_class.new org_short_code: org_short_code,
                        date: date,
                        details: details
  end

  let(:org_short_code) { "COMPANY-ABC" }
  let(:date) { Date.new 2010, 1, 1 }

  let(:details) do
    [
      {
        payee_id: "000000000001",
        amount: 123.45,
      },
      {
        payee_id: "000000000002",
        amount: 678.90,
      },
      {
        payee_id: "000000000002",
        amount: 543.21,
      },
    ]
  end

  let(:expected_content) { File.read "spec/fixtures/transaction_file.txt" }

  before { File.write "spec/fixtures/transaction_file.txt", file.content }

  example { expect(file.content).to eq expected_content }
end
