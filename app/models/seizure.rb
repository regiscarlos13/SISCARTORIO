class Seizure < ApplicationRecord

	belongs_to :inquery,-> { where(seizure: true, conclusion: false)}, optional: true
	belongs_to :boc,-> { where(conclusion: false)}, optional: true
	belongs_to :bo, optional: true
	belongs_to :tco,-> { where(conclusion: false)}, optional: true

	validates_presence_of :procedimento, :name, :destino, :quantidade, :data, :doc

	validate :save_procedimentos, if: :numero_blank?
	validate :save_veiculo, if: :veiculos_blank?




	protected

	def uppercase
		self.name.upcase!
		self.placa.upcase!
		self.doc.upcase!
		self.chassi.upcase!
	end

	def numero_blank?
		case self.procedimento
		when 'IP'
			inquery_id.blank?
		when 'TCO'
			tco_id.blank?
		when 'Boc'
			boc_id.blank?
		else
			bo_id.blank?
		end
	end

	def veiculos_blank?
		tipo_veiculo.blank?
		cor.blank?
		placa.blank?
		chassi.blank?
	end

	def save_procedimentos
		errors.add(:base, "Escolha Nº do #{self.procedimento}") if self.procedimento == 'IP' or self.procedimento == 'Tco'or self.procedimento == 'Boc' or self.procedimento == 'Bo'
	end
	def save_veiculo
		errors.add(:base, "Faltando #{tipo_veiculo.blank? ? 'Tipo' : ''} #{cor.blank? ? 'Cor' : ''} do veículo") if self.veiculo.present?

	end

end 

