
class SopEmailsController < ApplicationController
  before_action :set_sop_email, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:new, :edit, :create, :update, :confirm]
  #invisible_captcha only: [:create, :update], honeypot: :confirm_email

  # GET /sop_emails or /sop_emails.json
  def index
    @sop_emails = SopEmail.all
  end

  def confirm
    render 'confirm'
  end

  # GET /sop_emails/1 or /sop_emails/1.json
  def show
  end

  # GET /sop_emails/new
  def new
    @sop_email = SopEmail.new
  end

  # GET /sop_emails/1/edit
  def edit
  end

  # POST /sop_emails or /sop_emails.json
  def create
    @sop_email = SopEmail.new(sop_email_params)

    respond_to do |format|
      if @sop_email.save
        SopMailer.sop(@sop_email.email, @sop_email.name).deliver_later
        format.html { redirect_to sop_confirm_path, notice: @sop_email.name }
        format.json { render :show, status: :created, location: @sop_email }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sop_email.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sop_emails/1 or /sop_emails/1.json
  def update
    respond_to do |format|
      if @sop_email.update(sop_email_params)
        format.html { redirect_to sop_email_url(@sop_email), notice: "sop email was successfully updated." }
        format.json { render :show, status: :ok, location: @sop_email }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sop_email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sop_emails/1 or /sop_emails/1.json
  def destroy
    @sop_email.destroy

    respond_to do |format|
      format.html { redirect_to sop_emails_url, notice: "Sop email was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sop_email
      @sop_email = SopEmail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sop_email_params
      params.require(:sop_email).permit(:name, :phone, :email)
    end
end
