class Join < ApplicationRecord
  belongs_to :inquery
  belongs_to :registry
  belongs_to :server
  validates_presence_of :date
  has_many :joinsanexos, dependent: :destroy

  accepts_nested_attributes_for :joinsanexos, reject_if: :all_blank, allow_destroy: true
  
end
