require 'spec_helper'

describe UnionBank::ECrediting::EnrollmentFile do
  subject(:file) do
    described_class.new org_short_code: org_short_code,
                        date: date,
                        details: details
  end

  let(:org_short_code) { 'COMPANY-ABC' }
  let(:date) { Date.new 2010, 1, 1 }

  let(:details) do
    [
      {
        payee_id: '000000000001',
        account_number: '000000000001',
        account_name: 'Person A',
        mobile_number: '888-8888',
        email: 'person.a@company.com'
      },
      {
        payee_id: '000000000002',
        account_number: '000000000002',
        account_name: 'Person B',
        mobile_number: '888-8888',
        email: 'person.b@company.com'
      },
      {
        payee_id: '000000000003',
        account_number: '000000000003',
        account_name: 'Person C',
        mobile_number: '888-8888',
        email: 'person.c@company.com'
      }
    ]
  end

  let(:expected_content) { File.read 'spec/fixtures/enrollment_file.txt' }

  example { expect(file.content).to eq expected_content }
end
