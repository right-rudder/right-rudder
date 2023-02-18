class NewsletterEmailsController < ApplicationController
  before_action :set_newsletter_email, only: %i[ show edit update destroy ]
  before_action :authenticate_admin!, except: [:new, :edit, :create, :update, :confirm]
  invisible_captcha only: [:create, :update], honeypot: :confirm_email

  # GET /newsletter_emails or /newsletter_emails.json
  def index
    @newsletter_emails = NewsletterEmail.all
  end

  def confirm
    render 'confirm'
  end

  # GET /newsletter_emails/1 or /newsletter_emails/1.json
  def show
  end

  # GET /newsletter_emails/new
  def new
    @newsletter_email = NewsletterEmail.new
  end

  # GET /newsletter_emails/1/edit
  def edit
  end

  # POST /newsletter_emails or /newsletter_emails.json
  def create
    @newsletter_email = NewsletterEmail.new(newsletter_email_params)

    respond_to do |format|
      if @newsletter_email.save
        format.html { redirect_to newsletter_confirm_path, notice: @newsletter_email.name }
        format.json { render :show, status: :created, location: @newsletter_email }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @newsletter_email.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /newsletter_emails/1 or /newsletter_emails/1.json
  def update
    respond_to do |format|
      if @newsletter_email.update(newsletter_email_params)
        format.html { redirect_to newsletter_email_url(@newsletter_email), notice: "Newsletter email was successfully updated." }
        format.json { render :show, status: :ok, location: @newsletter_email }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @newsletter_email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /newsletter_emails/1 or /newsletter_emails/1.json
  def destroy
    @newsletter_email.destroy

    respond_to do |format|
      format.html { redirect_to newsletter_emails_url, notice: "Newsletter email was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_newsletter_email
      @newsletter_email = NewsletterEmail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def newsletter_email_params
      params.require(:newsletter_email).permit(:name, :email)
    end
end
