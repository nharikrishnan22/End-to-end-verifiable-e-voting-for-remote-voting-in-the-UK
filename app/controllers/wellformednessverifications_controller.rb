class WellformednessverificationsController < ApplicationController
  before_action :set_wellformednessverification, only: [:show, :edit, :update, :destroy]

  # GET /wellformednessverifications
  # GET /wellformednessverifications.json
  def index
    @wellformednessverifications = Wellformednessverification.all
  end

  # GET /wellformednessverifications/1
  # GET /wellformednessverifications/1.json
  def show
  end

  # GET /wellformednessverifications/new
  def new
    @wellformednessverification = Wellformednessverification.new
  end

  # GET /wellformednessverifications/1/edit
  def edit
  end

  # POST /wellformednessverifications
  # POST /wellformednessverifications.json
  def create
    @wellformednessverification = Wellformednessverification.new(wellformednessverification_params)

    respond_to do |format|
      if @wellformednessverification.save
        format.html { redirect_to @wellformednessverification, notice: 'Wellformednessverification was successfully created.' }
        format.json { render :show, status: :created, location: @wellformednessverification }
      else
        format.html { render :new }
        format.json { render json: @wellformednessverification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wellformednessverifications/1
  # PATCH/PUT /wellformednessverifications/1.json
  def update
    respond_to do |format|
      if @wellformednessverification.update(wellformednessverification_params)
        format.html { redirect_to @wellformednessverification, notice: 'Wellformednessverification was successfully updated.' }
        format.json { render :show, status: :ok, location: @wellformednessverification }
      else
        format.html { render :edit }
        format.json { render json: @wellformednessverification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wellformednessverifications/1
  # DELETE /wellformednessverifications/1.json
  def destroy
    @wellformednessverification.destroy
    respond_to do |format|
      format.html { redirect_to wellformednessverifications_url, notice: 'Wellformednessverification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wellformednessverification
      @wellformednessverification = Wellformednessverification.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wellformednessverification_params
      params.require(:wellformednessverification).permit(:g1_x, :g1_y, :g2_x, :g2_y, :c_1, :c_2, :r_1, :r_2, :big_ri_x, :big_ri_y, :big_zi_x, :big_zi_y )
    end
end
