require "spec_helper"

describe UnionBank::ECrediting::EnrollmentFile do

  subject(:file) {
    described_class.new org_short_code: org_short_code,
                        date: date,
                        details: details
  }

  let(:org_short_code) { "COMPANY-ABC" }
  let(:date) { Date.new 2010, 1, 1 }

  let(:details) {
    [
      {
        payee_id: "1234567890123456",
        account_number: "1234567890123456",
        account_name: "Person A",
        mobile_number: "888-8888",
        email: "person.a@company.com"
      },
      {
        payee_id: "2234567890123456",
        account_number: "2234567890123456",
        account_name: "Person B",
        mobile_number: "888-8888",
        email: "person.b@company.com"
      },
      {
        payee_id: "3234567890123456",
        account_number: "3234567890123456",
        account_name: "Person C",
        mobile_number: "888-8888",
        email: "person.c@company.com"
      },
    ]
  }

  let(:expected_content) { File.read "spec/fixtures/enrollment_file.txt" }

  example { expect(file.content).to eq expected_content }
end
