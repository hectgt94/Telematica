class Voter < ActiveRecord::Base
  belongs_to :place, required: true
  validates :cedula, {:uniqueness => true}
end
