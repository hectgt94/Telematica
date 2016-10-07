class Place < ActiveRecord::Base
	has_many :voters
	validates :nombre, :ciudad, :direccion , :departamento, :presence => true
	validates :nombre, {:uniqueness => true}
end
