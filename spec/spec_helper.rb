$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'simplecov'
SimpleCov.minimum_coverage 99
SimpleCov.start 'rails'

require 'union_bank/e_crediting'
