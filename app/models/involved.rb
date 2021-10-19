class Involved < ApplicationRecord
  belongs_to :inquery
  belongs_to :person

  validates_uniqueness_of :typeinvolved, scope: [:person, :inquery]
  validates_presence_of :typeinvolved, :person
 
end
