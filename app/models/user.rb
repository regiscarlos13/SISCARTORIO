class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :timeoutable

  validates_cpf :cpf
  validates_uniqueness_of :cpf, :email, message: "ja cadastrado"

  validates_presence_of :cpf, :name, :email, :role

  belongs_to :registry

end
