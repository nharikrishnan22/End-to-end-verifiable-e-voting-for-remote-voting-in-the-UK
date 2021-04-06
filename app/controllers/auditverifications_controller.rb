class AuditverificationsController < ApplicationController
  before_action :set_auditverification, only: [:show, :edit, :update, :destroy]

  # GET /auditverifications
  # GET /auditverifications.json
  def index
    @auditverifications = Auditverification.all
  end

  # GET /auditverifications/1
  # GET /auditverifications/1.json
  def show
  end

  # GET /auditverifications/new
  def new
    @auditverification = Auditverification.new
  end

  # GET /auditverifications/1/edit
  def edit
  end

  # POST /auditverifications
  # POST /auditverifications.json
  def create
    @auditverification = Auditverification.new(auditverification_params)

    respond_to do |format|
      if @auditverification.save
        format.html { redirect_to @auditverification, notice: 'Auditverification was successfully created.' }
        format.json { render :show, status: :created, location: @auditverification }
      else
        format.html { render :new }
        format.json { render json: @auditverification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auditverifications/1
  # PATCH/PUT /auditverifications/1.json
  def update
    respond_to do |format|
      if @auditverification.update(auditverification_params)
        format.html { redirect_to @auditverification, notice: 'Auditverification was successfully updated.' }
        format.json { render :show, status: :ok, location: @auditverification }
      else
        format.html { render :edit }
        format.json { render json: @auditverification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auditverifications/1
  # DELETE /auditverifications/1.json
  def destroy
    @auditverification.destroy
    respond_to do |format|
      format.html { redirect_to auditverifications_url, notice: 'Auditverification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auditverification
      @auditverification = Auditverification.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def auditverification_params
      params.require(:auditverification).permit(:big_ri, :big_zi, :g1_x, :g1_y, :g2_x, :g2_y, :vote, :ri)
    end
end
