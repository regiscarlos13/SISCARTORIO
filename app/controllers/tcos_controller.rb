class TcosController < ApplicationController
    before_action :set_tco, only: [:show, :edit, :update, :destroy]
    before_action :tipy_enuns
    
  # GET /tcos
  # GET /tcos.json
  def index
    if params[:conclusion] or params[:providenca] or params[:year] or params[:start] and params[:end]
      @tcos = Tco.all_user(current_user.registry_id).search_conclusion(params[:conclusion]).search_year(params[:year]).date(params[:start], params[:end]).seach_providenca(params[:providenca])
    else
      @tcos = Tco.all_user(current_user.registry_id).where(conclusion: 0)
    end

    printer('tcos/shared/tcos', 'Relação de TCOs')
  end

  # GET /tcos/1
  # GET /tcos/1.json
  def show
  end

  # GET /tcos/new
  def new
    @tco = Tco.new
  end

  # GET /tcos/1/edit
  def edit
  end

  # POST /tcos
  # POST /tcos.json
  def create
    @tco = Tco.new(tco_params)

    respond_to do |format|
      if @tco.save
        format.html { redirect_to new_tco_path, notice: 'Tco was successfully created.' }
        format.json { render :show, status: :created, location: @tco }
      else
        format.html { render :new }
        format.json { render json: @tco.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tcos/1
  # PATCH/PUT /tcos/1.json
  def update
    respond_to do |format|
      if @tco.update(tco_params)
        format.html { redirect_to @tco, notice: 'Tco was successfully updated.' }
        format.json { render :show, status: :ok, location: @tco }
      else
        format.html { render :edit }
        format.json { render json: @tco.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tcos/1
  # DELETE /tcos/1.json
  def destroy
    @tco.destroy
    respond_to do |format|
      format.html { redirect_to tcos_url, notice: 'Tco was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tco
      @tco = Tco.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tco_params
      params.require(:tco).permit(:dp, :n, :year, :establishment, :city_id, :providenca, :conclusion, :origem, :tipo, :documento, :bo_id, :boc_id, :inquery_id).merge(registry_id: current_user.registry_id)
    end

    def tipy_enuns
      @tipotcos = Tco.tipos.keys
    end


  end
