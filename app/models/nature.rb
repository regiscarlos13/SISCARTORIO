class Nature < ApplicationRecord
	  default_scope { order(name: :asc) }

	  has_many :bos
end
