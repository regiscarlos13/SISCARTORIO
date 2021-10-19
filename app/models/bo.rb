class Bo < ApplicationRecord

	default_scope { order(fato: :asc) }

	has_many :seizures, dependent: :destroy
	
	belongs_to :registry
	belongs_to :city
	belongs_to :nature,-> { where(ativo: true)}


	validates_uniqueness_of :n
	validates_presence_of :n, :ocorrencia, :fato, :providenca

	before_save :save_date

	def save_date
		errors.add(:base, "Data Ocorrência é posterior a da comunicação") if self.fato < self.ocorrencia
	end



end
