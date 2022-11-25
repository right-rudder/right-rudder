class WebinarsController < ApplicationController
  before_action :set_webinar, only: %i[ show edit update destroy ]

  # GET /webinars or /webinars.json
  def index
    @webinars = Webinar.all
    @newsletter_email = NewsletterEmail.new
  end

  # GET /webinars/1 or /webinars/1.json
  def show
  end

  # GET /webinars/new
  def new
    @webinar = Webinar.new
  end

  # GET /webinars/1/edit
  def edit
  end

  # POST /webinars or /webinars.json
  def create
    @webinar = Webinar.new(webinar_params)

    respond_to do |format|
      if @webinar.save
        format.html { redirect_to webinar_url(@webinar), notice: "Webinar was successfully created." }
        format.json { render :show, status: :created, location: @webinar }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @webinar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /webinars/1 or /webinars/1.json
  def update
    respond_to do |format|
      if @webinar.update(webinar_params)
        format.html { redirect_to webinar_url(@webinar), notice: "Webinar was successfully updated." }
        format.json { render :show, status: :ok, location: @webinar }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @webinar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /webinars/1 or /webinars/1.json
  def destroy
    @webinar.destroy

    respond_to do |format|
      format.html { redirect_to webinars_url, notice: "Webinar was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_webinar
      @webinar = Webinar.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def webinar_params
      params.require(:webinar).permit(:title, :host, :webinar_date, :meta_description, :meta_keywords)
    end
end
