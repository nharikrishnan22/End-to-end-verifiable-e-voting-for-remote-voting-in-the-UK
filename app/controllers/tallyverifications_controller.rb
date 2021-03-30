class TallyverificationsController < ApplicationController
  before_action :set_tallyverification, only: [:show, :edit, :update, :destroy]

  # GET /tallyverifications
  # GET /tallyverifications.json
  def index
    @tallyverifications = Tallyverification.all
  end

  # GET /tallyverifications/1
  # GET /tallyverifications/1.json
  def show
  end

  # GET /tallyverifications/new
  def new
    @tallyverification = Tallyverification.new
  end

  # GET /tallyverifications/1/edit
  def edit
  end

  # POST /tallyverifications
  # POST /tallyverifications.json

  def create
    @tallyverification = Tallyverification.new(tallyverification_params)

    respond_to do |format|
      if @tallyverification.save
        format.html { redirect_to @tallyverification, notice: 'Tallyverification was successfully created.' }
        format.json { render :show, status: :created, location: @tallyverification }
      else
        format.html { render :new }
        format.json { render json: @tallyverification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tallyverifications/1
  # PATCH/PUT /tallyverifications/1.json
  def update
    respond_to do |format|
      if @tallyverification.update(tallyverification_params)
        format.html { redirect_to @tallyverification, notice: 'Tallyverification was successfully updated.' }
        format.json { render :show, status: :ok, location: @tallyverification }
      else
        format.html { render :edit }
        format.json { render json: @tallyverification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tallyverifications/1
  # DELETE /tallyverifications/1.json
  def destroy
    @tallyverification.destroy
    respond_to do |format|
      format.html { redirect_to tallyverifications_url, notice: 'Tallyverification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tallyverification
      @tallyverification = Tallyverification.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tallyverification_params
      params.require(:tallyverification).permit(:g1_x, :g1_y, :g2_x, :g2_y, :s, :t, :bigrizivalues)
    end
end
