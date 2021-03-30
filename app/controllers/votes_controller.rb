class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :edit, :update, :destroy]

  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.all

    # Based on https://sampatbadhe.medium.com/export-data-to-csv-file-from-rails-console-ba61c6b47185
    # The code below saves the Ri and Zi values for all ballots as a CSV file
    require 'csv' 
    group = ECDSA::Group::Nistp256 
    file = "bigrizivalues.csv"
    headers = ["Ri x", "Ri y", "Zi x", "Zi y"]
    CSV.open(file, 'w', write_headers: true, headers: headers) do |writer|
      @votes.each do |vote| 
      writer << [ECDSA::Format::PointOctetString.decode(vote.big_ri, group).x, ECDSA::Format::PointOctetString.decode(vote.big_ri, group).y, ECDSA::Format::PointOctetString.decode(vote.big_zi, group).x, ECDSA::Format::PointOctetString.decode(vote.big_zi, group).y] 
      end
    end

  end

  # https://stackoverflow.com/questions/39069840/rails-link-to-download-file
  def download
    send_file 'bigrizivalues.csv', type: 'text/csv', status: 202
  end

  # GET /votes/1
  # GET /votes/1.json
  def show
  end

  # GET /votes/new
  def new
    @vote = Vote.new
  end

  # GET /votes/1/edit
  def edit
  end

  # POST /votes
  # POST /votes.json
  def create
    @vote = Vote.new(vote_params)

    respond_to do |format|
      if @vote.save
        format.html { redirect_to @vote, notice: 'Vote was successfully created.' }
        format.json { render :show, status: :created, location: @vote }
      else
        format.html { render :new }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /votes/1
  # PATCH/PUT /votes/1.json
  def update
    respond_to do |format|
      if @vote.update(vote_params)
        format.html { redirect_to @vote, notice: 'Vote was successfully updated.' }
        format.json { render :show, status: :ok, location: @vote }
      else
        format.html { render :edit }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote.destroy
    respond_to do |format|
      format.html { redirect_to votes_url, notice: 'Vote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vote_params
      params.require(:vote).permit(:index, :big_ri, :big_zi, :pwf, :status, :user_id, :vote)
    end
end
