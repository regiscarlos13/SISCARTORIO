class ApplicationRecord < ActiveRecord::Base
	self.abstract_class = true

	PROVIDENCA = [:Arquivado, :Convertido, :Transferido, :'Em Andamento']

	DESTINO = [:DP, :FORUM, :PEFOCE, :DONO]
	PROCEDIMENTO = [:IP, :Tco, :Boc, :Bo]
	TIPOS_VEICULOS = [:CARRO, :MOTO, :ONIBUS, :CAMINHÃO, :CAMINHONETE]
	CORES = [:BRANCA, :PRETA, :VERMELHA, :AMARELA, :AZUL]
	

	enum providenca: PROVIDENCA
	enum cores: CORES
	enum tipo_veiculo: TIPOS_VEICULOS
	enum destino: DESTINO
	enum procedimento: PROCEDIMENTO

	enum role: [:Admin, :User]
	enum tp: [:PORTARIA, :FLAGRANTE]
	enum typeinvolved: [:Indiciado, :Vítima]
	enum office: [:'Delegado(a)', :'Escrivã(o)', :'Inspetor(a)']
	enum origem: [:CONVENSÃO, :REQUISIÇÃO]
	enum tipo: [:BO, :TCO, :BOC]

	scope :all_user,-> (user)  { where(registry_id: user) }
	scope :search_conclusion,-> (conclusion)  { where('conclusion = ?', conclusion) if conclusion.present? }
	scope :search_origem,-> (origem)  { where('origem = ?', origem) if origem.present? }
	scope :search_reported,-> (reported)  { where('reported = ?', reported) if reported.present? }
	scope :date, -> (date_start, date_end) { where("establishment >= ? and establishment <= ?", date_start, date_end)  if date_start.present? and date_end.present?}
	scope :search_bo_date, -> (date_start, date_end) { where("fato >= ? and fato <= ?", date_start, date_end)  if date_start.present? and date_end.present?}
	scope :seach_providenca, -> (providenca) { where('providenca = ?', providenca) if providenca.present?}
	scope :seach_nature, -> (nature) { where('nature_id = ?', nature) if nature.present?}


	if Rails.env.production?
	scope :search_bo_year, -> (fato) { where('extract(year from fato) = ?', fato) if fato.present? }
	scope :search_precatory_year, -> (year)  { where('extract(year from precatories.year) = ?', year) if year.present? }
	scope :search_year,->  (year) { where('extract(year from year) = ?', year) if year.present? }

	else
		scope :search_bo_year, -> (fato) { where("cast(strftime('%Y', fato) as int) = ?", fato) if fato.present? }
		scope :search_precatory_year, -> (year)  { where("cast(strftime('%Y', precatories.year) as int) = ?", year) if year.present? }
		scope :search_year,->     (year) { where("cast(strftime('%Y', year) as int) = ?", year) if year.present? }
	end


	scope :search_precatory_conclusion, -> (conclusion)  {joins(:inquery).where('precatories.conclusion = ?', conclusion) if conclusion.present?}
	scope :search_precatory_date, -> (date_start, date_end) { joins(:inquery).where("precatories.year >= ? and precatories.year <= ?", date_start, date_end)  if date_start.present? and date_end.present?}




end
