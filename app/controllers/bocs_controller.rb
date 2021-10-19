class BocsController < ApplicationController
  before_action :set_boc, only: [:show, :edit, :update, :destroy]

  # GET /bocs
  # GET /bocs.json
  def index
    @bocs = Boc.all_user(current_user.registry_id)
  end

  # GET /bocs/1
  # GET /bocs/1.json
  def show
  end

  # GET /bocs/new
  def new
    @boc = Boc.new
  end

  # GET /bocs/1/edit
  def edit
  end

  # POST /bocs
  # POST /bocs.json
  def create
    @boc = Boc.new(boc_params)

    respond_to do |format|
      if @boc.save
        format.html { redirect_to  new_boc_path, notice: 'Boc was successfully created.' }
        format.json { render :show, status: :created, location: @boc }
      else
        format.html { render :new }
        format.json { render json: @boc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bocs/1
  # PATCH/PUT /bocs/1.json
  def update
    respond_to do |format|
      if @boc.update(boc_params)
        format.html { redirect_to @boc, notice: 'Boc was successfully updated.' }
        format.json { render :show, status: :ok, location: @boc }
      else
        format.html { render :edit }
        format.json { render json: @boc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bocs/1
  # DELETE /bocs/1.json
  def destroy
    @boc.destroy
    respond_to do |format|
      format.html { redirect_to bocs_url, notice: 'Boc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_boc
      @boc = Boc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def boc_params
      params.require(:boc).permit(:dp, :n, :year, :establishment, :city_id, :providenca,:conclusion, :origem, :tipo, :documento, :inquery_id, :bo_id, :tco_id).merge(registry_id: current_user.registry_id)
    end
end
