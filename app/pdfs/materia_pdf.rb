class MateriaPdf < Prawn::Document

  def initialize(materia, view)
    super()

    @materia = materia
    text "#{materia.nombre}"
  end
end

