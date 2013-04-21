class CursoPdf < Prawn::Document

  def initialize(curso, view)
    super()
    @curso = curso
    text "#{curso.nombre}"
    text "#{curso.ficha}"
  end
end

