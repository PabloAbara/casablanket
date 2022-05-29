class AssignsController < ApplicationController
  before_action :set_assign, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /assigns or /assigns.json
  def index
    @assigns = Assign.all.select{|a| a[:user_id] == current_user.id}
  end

  # GET /assigns/1 or /assigns/1.json
  def show
  end

  # GET /assigns/new
  def new
    @assign = Assign.new
  end

  # GET /assigns/1/edit
  def edit
  end

  # POST /assigns or /assigns.json
  def create
    @assign = Assign.new(assign_params)
    @assign.user_id = current_user.id

    respond_to do |format|
      if @assign.save
        format.html { redirect_to assign_url(@assign), notice: "Assign was successfully created." }
        format.json { render :show, status: :created, location: @assign }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @assign.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assigns/1 or /assigns/1.json
  def update
    respond_to do |format|
      if @assign.update(assign_params)
        format.html { redirect_to assign_url(@assign), notice: "Assign was successfully updated." }
        format.json { render :show, status: :ok, location: @assign }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @assign.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assigns/1 or /assigns/1.json
  def destroy
    @assign.destroy

    respond_to do |format|
      format.html { redirect_to assigns_url, notice: "Assign was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assign
      @assign = Assign.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def assign_params
      params.require(:assign).permit(:block, :status)
    end
end
