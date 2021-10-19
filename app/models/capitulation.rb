class Capitulation < ApplicationRecord
	belongs_to :inquery, optional: true
 	belongs_to :law,-> { where(ativo: true)}, optional: true
	
end
