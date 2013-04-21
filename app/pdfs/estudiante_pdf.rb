class EstudiantePdf < Prawn::Document

  def initialize(estudiante, view)
    super()

    @estudiante = estudiante
    
    text "#{estudiante.nombre}"
    text "#{estudiante.cedula}"
    text "#{estudiante.email}"
    text "#{estudiante.direccion}"
  end
end

