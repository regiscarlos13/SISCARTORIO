class Tco < ApplicationRecord
	belongs_to :city
	belongs_to :registry

	belongs_to :boc,-> { where(providenca: 'Convertido')}, optional: true
	belongs_to :bo,-> { where(providenca: 'Convertido')}, optional: true
	belongs_to :inquery,-> { where(tp: 'PORTARIA', conclusion: false)}, optional: true

	validates_presence_of :n



TIPOS = [:BO, :INQUERITO, :BOC]

enum tipo: TIPOS

validates_uniqueness_of :n, scope: [:dp, :year]
validates_presence_of :n, :dp, :year, :providenca, :establishment, :city_id	

private
def find_tco
	dp.to_s + '-' + n.to_s.rjust(3, '0') + '/' + year.year.to_s
end

end
 