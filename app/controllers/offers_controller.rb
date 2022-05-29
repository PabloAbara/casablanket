class OffersController < ApplicationController
  before_action :set_offer, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /offers or /offers.json
  def index
    @offers = Offer.all
  end

  # GET /offers/1 or /offers/1.json
  def show
    if params[:id] != ""
      @demands = Demand.all.select { |a| a.offer_id == params[:id].to_i}
    end
  end

  # GET /offers/new
  def new
    @assign = params[:assign_id]
    @offer = Offer.new
    
  end

  # GET /offers/1/edit
  def edit
  end

  # POST /offers or /offers.json
  def create()
    @offer = Offer.new(offer_params)

    respond_to do |format|
      if @offer.save
        format.html { redirect_to offer_url(@offer), notice: "Offer was successfully created." }
        format.json { render :show, status: :created, location: @offer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offers/1 or /offers/1.json
  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to offer_url(@offer), notice: "Offer was successfully updated." }
        format.json { render :show, status: :ok, location: @offer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1 or /offers/1.json
  def destroy
    @offer.destroy

    respond_to do |format|
      format.html { redirect_to "/", notice: "Se ha eliminado la oferta." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def offer_params
      params.require(:offer).permit(:assign_id, :message, :status)
    end
end
