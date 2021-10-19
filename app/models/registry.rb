class Registry < ApplicationRecord
	validates_presence_of :name, :address, :phone, :email, :dp
before_save  :uppercase

protected
	def uppercase
		self.name.upcase!
		self.address.upcase!
	end
end
