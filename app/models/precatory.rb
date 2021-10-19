class Precatory < ApplicationRecord
	belongs_to :server
	belongs_to :registry
	belongs_to :inquery
	has_many :questions, dependent: :destroy
	belongs_to :city
	

	validates_uniqueness_of :n,  scope: :year
	accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true

	validates_presence_of :conclusion_date, unless: :validade_conclusion?
	
	def validade_conclusion?
		conclusion.blank?
	end

end
