class InstructoresController < ApplicationController
  helper_method :sort_column, :sort_direction
  def index
  if params[:resultados]==nil or (params[:resultados] <='0') then
    params[:resultados]=3
  end
  @instructores = Instructor.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(params[:resultados].to_i)
  respond_to do |format|
  format.html # index.html.erb
  format.xml { render :xml => @instructores }
  end
end

  def show
      @instructor  = Instructor.find(params[:id])
        pdf = InstructorPdf.new(@instructor, view_context)
        send_data pdf.render, filename:
        "instructor_#{@instructor.id}.pdf",
        type: "aplication/pdf"
  end

  def new
      @instructor  = Instructor.new
  end

  def edit
      @instructor = Instructor.find(params[:id])
  end

  def create
      @instructor  = Instructor.new(params[:instructor])
      render :action => :new unless @instructor.save
      @instructores = Instructor.all
  end

  def update
      @instructor  = Instructor.find(params[:id])
      render :action => :edit unless @instructor.update_attributes(params[:instructor])
  end

  def destroy
      @instructor = Instructor.find(params[:id])
      @instructor.destroy
      @instructores = Instructor.all
  end

  private
  
  def sort_column
    Instructor.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
end