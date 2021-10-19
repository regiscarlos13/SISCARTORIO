class InqueriesController < ApplicationController
  before_action :set_inquery, only: [:show, :edit, :update, :destroy]
  # GET /inqueries
  # GET /inqueries.json
  def index

    if params[:conclusion]
     @inqueries = Inquery.all_user(current_user.registry_id).search_conclusion(params[:conclusion]).search_reported(params[:reported]).search_year(params[:year]).date(params[:start], params[:end]).search_origem(params[:origem])
   else
     @inqueries = Inquery.all_user(current_user.registry_id).where(conclusion: 0)
   end
   printer('inqueries/related/index', 'Relação_Inqueritos')
 end


  # GET /inqueries/1
  # GET /inqueries/1.json
  def show
    @involveds = Involved.where(inquery_id: @inquery)
    @involveds_indiciados = Involved.where(['inquery_id= ? and typeinvolved= ?', @inquery , 0])
    @involveds_vitimas = Involved.where(['inquery_id= ? and typeinvolved= ?', @inquery , 1])
    @capitulations = Capitulation.where(inquery_id: @inquery)


    respond_to do |format|
      format.html
      format.pdf do
        render template: 'inqueries/related/capa', 
        pdf: 'Inqueritos'
      end
    end



  end

  # GET /inqueries/new
  def new
    @inquery = Inquery.new
  end

  # GET /inqueries/1/edit
  def edit
  end

  # POST /inqueries
  # POST /inqueries.json
  def create
    @inquery = Inquery.new(inquery_params)

    respond_to do |format|
      if @inquery.save
        format.html { redirect_to new_inquery_path, notice: 'Inquerito Criado com Sucesso' }
        format.json { render :show, status: :created, location: @inquery }
      else
        format.html { render :new }
        format.json { render json: @inquery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inqueries/1
  # PATCH/PUT /inqueries/1.json
  def update
    respond_to do |format|
      if @inquery.update(inquery_params)
        format.html { redirect_to @inquery, notice: 'Inquerito Atualizado com Sucesso' }
        format.json { render :show, status: :ok, location: @inquery }
      else
        format.html { render :edit }
        format.json { render json: @inquery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inqueries/1
  # DELETE /inqueries/1.json
  def destroy
    @inquery.destroy
    respond_to do |format|
      format.html { redirect_to inqueries_url, notice: 'Inquerito Removido com Sucesso' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inquery
      @inquery = Inquery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inquery_params
      params.require(:inquery).permit(:dp, :n, :year, :establishment, :conclusion, :seizure, :indiciado,:tp, :reported, :reported_date, :city_id, :origem, :tipo, :documento, :bo_id, :tco_id, :boc_id,
        capitulations_attributes: [:id, :law_id, :article, :paragraph, :subsection, :lines, :_destroy]).merge(registry_id: current_user.registry_id)
    end
  end
