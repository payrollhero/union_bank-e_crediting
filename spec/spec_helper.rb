# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)

require 'simplecov'
SimpleCov.minimum_coverage 100
SimpleCov.start 'rails'

require 'union_bank/e_crediting'
