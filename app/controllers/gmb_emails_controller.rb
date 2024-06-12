
class GmbEmailsController < ApplicationController
  before_action :set_gmb_email, only: %i[ show edit update destroy ]
  before_action :authenticate_admin!, except: [:new, :edit, :create, :update, :confirm]
  #invisible_captcha only: [:create, :update], honeypot: :confirm_email

  # GET /gmb_emails or /gmb_emails.json
  def index
    @gmb_emails = GmbEmail.all
  end

  def confirm
    render 'confirm'
  end

  # GET /gmb_emails/1 or /gmb_emails/1.json
  def show
  end

  # GET /gmb_emails/new
  def new
    @gmb_email = GmbEmail.new
  end

  # GET /gmb_emails/1/edit
  def edit
  end

  # POST /gmb_emails or /gmb_emails.json
  def create
    @gmb_email = GmbEmail.new(gmb_email_params)

    respond_to do |format|
      if @gmb_email.save
        GmbMailer.gmb(@gmb_email.email, @gmb_email.name).deliver_later
        format.html { redirect_to gmb_confirm_path, notice: @gmb_email.name }
        format.json { render :show, status: :created, location: @gmb_email }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gmb_email.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gmb_emails/1 or /gmb_emails/1.json
  def update
    respond_to do |format|
      if @gmb_email.update(gmb_email_params)
        format.html { redirect_to gmb_email_url(@gmb_email), notice: "gmb email was successfully updated." }
        format.json { render :show, status: :ok, location: @gmb_email }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gmb_email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gmb_emails/1 or /gmb_emails/1.json
  def destroy
    @gmb_email.destroy

    respond_to do |format|
      format.html { redirect_to gmb_emails_url, notice: "Gmb email was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gmb_email
      @gmb_email = GmbEmail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gmb_email_params
      params.require(:gmb_email).permit(:name, :phone, :email)
    end
end
