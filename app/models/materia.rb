class Materia < ActiveRecord::Base
  attr_accessible :nombre

  def self.search(search)
where('nombre like ?', "%#{search}%")
end

validates :nombre, :presence => true,
:length => { :maximum => 80 }

has_many :horarios
end
