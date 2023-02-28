# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'union_bank/e_crediting/version'

Gem::Specification.new do |spec|
  spec.name          = "union_bank-e_crediting"
  spec.version       = UnionBank::ECrediting::VERSION
  spec.authors       = ["Ronald Maravilla"]
  spec.email         = ["rmaravilla@payrollhero.com"]

  spec.summary       = "Generates file contents for UnionBank's eCrediting enrollment and transaction files."
  spec.description   = "Generates file contents for UnionBank's eCrediting enrollment and transaction files."
  spec.homepage      = "https://github.com/payrollhero/union_bank-e_crediting"
  spec.license       = "BSD-3-Clause"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "> 1.17", "< 3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "rubocop-performance"
  spec.add_development_dependency "rubocop-rails"
  spec.add_development_dependency "rubocop-rspec"
  spec.add_development_dependency "rubocop_challenger"
  spec.add_development_dependency "simplecov"

  spec.add_dependency "activemodel", "> 5.2"
  spec.add_dependency "activesupport", "> 5.2"
  spec.metadata['rubygems_mfa_required'] = 'true'
end
