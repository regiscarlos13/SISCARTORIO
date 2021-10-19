class SeizuresController < ApplicationController
  before_action :set_seizure, only: [:show, :edit, :update, :destroy]

  # GET /seizures
  # GET /seizures.json
  def index
    @inqueries = Inquery.all_user(current_user.registry_id).where(conclusion: 0)
    @seizures = Seizure.where(inquery_id: @inqueries)
  end

  # GET /seizures/1
  # GET /seizures/1.json
  def show
  end

  # GET /seizures/new
  def new
    @seizure = Seizure.new
  end

  # GET /seizures/1/edit
  def edit
  end

  # POST /seizures
  # POST /seizures.json
  def create
    @seizure = Seizure.new(seizure_params)

    respond_to do |format|
      if @seizure.save
        format.html { redirect_to @seizure, notice: 'Seizure was successfully created.' }
        format.json { render :show, status: :created, location: @seizure }
      else
        format.html { render :new }
        format.json { render json: @seizure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /seizures/1
  # PATCH/PUT /seizures/1.json
  def update
    respond_to do |format|
      if @seizure.update(seizure_params)
        format.html { redirect_to @seizure, notice: 'Seizure was successfully updated.' }
        format.json { render :show, status: :ok, location: @seizure }
      else
        format.html { render :edit }
        format.json { render json: @seizure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seizures/1
  # DELETE /seizures/1.json
  def destroy
    @seizure.destroy
    respond_to do |format|
      format.html { redirect_to seizures_url, notice: 'Seizure was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seizure
      @seizure = Seizure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def seizure_params
      params.require(:seizure).permit(:procedimento, :inquery_id, :boc_id, :bo_id, :tco_id, :name, :destino, :doc, :data, :veiculo, :tipo_veiculo, :cor, :placa, :chassi, :quantidade)
    end
end
