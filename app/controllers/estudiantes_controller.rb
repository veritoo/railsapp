class EstudiantesController < ApplicationController
  before_filter :relacion
  helper_method :sort_column, :sort_direction
  def index
  if params[:registros]==nil or (params[:registros] <='0') then
    params[:registros]=3
  end
  @estudiantes = @curso.estudiantes.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(params[:registros].to_i)
  respond_to do |format|
  format.html # index.html.erb
  format.xml { render :xml => @estudiantes }
  end
end
  def show
      @estudiante = Estudiante.find(params[:id])
        pdf = EstudiantePdf.new(@estudiante, view_context)
        send_data pdf.render, filename:
        "estudiante_#{@estudiante.id}.pdf",
        type: "aplication/pdf"
  end

  def new
      @estudiante = Estudiante.new
  end

  def edit
      @estudiante= Estudiante.find(params[:id])
  end

  def create
      @estudiante = @curso.estudiantes.build(params[:estudiante])
      render :action => :new unless @estudiante.save
      @estudiantes = Estudiante.all
  end

  def update
      @estudiante = Estudiante.find(params[:id])
      render :action => :edit unless @estudiante.update_attributes(params[:estudiante])
  end

  def destroy
      @estudiante = Estudiante.find(params[:id])
      @estudiante.destroy
      @estudiantes = Estudiante.all
  end

  def relacion
  @curso = Curso.find(params[:curso_id])
  @estudiante = Estudiante.find(params[:id]) if params[:id]
  end

   private
  
  def sort_column
    Estudiante.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end