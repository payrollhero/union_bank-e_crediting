require "union_bank/e_crediting/version"
require "active_support"

module UnionBank
  module ECrediting
    extend ActiveSupport::Autoload

    autoload :EnrollmentFile
  end
end
