# UnionBank::ECrediting

[![Gem Version](https://badge.fury.io/rb/union_bank-e_crediting.svg)](http://badge.fury.io/rb/union_bank-e_crediting)
[![Code Climate](https://codeclimate.com/github/payrollhero/union_bank-e_crediting/badges/gpa.svg)](https://codeclimate.com/github/payrollhero/union_bank-e_crediting)
[![Build Status](https://travis-ci.org/payrollhero/union_bank-e_crediting.svg)](https://travis-ci.org/payrollhero/union_bank-e_crediting)

Generates file contents for UnionBank's eCrediting enrollment and transaction files.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'union_bank-e_crediting'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install union_bank-e_crediting

## Usage

```ruby
enrollment_file = UnionBank::ECrediting::EnrollmentFile.new org_short_code: "COMPANY-ABC",
                                                            date: "2010-01-01".to_date,
                                                            details: [
                                                              {
                                                                payee_id: "000000000001",
                                                                account_number: "000000000001",
                                                                account_name: "Person A",
                                                                mobile_number: "888-8888",
                                                                email: "person.a@company.com"
                                                              }
                                                            ]

enrollment_file.content #=> "H|COMPANY-ABC|01012010|0\r\nD|000000000001|000000000001|Person A|888-8888|person.a@company.com\r\n"

transaction_file = UnionBank::ECrediting::TransactionFile.new org_short_code: "COMPANY-ABC",
                                                              date: "2010-01-01".to_date,
                                                              details: [
                                                                {
                                                                  payee_id: "000000000001",
                                                                  amount: 123.45
                                                                }
                                                              ]

transaction_file.content #=> "H|COMPANY-ABC|01012010|0\r\nD|000000000001|1|000000012345\r\n"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/union_bank-e_crediting/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
