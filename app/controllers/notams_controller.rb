class NotamsController < ApplicationController
  before_action :set_notam, only: %i[ show edit update destroy ]
  before_action :authenticate_admin!, except: [:index, :show, :webinars, :webinar_confirmation, :bm, :af, :na, :all]

  def draft #drafts
    @notams = Notam.all
  end
  
  def all #all
    @notams = Notam.all
  end
  
  def bm #business and marketing
    @notams = Notam.business_and_marketing.all
  end

  def af #aviation and flying
    @notams = Notam.aviation_and_flying.all
  end

  def na #news and annoucements
    @notams = Notam.news_and_annoucements.all
  end
  
  def webinars
    @notams = Notam.webinar
  end

  def webinar_confirmation
  end

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
      @notam = Notam.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def notam_params
      params.require(:notam).permit(:title, :notam_date, :author, :notam_body, :category, :status, :tags, :meta_description, :meta_keywords, :feature_image, :featured, :webinar)
    end
end
