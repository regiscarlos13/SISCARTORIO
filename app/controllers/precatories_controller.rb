class PrecatoriesController < ApplicationController
  before_action :set_precatory, only: [:show, :edit, :update, :destroy]

  # GET /precatories
  # GET /precatories.json
  def index

   if  params[:conclusion] or params[:year] or params[:start] and params[:end]
    @precatories =  Precatory.joins(:inquery).where("inqueries.registry_id = #{current_user.registry_id}").search_precatory_conclusion(params[:conclusion]).search_precatory_year(params[:year]).search_precatory_date(params[:start], params[:end])
   else
    @precatories = Precatory.joins(:inquery).where("inqueries.registry_id = #{current_user.registry_id}").search_precatory_conclusion(params[:conclusion])
   end
  printer('precatories/shared/index', 'Relação_Precatórias')
end

  # GET /precatories/1
  # GET /precatories/1.json
  def show
    @questions = Question.where(precatory_id: @precatory)


    @involveds_indiciados = Involved.where(['inquery_id= ? and typeinvolved= ?', @precatory.inquery.id , 0])
    @involveds_vitimas = Involved.where(['inquery_id= ? and typeinvolved= ?', @precatory.inquery.id , 1])
    @capitulations = Capitulation.where(inquery_id: @precatory.inquery.id)

    printer('precatories/shared/reporte', 'Precatória')
    
  end

  # GET /precatories/new
  def new
    @precatory = Precatory.new

  end

  # GET /precatories/1/edit
  def edit
  end

  # POST /precatories
  # POST /precatories.json
  def create
    @precatory = Precatory.new(precatory_params)

    respond_to do |format|
      if @precatory.save
        format.html { redirect_to  new_precatory_path, notice: 'Precatory was successfully created.' }
        format.json { render :show, status: :created, location: @precatory }
      else
        format.html { render :new }
        format.json { render json: @precatory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /precatories/1
  # PATCH/PUT /precatories/1.json
  def update
    respond_to do |format|
      if @precatory.update(precatory_params)
        format.html { redirect_to precatories_path, notice: 'Precatory was successfully updated.' }
        format.json { render :show, status: :ok, location: @precatory }
      else
        format.html { render :edit }
        format.json { render json: @precatory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /precatories/1
  # DELETE /precatories/1.json
  def destroy
    @precatory.destroy
    respond_to do |format|
      format.html { redirect_to precatories_url, notice: 'Precatory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_precatory
      @precatory = Precatory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def precatory_params
      params.require(:precatory).permit(:n, :year, :server_id, :inquery_id, :registry_id, :ipantigo,:name, :address, :bairro, :city_id, :conclusion, :conclusion_date,
        questions_attributes: [:id, :question, :_destroy])
    end
  end
