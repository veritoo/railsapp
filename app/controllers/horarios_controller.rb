class HorariosController < ApplicationController
  helper_method :sort_column, :sort_direction
  def index
    if params[:rs]==nil or (params[:rs] <='0') then
    params[:rs]=3
  end
  @horarios = Horario.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(params[:rs].to_i)
  respond_to do |format|
  format.html # index.html.erb
  format.xml { render :xml => @horarios }
  end
end

  def show
      @horario = Horario.find(params[:id])
        pdf = HorarioPdf.new(@horario, view_context)
        send_data pdf.render, filename:
        "horario_#{@horario.id}.pdf",
        type: "aplication/pdf"
  end

  def new
      @horario = Horario.new
  end

  def edit
      @horario= Horario.find(params[:id])
  end

  def create
      @horario = Horario.new(params[:horario])
      render :action => :new unless @horario.save
      @horarios = Horario.all
  end

  def update
      @horario = Horario.find(params[:id])
      render :action => :edit unless @horario.update_attributes(params[:horario])
  end

  def destroy
      @horario = Horario.find(params[:id])
      @horario.destroy
      @horarios = Horario.all
  end

   private
  
  def sort_column
    Horario.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end