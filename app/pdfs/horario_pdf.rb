class HorarioPdf < Prawn::Document

  def initialize(horario, view)
    super()

    @horario = horario
    
    text "#{horario.dia}"
    text "#{horario.hora}"
    text "#{horario.aula}"
  end
end

