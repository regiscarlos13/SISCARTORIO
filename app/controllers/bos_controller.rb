class BosController < ApplicationController
  before_action :set_bo, only: [:show, :edit, :update, :destroy]

  # GET /bos
  # GET /bos.json
  def index

    if params[:providenca] or params[:fato] or params[:start] or params[:natureza] and params[:end]
      @bos = Bo.all_user(current_user.registry_id).seach_providenca(params[:providenca]).search_bo_year(params[:fato]).search_bo_date(params[:start], params[:end]).seach_nature(params[:nature])
     else
      @bos = Bo.all_user(current_user.registry_id).where(providenca: 'Em Andamento')
     end

     printer('bos/shared/bos', 'Relação Bos')
     @natures = Nature.all

  end

  # GET /bos/1
  # GET /bos/1.json
  def show
  end

  # GET /bos/new
  def new
    @bo = Bo.new
  end

  # GET /bos/1/edit
  def edit
  end

  # POST /bos
  # POST /bos.json
  def create
    @bo = Bo.new(bo_params)

    respond_to do |format|
      if @bo.save
        format.html { redirect_to new_bo_path, notice: 'Bo Criado com Sucesso.' }
        format.json { render :show, status: :created, location: @bo }
      else
        format.html { render :new }
        format.json { render json: @bo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bos/1
  # PATCH/PUT /bos/1.json
  def update
    respond_to do |format|
      if @bo.update(bo_params)
        format.html { redirect_to @bo, notice: 'Bo Atualizado com Sucesso.' }
        format.json { render :show, status: :ok, location: @bo }
      else
        format.html { render :edit }
        format.json { render json: @bo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bos/1
  # DELETE /bos/1.json
  def destroy
    @bo.destroy
    respond_to do |format|
      format.html { redirect_to bos_url, notice: 'Bo apagado com Sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bo
      @bo = Bo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bo_params
      params.require(:bo).permit(:n, :ocorrencia, :fato, :nature_id, :providenca, :city_id).merge(registry_id: current_user.registry_id)
    end
end
