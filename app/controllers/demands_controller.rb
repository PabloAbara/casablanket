class DemandsController < ApplicationController
  before_action :set_demand, only: %i[ show edit update destroy ]

  # GET /demands or /demands.json
  def index
    @demands = Demand.all
  end

  # GET /demands/1 or /demands/1.json
  def show
  end

  # GET /demands/new
  def new
    @offer = params[:offer_id]
    @assign_options = Assign.all.filter { |a| a.user_id == current_user.id }

    @demand = Demand.new
  end

  # GET /demands/1/edit
  def edit
  end

  # POST /demands or /demands.json
  def create
    @demand = Demand.new(demand_params)

    respond_to do |format|
      if @demand.save
        format.html { redirect_to demand_url(@demand), notice: "Demand was successfully created." }
        format.json { render :show, status: :created, location: @demand }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @demand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /demands/1 or /demands/1.json
  def update
    respond_to do |format|
      if @demand.update(demand_params)
        format.html { redirect_to demand_url(@demand), notice: "Demand was successfully updated." }
        format.json { render :show, status: :ok, location: @demand }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @demand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /demands/1 or /demands/1.json
  def destroy
    @demand.destroy

    respond_to do |format|
      format.html { redirect_to demands_url, notice: "Demand was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_demand
      @demand = Demand.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def demand_params
      params.require(:demand).permit(:offer_id, :message, :status, :response_assign_id, :direction)
    end
end
