class InstructorPdf < Prawn::Document

  def initialize(instructor, view)
    super()

    @instructor = instructor
    
    text "#{instructor.cedula}"
    text "#{instructor.nombres}"
    text "#{instructor.email}"
    text "#{instructor.direccion}"
    text "#{instructor.telefono}"
    text "#{instructor.fch_ncto}"
    text "#{instructor.modalidad}"
  end
end

