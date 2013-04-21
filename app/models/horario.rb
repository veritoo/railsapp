class Horario < ActiveRecord::Base
  attr_accessible :aula, :dia, :hora, :materia_id, :instructor_id, :curso_id

  def self.search(search)
where('aula like ?', "%#{search}%")
end

validates :aula, :presence => true,
:length => { :maximum => 80 }

belongs_to :materia
belongs_to :instructor
belongs_to :curso
end
