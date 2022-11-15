class NotamsController < ApplicationController
  before_action :set_notam, only: %i[ show edit update destroy ]

  # GET /notams or /notams.json
  def index
    @notams = Notam.all
  end

  # GET /notams/1 or /notams/1.json
  def show
  end

  # GET /notams/new
  def new
    @notam = Notam.new
  end

  # GET /notams/1/edit
  def edit
  end

  # POST /notams or /notams.json
  def create
    @notam = Notam.new(notam_params)

    respond_to do |format|
      if @notam.save
        format.html { redirect_to notam_url(@notam), notice: "Notam was successfully created." }
        format.json { render :show, status: :created, location: @notam }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @notam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notams/1 or /notams/1.json
  def update
    respond_to do |format|
      if @notam.update(notam_params)
        format.html { redirect_to notam_url(@notam), notice: "Notam was successfully updated." }
        format.json { render :show, status: :ok, location: @notam }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @notam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notams/1 or /notams/1.json
  def destroy
    @notam.destroy

    respond_to do |format|
      format.html { redirect_to notams_url, notice: "Notam was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notam
      @notam = Notam.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def notam_params
      params.require(:notam).permit(:title, :notam_date, :author, :notam_body)
    end
end
