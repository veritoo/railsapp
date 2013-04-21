class CursosController < ApplicationController
  helper_method :sort_column, :sort_direction
  def index
  if (params[:rgs]==nil) or (params[:rgs] <='0') then
    params[:rgs]=3
  end
  @cursos = Curso.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(params[:rgs].to_i)
  respond_to do |format|
  format.html # index.html.erb
  format.xml { render :xml => @cursos }
  end
end

  def show
        @curso= Curso.find(params[:id])
        pdf = CursoPdf.new(@curso, view_context)
        send_data pdf.render, filename:
        "curso_#{@curso.id}.pdf",
        type: "aplication/pdf"
  end

  def new
      @curso = Curso.new
  end

  def edit
      @curso= Curso.find(params[:id])
  end

  def create
      @curso = Curso.new(params[:curso])
      render :action => :new unless @curso.save
      @cursos = Curso.all
  end

  def update
      @curso = Curso.find(params[:id])
      render :action => :edit unless @curso.update_attributes(params[:curso])
  end

  def destroy
      @curso = Curso.find(params[:id])
      @curso.destroy
      @cursos = Curso.all
  end
  
  private
  
  def sort_column
    Curso.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end