
class Person < ApplicationRecord

	has_many :involveds
	before_save :uppercase
	validates_presence_of :name, :mother
	
	validates_uniqueness_of :cpf,  unless: :cpf_valid?, message: "ja cadastrado"
	validates_cpf :cpf, unless: :cpf_valid?, message: "ja cadastrado"


	before_save do
	#    self.cpf.gsub!(/(\.|\-)/, "")
	self.phone.gsub!(/(\(|\)|\-)/, "")
	 #   self.cep.gsub!(/(\-)/, "")
	end


	def cpf_valid?
		cpf.blank?
	end


	def uppercase
		self.rg.upcase!
		self.name.upcase!
		self.mother.upcase!
		self.father.upcase!
	end


end
