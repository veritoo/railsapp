class Curso < ActiveRecord::Base
  attr_accessible :nombre, :ficha

  def self.search(search)
where('nombre like ? or ficha like ?', "%#{search}%", "%#{search}")
end

validates :nombre, :presence => true,
:length => { :maximum => 80 }

has_many :estudiantes
has_many :horarios
end
