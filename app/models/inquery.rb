class Inquery < ApplicationRecord

	belongs_to :city
	belongs_to :boc,-> { where(providenca: 'Convertido')}, optional: true
	belongs_to :bo,-> { where(providenca: 'Convertido')}, optional: true
	belongs_to :tco,-> { where(providenca: 'Convertido' )}, optional: true


	has_many :involveds, dependent: :destroy
	has_many :joins, dependent: :destroy
	has_many :capitulations, dependent: :destroy
	has_many :precatories, dependent: :destroy
	has_many :seizures, dependent: :destroy



	validates_uniqueness_of :n, scope: [:dp, :year]
	validates_presence_of :n, :dp, :year, :establishment, :tp
	validate :save_date, unless: :reported_date_valid?
	validates_presence_of :reported_date, unless: :reported_valid?, message: "data está em Branco"
	validate :save_conclusion, if: :reported_valid?
	validates_presence_of :origem, if: :validade_origem?
	validates_presence_of :tipo, if: :validade_tipo?
	validates_presence_of :documento, if: :validade_origem?


	accepts_nested_attributes_for :capitulations, reject_if: :all_blank, allow_destroy: true

	def print_tipos

		if origem == 'CONVENSÃO'

			case tipo 
			when 'BO'
				"#{tipo} - #{bo.blank? ?  '' : bo.n}"
			when 'TCO'
				"#{tipo} - #{tco.blank? ?  '' : tco.n}"
			else
				"#{tipo} - #{boc.blank? ?  '' : boc.n}"
			end
		elsif origem == 'REQUISIÇÃO'
			
			"#{'Requisição'} - #{documento} "
		else
			'-'
		end
	end

	protected

	def find_inquery
		dp.to_s + '-' + n.to_s.rjust(3, '0') + '/' + year.year.to_s
	end

	def validade_tipo?
		self.origem == 'Convensão'
	end

	def validade_origem?
		self.tp == 'Portaria'
	end
	
	def reported_valid?
		reported.blank?
	end

	def reported_date_valid?
		reported_date.blank?
	end

	def save_date
		errors.add(:base, "Data menor que a do Tombamento") if self.establishment > self.reported_date
	end

	def save_conclusion
		errors.add(:base, "Faltando Relatório Final") if self.conclusion.present?
	end



end
